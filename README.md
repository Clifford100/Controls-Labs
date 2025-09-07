# Controls Labs – Lab 1

This repository contains the work for **EEE3094S Control Systems Lab 1**, focused on system identification and validation using **step response** and **frequency response** tests.

---

## 📂 Repository Structure

```
Controls-Labs/
└── Lab 1/
    ├── Data/                             # Experimental data (CSV + screenshots)
    │   ├── F34BSuspensionTestData-Part 1 Test 1.CSV
    │   ├── F34BSuspensionTestData-Part 1 Test 2.CSV
    │   ├── F34BSuspensionTestData Part 2 Test <freq>.CSV
    │   └── Screenshot (63–66).png
    │
    ├── Bode_Plots_Data.csv               # Processed frequency response estimates
    ├── MATLAB_Bode_Plot_G_F_X.m          # MATLAB script for Bode validation
    ├── MATLAB_Bode_Plot_G_F_X.png        # Bode plot generated in MATLAB
    └── MTHNYI011_EEE3094S_LAB1_REPORT.ipynb   # Lab 1 report (Jupyter Notebook)
```

---

## 🔬 Lab Overview

- **Step Response Test:**  
  Experimental data collected from the suspension simulator, processed and modeled as a second-order system.

- **Frequency Response Test:**  
  Sinusoidal steady-state responses measured over a range of frequencies; Bode plots generated and system parameters identified.

- **Analysis:**  
  Results from both methods compared, transfer functions derived, and an averaged model proposed.

- **Validation:**  
  Models validated against experimental data using MATLAB and Python (step and frequency responses).

---

## 🛠️ Tools Used

- **Python (NumPy, SciPy, Matplotlib, Pandas):** Data processing and plotting  
- **MATLAB:** Model validation (Bode plots)  
- **Jupyter Notebook:** Report writing and combined analysis  
- **Overleaf:** Report writing

---

## 🚀 How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Clifford100/Controls-Labs
   cd "Controls-Labs/Lab 1"
   ```

2. **Open the Jupyter notebook:**
   ```bash
   jupyter notebook MTHNYI011_EEE3094S_LAB1_REPORT.ipynb
   ```

3. **Run the MATLAB script:**
   Open `MATLAB_Bode_Plot_G_F_X.m` in MATLAB and run the script.

---

## ✍️ Author

**Nyiko Mathebula (MTHNYI011)** – EEE3094S Control Systems Lab


