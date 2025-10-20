```markdown
# Controls Labs – EEE3094S

This repository contains the work for **EEE3094S Control Systems Labs**, including system identification, validation, and proportional controller design.

---

## 📂 Repository Structure

```
Controls-Labs/
├── Lab 1/                             # System Identification Lab
│   ├── Data/                          # Experimental data (CSV + screenshots)
│   │   ├── F34BSuspensionTestData-Part 1 Test 1.CSV
│   │   ├── F34BSuspensionTestData-Part 1 Test 2.CSV
│   │   ├── F34BSuspensionTestData Part 2 Test <freq>.CSV
│   │   └── Screenshot (63–66).png
│   │
│   ├── Bode_Plots_Data.csv               # Processed frequency response estimates
│   ├── MATLAB_Bode_Plot_G_F_X.m          # MATLAB script for Bode validation
│   ├── MATLAB_Bode_Plot_G_F_X.png        # Bode plot generated in MATLAB
│   └── MTHNYI011_EEE3094S_LAB1_REPORT.ipynb   # Lab 1 report (Jupyter Notebook)
│
└── Lab 2/                             # Proportional Control Lab - Kitticopter
    ├── Results Session 1/              # System Identification Results
    │   ├── HelicopterData v0.csv       # Step test data - trial 1
    │   ├── HelicopterData v1.csv       # Step test data - trial 2  
    │   ├── HelicopterData v2.csv       # Step test data - trial 3
    │   ├── HelicopterData v0_plot.png  # Step response plots
    │   ├── HelicopterData v1_plot.png
    │   ├── HelicopterData v2_plot.png
    │   ├── validation_v0.png           # Model validation plots
    │   ├── validation_v1.png
    │   ├── validation_v2.png
    │   ├── 3outputT1.png               # Additional test results
    │   ├── 3outputT2.png
    │   ├── 3outputT3.png
    │   ├── Screenshot (1-3).png        # Experimental setup screenshots
    │   ├── ConvertCSVtoXLSX.py         # Data conversion script
    │   └── MTHNYI011_3094S_LAB2_REPORT.ipynb  # Lab 2 report (run from here)
    │
    ├── Results Session 2/              # Controller Testing Results
    │   ├── Design1.m                   # MATLAB controller design scripts
    │   ├── Design2.m
    │   ├── Design3.m
    │   ├── Design4.m
    │   ├── Design5.m
    │   ├── Figure1.png                 # Controller performance plots
    │   ├── Figure2.png
    │   ├── Figure3.png
    │   ├── HelicopterData1.csv         # Closed-loop test data
    │   ├── MTHNYI011.bmp               # Controller circuit design
    │   └── Screenshot (1-4).png        # Controller test screenshots
    │
    ├── MTHNYI011_3094S_LAB2_REPORT.ipynb    # Main Lab 2 report (backup copy)
    └── MTHNYI011_Kitti_Model_LAB2.slx       # Simulink kitticopter model
```

---

## 🔬 Lab Overview

### Lab 1: System Identification
- **Step Response Test:**  
  Experimental data collected from the suspension simulator, processed and modeled as a second-order system.

- **Frequency Response Test:**  
  Sinusoidal steady-state responses measured over a range of frequencies; Bode plots generated and system parameters identified.

- **Analysis:**  
  Results from both methods compared, transfer functions derived, and an averaged model proposed.

- **Validation:**  
  Models validated against experimental data using MATLAB and Python (step and frequency responses).

### Lab 2: Proportional Control - Kitticopter
- **System Identification:**  
  Step tests performed to determine kitticopter aerodynamic parameters and develop transfer function model.

- **Proportional Controller Design:**  
  Designed to meet specifications: >92% tracking accuracy, <30% overshoot, and robustness to parameter variations.

- **Controller Implementation:**  
  Physical controller built on Veroboard and tested with simulated kitticopter system.

- **Performance Validation:**  
  Controller tested against step inputs and evaluated against all design specifications.

---

## 🛠️ Tools Used

- **Python (NumPy, SciPy, Matplotlib, Pandas):** Data processing and plotting  
- **MATLAB/Simulink:** System modeling and controller design validation
- **Jupyter Notebook:** Report writing and combined analysis  
- **Overleaf:** Report writing
- **Electronic Components:** Op-amps, resistors for physical controller implementation

---

## 📖 Viewing & Using the Notebooks

You can view the lab reports (`.ipynb` files) directly on GitHub to see all code and analysis.  
To run or test the code with the provided data, download or clone the repository to your device and ensure you have both the notebook files and the data folders.

## 🚀 How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Clifford100/Controls-Labs
   ```

2. **For Lab 1:**
   ```bash
   cd "Controls-Labs/Lab 1"
   jupyter notebook MTHNYI011_EEE3094S_LAB1_REPORT.ipynb
   ```

3. **For Lab 2 - IMPORTANT:**
   ```bash
   cd "Controls-Labs/Lab 2/Results Session 1"
   jupyter notebook MTHNYI011_3094S_LAB2_REPORT.ipynb
   ```
   **Note:** The Lab 2 notebook must be run from within the `Results Session 1` folder because it directly accesses the CSV data files in that directory. A backup copy is also available in the main Lab 2 folder.

4. **Run MATLAB scripts:**
   - Lab 1: Open `MATLAB_Bode_Plot_G_F_X.m` in MATLAB
   - Lab 2: Open any `Design*.m` files in MATLAB for controller analysis

---

## ✍️ Author

**Nyiko Mathebula (MTHNYI011)** – EEE3094S Control Systems Labs
```