# Numerical Solution of Advection-Diffusion Boundary-Value Problem

This project implements numerical methods to solve the advection-diffusion boundary-value problem using the following methods:
- Shooting Method
- Symmetric Finite Difference Method
- Upwind Finite Difference Method

The project explores the stability and convergence properties of these methods by solving the given problem for various step sizes and analyzing the results.

## Problem Statement

We aim to solve the advection-diffusion boundary-value problem:

$$ -\epsilon u''(t) + a u'(t) = 0, \quad 0 < t < 1 $$

subject to the boundary conditions:

$$ u(0) = 0, \quad u(1) = 1 $$

where $\epsilon \ll 1$ and $a$ are constants. The true solution of the problem is given by:

$$ u(t) = \frac{1 - e^{Rt}}{1 - e^R} $$

where $R = \frac{a}{\epsilon}$ (known as the Peclet number).

### Numerical Methods Implemented:
1. **Shooting Method**
   - Converts the boundary-value problem into an initial value problem.
   
2. **Symmetric Finite Difference Method**
   - Approximates the second-order differential equation using central difference approximations.
   
3. **Upwind Finite Difference Method**
   - Uses a biased approximation to handle the advection term, improving stability when $\epsilon$ is small.

## Approach

- **Parameters**:  
  The following parameters were used:
  - $\epsilon = 0.01$
  - $a = 1$
  - $1/h = 20, 40, 80, 160$

- **Solution and Plotting**:  
  The solutions were plotted for each method and step size, and their convergence was evaluated based on the true solution.

- **Error Analysis**:  
  Error estimation and adaptive mesh refinement were applied to improve accuracy for the finite difference methods. Non-uniform mesh quality was analyzed and compared.

## How to Run the Code

1. Download the MATLAB files included in the repository:

2. Adjust the parameters inside the script files to vary the step size or modify the values of $\epsilon$ and $a$.

3. Run the scripts in MATLAB to generate the plots for different methods and step sizes.

## Conclusion

This project provides a detailed numerical comparison of different methods for solving advection-diffusion boundary-value problems. Through error analysis and convergence testing, the methods were evaluated for their accuracy and stability.
