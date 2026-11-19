/-
Copyright (c) 2026 Ke Zekang. All rights reserved.
Released under Apache 2.0 license.
-/
import TernaryGoldbach.Basic
import Mathlib.Data.Finset.Basic

namespace TernaryGoldbach.MinorArcs

open Finset Complex Real

/-- Explicit tail bound for the truncated Perron contour integral
(Helfgott, arXiv:1312.7748, Minor Arcs chapter).

For `x, T ≥ 2`, `α : ℝ`, with `x` not a positive integer, the distance between the finite
exponential sum over `1 ≤ n ≤ x` and the truncated Perron integral
`perronTruncatedIntegral x T α` is at most `(x * (log x)^2)/T + log x`.

Skeleton: split into small `sorry` sub-goals (contour shift, horizontal tail, vertical tail,
geometric-series estimate) and fill each against existing Mathlib results. -/
lemma explicit_perron_contour_tail (x T α : ℝ) (hx : 2 ≤ x) (hT : 2 ≤ T)
    (h_nonint : ∀ n : ℕ, (n : ℝ) ≠ x) :
    ‖∑ n ∈ Finset.Icc 1 (Nat.floor x),
        ((n : ℂ) * Complex.exp (2 * Real.pi * Complex.I * α * n)
          - perronTruncatedIntegral x T α)‖ ≤
      (x * (Real.log x) ^ 2) / T + Real.log x := by
  have hc : 1 < 1 + 1 / Real.log x := by positivity
  sorry

/-- Horizontal-tail sub-goal of `explicit_perron_contour_tail` (sorry). -/
lemma perron_horizontal_tail (x T α : ℝ) (hx : 2 ≤ x) (hT : 2 ≤ T) :
    ‖perronTruncatedIntegral x T α - perronTruncatedIntegral x T 0‖ ≤ Real.log x := by
  sorry

/-- Vertical-tail sub-goal of `explicit_perron_contour_tail` (sorry). -/
lemma perron_vertical_tail (x T α : ℝ) (hx : 2 ≤ x) (hT : 2 ≤ T) :
    ‖perronTruncatedIntegral x T α‖ ≤ (x * (Real.log x) ^ 2) / T := by
  sorry

end TernaryGoldbach.MinorArcs
