# Circom learnings

Notes and examples from learning [Circom](https://docs.circom.io/) (circuit compiler for ZK proofs).

## Contents

- **fibonacci.circom** – Example circuit: parameterized Fibonacci-style computation with a single output constraint.

## Quick reference

- **Compile** (R1CS + WASM witness generator + symbol file):
  ```bash
  circom fibonacci.circom --r1cs --wasm --sym
  ```
- **Outputs:**
  - `*.r1cs` – constraint system for the prover
  - `*_js/*.wasm` – witness generator (computes a valid assignment from inputs)
  - `*.sym` – symbol file for debugging

## Resources

- [Circom docs](https://docs.circom.io/)
- [Circom language reference](https://docs.circom.io/circom-language/signals)
- [circomlib](https://github.com/iden3/circomlib) – library of circuits

## Cmds

Utilize the 'info' command to display statistics about the circuit

`snarkjs r1cs info fibonacci.r1cs`

Execute a command to verify by printing the circuit's constraints.

`snarkjs r1cs print fibonacci.r1cs fibonacci.sym`

Convert the r1cs file to JSON format for easier human interpretation.

`snarkjs r1cs export json fibonacci.r1cs fibonacci.r1cs.json`

Initiate the creation of the witness file

`node fibonacci_js/generate_witness.js fibonacci_js/fibonacci.wasm input.json fibonacci_input.wtns`

Verify the compliance of the generated witness with the r1cs file using this command:

`snarkjs wtns check fibonacci.r1cs fibonacci.wtns`

This command initializes a fresh powers of tau file.

`snarkjs powersoftau new bn128 12 phase1_pot12_00.ptau -v`

The 'contribute' command generates a new contribution in the ptau file.

`snarkjs powersoftau contribute phase1_pot12_00.ptau phase1_pot12_01.ptau --name="First contribution Name" -v -e="Random text 1"`

Adds an additional layer of contribution.

`snarkjs powersoftau contribute phase1_pot12_01.ptau phase1_pot12_02.ptau --name="Second contribution Name" -v -e="Random text 2"`

Introduces a third layer of contribution utilizing third-party software.

`snarkjs powersoftau export challenge phase1_pot12_02.ptau phase1_challenge_03`

`snarkjs powersoftau challenge contribute bn128 phase1_challenge_03 phase1_response_03 -e="Random text"`

`snarkjs powersoftau import response phase1_pot12_02.ptau phase1_response_03 phase1_pot12_03.ptau -n="Third contribution name"`

Implements a random beacon in the ptau file for enhanced randomness.
A random beacon acts as a verifiable source of public randomness, becoming available only after a predetermined time. 

`snarkjs powersoftau beacon phase1_pot12_03.ptau phase1_pot12_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"`

Initiating the readiness for phase 2 of the setup, which is specific to the circuit.

`snarkjs powersoftau prepare phase2 phase1_pot12_beacon.ptau phase1_pot12_final.ptau -v`

The 'verify' command confirms the integrity of a powers of tau file.

`snarkjs powersoftau verify phase1_pot12_final.ptau`

Download the bn128 Ptau files with 54 contributions and a beacon from the provided link.

https://github.com/iden3/snarkjs?tab=readme
