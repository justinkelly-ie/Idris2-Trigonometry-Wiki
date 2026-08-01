# 📐 Idris2-Trigonometry-Wiki

Welcome to the **Finite Science Trigonometry & Physics Layer**. This repository documents and verifies Rows 5 and 6 of the Global Finite Science Table using literate Idris 2 Markdown files.

## 📊 The Trigonometry & Physics Layer

The wiki is organized into the following sections:
- **Row 5 (Stochastic Mechanics)**: [Indivisible Stochastic Mechanics (Barandes)](./Library/Wiki/Indivisible_Mechanics.md) / [Indivisible History trajectories](./Library/Wiki/IndivisibleHistory.idr)
- **Row 6 (Rational Trigonometry)**: [Rational Trigonometry (Wildberger)](./Library/Wiki/Rational_Trigonometry.md)

Verification status is tracked in the [Verification Matrix](./Library/Wiki/Verification_Matrix.md).

## 🛠️ Build and Verify

To run the automated QuickCheck properties, execute the following command from the repository root:
```bash
pack run idris2-Trigonometry-Wiki.ipkg
```
