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
