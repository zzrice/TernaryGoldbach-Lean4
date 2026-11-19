# TernaryGoldbach-Lean4

A Lean 4 formalization skeleton for the **minor-arc (Minor Arcs) explicit estimates** in
Helfgott's *The Ternary Goldbach Problem* ([arXiv:1312.7748](https://arxiv.org/abs/1312.7748)).

> **Status: WIP skeleton.** Every mathematical goal in this repository currently ends in
> `sorry`. Nothing here is a finished proof yet. The point of the repository is to lay down
> the dependency graph (blueprint) and the target statements, so that individual `sorry`
> lemmas can be filled one at a time against existing Mathlib results and checked by
> `lake build`.

## Scope (first phase)

Formalize the explicit **minor-arc exponential-sum estimates** of Helfgott's paper:

1. Explicit truncated Perron contour-tail bound (horizontal/vertical tails, geometric-series estimate).
2. Vaughan's identity for the von Mangoldt function with an explicit Type I / Type II error.
3. Explicit minor-arc exponential-sum bound used in the circle method.

Items still missing in Mathlib that this project targets: explicit-constant versions of the
Perron contour truncation bound, and explicit error bounds after the Vaughan decomposition.

## Layout

```
TernaryGoldbach-Lean4/
├── lakefile.toml                 # Lean 4 / Mathlib dependency manifest
├── lean-toolchain                # pinned Lean toolchain
├── TernaryGoldbach/
│   ├── Basic.lean                # shared notation / placeholder definitions
│   ├── MinorArcs/
│   │   ├── Perron.lean            # explicit Perron contour-tail bound (sorry)
│   │   ├── VaughanIdentity.lean   # Vaughan identity + explicit error (sorry)
│   │   └── ExponentialSum.lean    # minor-arc exponential-sum bound (sorry)
│   └── SieveCert/
│       └── CertChecker.lean       # Lean-side verifier for Rust sieve certificates
├── rust-sieve/                    # external segmented sieve that emits finite certificates
│   ├── Cargo.toml
│   └── src/main.rs
└── blueprint/src/                 # LaTeX blueprint nodes (lean / uses dependency graph)
    ├── index.tex
    ├── minor_arcs.tex
    └── perron.tex
```

## Two verification loops

- **Loop A - Blueprint to sorry filling:** the paper chapter is decomposed into small
  `sorry` lemmas; an agent walks the dependency graph, looks up existing Mathlib theorems,
  fills each goal, and iterates on `lake build` goal state / errors.
- **Loop B - Finite-certificate loop:** small finite ranges are sieved in Rust/C++; the sieve
  exports a verification certificate, which `TernaryGoldbach/SieveCert/CertChecker.lean`
  checks back in Lean.

## Build

```bash
lake exe cache get
lake build
```

(Not yet compiled on the machine that produced this skeleton; statements are written to be
filled, not proven here.)

## References

- H. A. Helfgott, *The Ternary Goldbach Problem*, arXiv:1312.7748.
- Mathlib: `Mathlib.NumberTheory.LSeries`, `Mathlib.NumberTheory.DirichletCharacter`.

## License

Apache-2.0.
