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
