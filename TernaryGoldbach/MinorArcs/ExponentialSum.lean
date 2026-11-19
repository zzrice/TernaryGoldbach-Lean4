/-
Copyright (c) 2026 Ke Zekang. All rights reserved.
Released under Apache 2.0 license.
-/
import TernaryGoldbach.Basic
import Mathlib.Data.Finset.Basic

namespace TernaryGoldbach.MinorArcs

open Finset Complex Real

/-- Explicit minor-arc exponential-sum bound (sorry).

For α on a minor arc (|α - a/q| ≤ 1/qN with (a, q) = 1, Q < q ≤ N/Q in the Helfgott
partition), the exponential sum is bounded with explicit constants following arXiv:1312.7748. -/
lemma minor_arc_exponential_sum_bound (N q : ℕ) (a : ℤ) (hN : 2 ≤ N)
    (h_coprime : Nat.Coprime a.natAbs q) (α : ℝ)
    (h_arc : |α - (a : ℝ) / (q : ℝ)| ≤ 1 / ((q : ℝ) * N)) :
    ‖∑ n ∈ Finset.Icc 1 N,
        Complex.exp (2 * Real.pi * Complex.I * α * n)‖ ≤ N / (q : ℝ) + Real.sqrt (N * q) := by
  sorry

/-- Major-arc reference bound kept for comparison (sorry, not part of phase 1). -/
lemma major_arc_exponential_sum_bound (N : ℕ) (hN : 2 ≤ N) (α : ℝ) :
    ‖∑ n ∈ Finset.Icc 1 N, Complex.exp (2 * Real.pi * Complex.I * α * n)‖ ≤ N := by
  sorry

end TernaryGoldbach.MinorArcs
