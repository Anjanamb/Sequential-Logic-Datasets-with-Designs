# Sequential Logic Datasets with Designs

> Datasets and design files for sequential digital circuits — training/eval data for the [neural-network digital-twin work](https://github.com/Anjanamb/Digital-IC-Functionality-Duplication-Using-NN) published at IEEE ICIIS 2023.

[![Quartus](https://img.shields.io/badge/Intel-Quartus_Prime-0071C5?style=flat-square&logo=intel&logoColor=white)](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/overview.html)
[![VHDL](https://img.shields.io/badge/HDL-VHDL-1F2937?style=flat-square)](https://en.wikipedia.org/wiki/VHDL)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---

## What's here

```
Sequential-Logic-Datasets-with-Designs/
├── Designs/    # VHDL designs, Quartus schematic (.bdf), testbenches (.vhd)
├── Datasets/   # Generated input / output / state traces in plain text
└── Scripts/    # Simulation + dataset-export helpers
```

Circuits covered: flip-flops, counters, shift registers, and small FSMs.

## Dataset format

Each `.txt` file contains aligned columns of inputs, internal states, and outputs:

```
clk in1 in2 state out1 out2
0    0   1   00    0    1
1    1   0   01    1    0
...
```

- `clk` — clock cycle
- `inX` — circuit inputs
- `state` — encoded internal state (binary string or integer)
- `outX` — observed outputs

## Generating new datasets

1. Add or modify a VHDL / Quartus design in `Designs/`
2. Write a `.vhd` testbench that drives the desired input patterns
3. Simulate in ModelSim or Quartus
4. Export results to a `.txt` trace (helpers in `Scripts/`)
5. Drop the result into `Datasets/`

## Using with the NN project

1. Pick or generate a dataset from `Datasets/`
2. Copy or symlink it into the `data/` folder of [Digital-IC-Functionality-Duplication-Using-NN](https://github.com/Anjanamb/Digital-IC-Functionality-Duplication-Using-NN)
3. Pass the path to that project's training script

## Contributors

- **Anjana Bandara** ([@Anjanamb](https://github.com/Anjanamb))
- [Ayesh Rajakaruna](https://github.com/Ayesh-Rajakaruna)
- [@sahannt98](https://github.com/sahannt98)

## License

[MIT](LICENSE) — see [anjanamb.github.io](https://anjanamb.github.io/) for more projects.
