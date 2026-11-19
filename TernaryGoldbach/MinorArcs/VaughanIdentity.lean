/-
Copyright (c) 2026 Ke Zekang. All rights reserved.
Released under Apache 2.0 license.
-/
import TernaryGoldbach.Basic
import Mathlib.Data.Finset.Basic

namespace TernaryGoldbach.MinorArcs

open Finset Complex Real

/-- Vaughan's identity for the von Mangoldt exponential sum, with an explicit
Type I / Type II decomposition error (sorry).

Follows Helfgott (arXiv:1312.7748): split the von Mangoldt exponential sum over n ≤ N into
`typeISum` and `typeIISum`; the discarded remainder is bounded by `N/U`. -/
lemma vaughan_identity_explicit_error (N U : ℕ) (hN : 2 ≤ N) (hU : 1 ≤ U) (α : ℝ) :
    ‖∑ n ∈ Finset.Icc 1 N,
        ((n : ℂ) * Complex.exp (2 * Real.pi * Complex.I * α * n))
      - (typeISum N U α + typeIISum N U α)‖ ≤ (N : ℝ) / U := by
  sorry

/-- Vaughan decomposition remainder bound (sorry, sub-goal of the lemma above). -/
lemma vaughan_remainder_bound (N U : ℕ) (hN : 2 ≤ N) (hU : 1 ≤ U) (α : ℝ) :
    ‖typeISum N U α + typeIISum N U α‖ ≤ (N : ℝ) / U + (N : ℝ) := by
  sorry

end TernaryGoldbach.MinorArcs
