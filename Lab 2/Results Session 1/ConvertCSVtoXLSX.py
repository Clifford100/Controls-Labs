import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import control as ctl
import glob

# List of CSV files
files = ["HelicopterData v0.csv", "HelicopterData v1.csv", "HelicopterData v2.csv"]

def process_file(file_path):
    df = pd.read_csv(file_path)

    # Calculate velocity
    delta_position = df['Output(m)'].diff()
    delta_time = df['Time(s)'].diff()
    df['Velocity'] = delta_position / delta_time
    df['Velocity'].fillna(0, inplace=True)

    # Find where the input step begins (first significant change)
    step_start_idx = df['Input(v)'].diff().abs().gt(0.05).idxmax()
    df = df.loc[step_start_idx:].reset_index(drop=True)

    # Re-shift time so it starts at 0
    df['Time(s)'] -= df['Time(s)'].iloc[0]

    return df

# Create plots
fig, axs = plt.subplots(len(files), 2, figsize=(14, 12))

for i, file in enumerate(files):
    df = process_file(file)

    # Plot Input vs Time
    axs[i, 0].plot(df['Time(s)'], df['Input(v)'], color='blue')
    axs[i, 0].set_title(f'{file} - Input Voltage vs Time')
    axs[i, 0].set_xlabel('Time (s)')
    axs[i, 0].set_ylabel('Input (V)')
    axs[i, 0].grid(True)

    # Plot Velocity vs Time
    axs[i, 1].plot(df['Time(s)'], df['Velocity'], color='green')
    axs[i, 1].set_title(f'{file} - Velocity vs Time')
    axs[i, 1].set_xlabel('Time (s)')
    axs[i, 1].set_ylabel('Velocity (m/s)')
    axs[i, 1].grid(True)

plt.tight_layout()
plt.show()
