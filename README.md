# Sequential Logic Datasets with Designs

> Collection of datasets and design files for sequential digital circuits, used to train and evaluate neural networks that duplicate circuit functionality.

---

## Table of contents

- [Overview](#overview)  
- [Quickstart](#quickstart)  
- [Repository contents](#repository-contents)  
- [Dataset format](#dataset-format)  
- [How to generate new datasets](#how-to-generate-new-datasets)  
- [Usage with main project](#usage-with-main-project)  
- [License](#license)  
- [Contact / Acknowledgements](#contact--acknowledgements)

---

## Overview

This repository contains sequential logic designs (VHDL and Quartus schematic files), testbenches, and corresponding datasets of input/output traces. These datasets are used by the companion project [Digital-IC-Functionality-Duplication-Using-NN](https://github.com/Anjanamb/Digital-IC-Functionality-Duplication-Using-NN) to train neural-network models that approximate digital circuit behavior.

---

## Quickstart

1. Clone the repository:
```bash
git clone https://github.com/Anjanamb/Sequential-Logic-Datasets-with-Designs.git
cd Sequential-Logic-Datasets-with-Designs
```

2. Browse the available circuit designs and their corresponding datasets.

3. Copy the required dataset `.txt` files into the `data/` folder of the main project for training.

---

## Repository contents

```
Sequential-Logic-Datasets-with-Designs/
├─ Designs/          # VHDL designs, Quartus schematic (.bdf), and testbenches (.vhd)
├─ Datasets/         # Generated input/output/state traces in text format
├─ Scripts/          # Simulation and dataset-preparation scripts
└─ README.md
```

- **Designs/** – contains source circuit designs (flip-flops, counters, shift registers, etc.).  
- **Datasets/** – plain-text traces derived from testbenches (aligned inputs and outputs).  
- **Scripts/** – helper scripts to run simulations and extract traces.

---

## Dataset format

Each dataset file (`.txt`) contains aligned columns of **inputs**, **states**, and **outputs** observed from the circuit simulation.

Typical format:
```
clk in1 in2 state out1 out2
0   0   1   00    0    1
1   1   0   01    1    0
...
```

- **clk**: clock cycle  
- **inX**: circuit inputs  
- **state**: encoded internal state (binary string or integer)  
- **outX**: observed outputs

---

## How to generate new datasets

1. Modify or create a new VHDL/Quartus design in `Designs/`.  
2. Write a testbench (`.vhd`) to simulate input patterns.  
3. Run simulation in ModelSim/Quartus and export results.  
4. Convert the simulation output to a plain `.txt` trace (using scripts in `Scripts/`).  
5. Place the generated dataset in `Datasets/`.

---

## Usage with main project

To use these datasets with the neural-network training project:

1. Generate or select a dataset from `Datasets/`.  
2. Copy or symlink it into the `data/` folder of [Digital-IC-Functionality-Duplication-Using-NN](https://github.com/Anjanamb/Digital-IC-Functionality-Duplication-Using-NN).  
3. Pass the dataset path to the training script (see main project README).

---

## License

MIT License – feel free to use, modify, and share. Please credit the repository if used in research or academic work.

---

## Contact / Acknowledgements

Author: **Anjana Bandara** (GitHub: [Anjanamb](https://github.com/Anjanamb))  
Contributors: [Ayesh-Rajakaruna](https://github.com/Ayesh-Rajakaruna), [sahannt98](https://github.com/sahannt98)
