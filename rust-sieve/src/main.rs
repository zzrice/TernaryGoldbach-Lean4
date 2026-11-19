// Segmented sieve placeholder for TernaryGoldbach-Lean4.
//
// Sieves the finite interval [lo, hi] and prints a certificate as JSON:
// one entry per reported composite (n, d) with d divides n and 1 < d < n.
// The Lean side (TernaryGoldbach/SieveCert/CertChecker.lean) re-verifies the
// divisibility claim; this binary only produces the finite range data.
//
// Usage: ternary-goldbach-sieve <lo> <hi>

use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let lo: u64 = args.get(1).and_then(|s| s.parse().ok()).unwrap_or(2);
    let hi: u64 = args.get(2).and_then(|s| s.parse().ok()).unwrap_or(1000);

    println!("{{\"lo\": {lo}, \"hi\": {hi}, \"composites\": [");
    let mut first = true;
    for n in lo.max(4)..=hi {
        // Find the smallest proper divisor d > 1; skip primes (no such d).
        let witness = (2..n).find(|d| n % d == 0);
        if let Some(d) = witness {
            if !first {
                println!(",");
            }
            first = false;
            println!("  [ {n}, {d} ]");
        }
    }
    println!"]}}");
}
