




```markdown
# Controls Labs – Lab 1

This repository contains the work for **EEE3094S Control Systems Lab 1**, focused on system identification and validation using **step response** and **frequency response** tests.

---

## 📂 Repository Structure

```

Controls-Labs/
└── Lab 1/
├── Data/                           # Experimental data (CSV + screenshots)
│   ├── F34BSuspensionTestData-Part 1 Test 1.CSV
│   ├── F34BSuspensionTestData-Part 1 Test 2.CSV
│   ├── F34BSuspensionTestData Part 2 Test <freq>.CSV
│   └── Screenshot (63–66).png
│
├── Bode\_Plots\_Data.csv             # Processed frequency response estimates
├── MATLAB\_Bode\_Plot\_G\_F\_X.m        # MATLAB script for Bode validation
├── MATLAB\_Bode\_Plot\_G\_F\_X.png      # Bode plot generated in MATLAB
└── MTHNYI011\_EEE3094S\_LAB1\_REPORT.ipynb   # Lab 1 report (Jupyter Notebook)

````

---

## 🔬 Lab Overview

- **Step Response Test:**  
  Collected experimental data from the suspension simulator, processed and modeled as a second-order system.

- **Frequency Response Test:**  
  Measured sinusoidal steady-state responses over a range of frequencies, generated Bode plots and identified system parameters.

- **Analysis:**  
  Compared results from both methods, derived transfer functions and proposed an averaged model.

- **Validation:**  
  Used MATLAB and Python to validate models against experimental data via step and frequency responses.

---

## 🛠️ Tools Used
- **Python (NumPy, SciPy, Matplotlib, Pandas)** – Data processing and plotting  
- **MATLAB** – Model validation (Bode plots)  
- **Jupyter Notebook** –  Code Report writing and combined analysis  
- **Overleaf** - Report Writing

---

## 🚀 How to Run
1. Download or Clone the folder:
   ```bash
   git clone https://github.com/Clifford100/Controls-Labs
   cd Controls-Labs/Lab\ 1
````

2. Open the Jupyter notebook:

   ```bash
   jupyter notebook MTHNYI011_EEE3094S_LAB1_REPORT.ipynb
   ```
3. Run the MATLAB script:

   ```matlab
   MATLAB_Bode_Plot_G_F_X.m
   ```

---

## ✍️ Author

* **Nyiko Mathebula (MTHNYI011)** – EEE3094S Control Systems Lab 1

````


