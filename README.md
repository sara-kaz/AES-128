# AES-128 Implementation in SystemVerilog

## Overview

This repository contains an implementation of the Advanced Encryption Standard (AES) 128-bit encryption algorithm in SystemVerilog. AES is a symmetric encryption algorithm standardized by NIST and widely used for securing data.

## Features

- AES-128 encryption and decryption
- Includes testbenches for verification
- Modular design for easy integration and testing

## Directory Structure

```
.
├── AES.sv
├── AES_tb.sv
├── function_g.sv
├── inv_AES.sv
├── inv_bytes.sv
├── inv_column.sv
├── inv_last.sv
├── inv_round.sv
├── inv_row.sv
├── inv_s_box.sv
├── key_expansion.sv
├── last_round.sv
├── mix_column.sv
├── round.sv
├── s_box.sv
├── shift_rows.sv
├── sub_byte.sv
└── README.md
```

## Getting Started

### Prerequisites

- A SystemVerilog compatible simulator (e.g., ModelSim, VCS)
- MobaXterm (for running the provided scripts)

### Compilation and Simulation

1. **Clone the Repository**
    ```bash
    git clone https://github.com/sara-kaz/AES-128.git
    cd AES-128
    ```

2. **Run the Simulation**
    ```bash
    vcs -debug -full64 *
    ```

3. **Make a Log File**
    ```bash
    Simv -l AES.log
    ```

## Design Details

### Modules

1. **AES.sv**: The top-level module that integrates the AES core and handles the encryption/decryption process.
2. **key_expansion.sv**: Handles the key expansion process to generate round keys.
3. **round.sv**: Implements a single round of the AES algorithm.
4. **last_round.sv**: Implements the final round of the AES algorithm.
5. **s_box.sv**: Implements the substitution box (S-box) for the SubBytes step.
6. **sub_byte.sv**: SubBytes transformation.
7. **shift_rows.sv**: ShiftRows transformation.
8. **mix_column.sv**: MixColumns transformation.
9. **function_g.sv**: Utility functions for the AES algorithm.

### Inverse Modules (For Decryption)

1. **inv_AES.sv**: Top-level module for AES decryption.
2. **inv_round.sv**: Implements a single round of the AES decryption process.
3. **inv_last.sv**: Implements the final round of the AES decryption process.
4. **inv_s_box.sv**: Inverse S-box for the InvSubBytes step.
5. **inv_row.sv**: InvShiftRows transformation.
6. **inv_column.sv**: InvMixColumns transformation.
7. **inv_bytes.sv**: InvSubBytes transformation.

### Testbenches

1. **AES_tb.sv**: Testbench for the AES module.

## Contact

For any questions or issues, please contact sarakhaled.kaz@example.com.

---

Feel free to reach out with any questions or feedback regarding this AES-128 implementation in SystemVerilog. Happy coding!
