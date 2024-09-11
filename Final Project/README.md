# Numerical Solution of ODEs - Advection-Diffusion Problem

This project solves the advection-diffusion boundary-value problem using various numerical methods, including:

- The Shooting Method
- Symmetric Finite Difference Method
- Upwind Finite Difference Method

## Problem

The advection-diffusion boundary-value problem is described by the equation:

\[
-\epsilon u''(t) + au'(t) = 0, \quad 0 < t < 1
\]
where \( u(0) = 0 \), \( u(1) = 1 \), \( \epsilon \ll 1 \), and \( a \) is a constant.

## Methods Used
- Shooting method for solving boundary-value problems.
- Symmetric finite difference scheme for second-order differential equations.
- Upwind finite difference method for stability in advection-diffusion problems.

## How to Run the Code

Download the MATLAB files and run them in MATLAB. Set the parameters (e.g., step size `h`, epsilon, a) in the main script.
