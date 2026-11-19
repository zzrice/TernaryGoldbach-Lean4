/-
Copyright (c) 2026 Ke Zekang. All rights reserved.
Released under Apache 2.0 license.
-/
import Mathlib.Data.Nat.Basic
import Mathlib.Data.Finset.Basic

namespace TernaryGoldbach.SieveCert

open Finset Nat

/-- A finite certificate emitted by rust-sieve: a list of composites with their
witness factorizations, plus the interval [lo, hi] that was sieved. -/
structure SieveCertificate where
  lo : ℕ
  hi : ℕ
  /-- Each entry: (n, witness d) meaning d divides n and 1 < d < n. -/
  composites : List (ℕ × ℕ)
  deriving Repr

/-- Lean-side check of a Rust sieve certificate: every reported composite really
has the claimed divisor, and no prime in [lo, hi] is reported composite.
(sorry — finite-range verification loop, to be filled after the Rust side stabilizes.) -/
lemma sieve_certificate_valid (c : SieveCertificate) :
    (∀ p ∈ c.composites, let (n, d) := p; d ∣ n ∧ 1 < d ∧ d < n) := by
  sorry

end TernaryGoldbach.SieveCert
