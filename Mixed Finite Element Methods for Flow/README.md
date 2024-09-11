# Mixed Finite Element Method for Flow with Raviart-Thomas Elements

This project tests the convergence of the mixed finite element method using Raviart-Thomas (RT0) elements with the software **Freefem++**. The finite element spaces are used to solve the given boundary value problems and compute convergence rates of the errors for different levels of mesh refinement.

## Project Overview

The goal is to solve the following PDE using RT0 elements:

$$
\alpha p - \nabla \cdot \mathbf{K} \nabla p = f \quad \text{in} \ \Omega \subset \mathbb{R}^2, \quad p = g \ \text{on} \ \partial \Omega
$$

where $\alpha$, $f$, and $g$ are given functions, and $\mathbf{K}$ is the permeability tensor.

## Steps

1. **Run the demo**  
   - Start by running the example `LaplaceRT.edp` located in `examples/tutorial` in **Freefem++**. 
   - Understand how the RT0 finite element space is used in the code. You can refer to the **Freefem++** manual for detailed information about the RT0 space.

2. **Modify the Solver**  
   - Replace the GMRES solver option with the LU solver in the demo. GMRES is less efficient for large-scale problems. 
   - Remove all GMRES-related parameters from the calling sequence.

3. **Explore Additional Examples**  
   - Look at `examples/misc/aaRT.edp` for more examples on using RT0 spaces in Freefem++.

4. **Create a User Code**  
   - Write a new Freefem++ script for solving the problem using the mixed finite element method with RT0 spaces. 

## Test Cases

Run your code for the following test cases:

### Case 1: Simple Case

- **True solution**: $p(x, y) = x^3 + y^3$
- **Domain**: $\Omega = (0, 1) \times (0, 1)$
- **Parameters**: $\alpha = 1$, $\mathbf{K} = 1$

### Case 2: Variable Permeability

- **True solution**: Same as Case 1, but with variable permeability:
  
$$
\mathbf{K}(x, y) = \frac{1}{1 + 10(x^2 + y^2)}
$$

### Case 3: L-Shaped Domain

- **Domain**: L-shaped domain obtained by removing the upper-right quarter from the unit square.
- **Parameters**: $\alpha = 1$, $\mathbf{K} = 1$, $f = 1$, $g = 0$

### Case 4: Discontinuous Permeability

- **Domain**: $\Omega = (0, 1) \times (0, 1)$
- **Parameters**:
  
$$
\mathbf{K}(x, y) = 
\begin{cases}
100, & 0 \leq x, y < 1/2 \\
1, & 1/2 \leq x, y \leq 1
\end{cases}
$$

- **Boundary conditions**: $g = (1 - x)|_{\partial \Omega}$, $f = 0$

## Tasks

1. **Convergence Estimation**  
   - For each case, estimate the convergence rate for the finite element errors in:
     - $\|p - p_h\|_{L^2(\Omega)}$
     - $\|\mathbf{u} - \mathbf{u}_h\|_{L^2(\Omega)}$
   - Run the code for four levels of refinement starting with $h = 1/10$. 
   - In Case 3 and Case 4, use the computed solution with $h = 1/160$ as the true solution for error calculation. Discuss the results.

2. **Plot Results**  
   - Plot the computed pressure and velocity fields.
   - Plot the pressure error for $h = 1/40$. Comment on the distribution of the error.

3. **Submit Code**  
   - Ensure your code is well-documented and includes any necessary comments.

## How to Run the Code

1. Install **Freefem++** if you haven’t already: [Freefem++ installation guide](https://freefem.org/)
2. Modify the provided Freefem++ scripts (`LaplaceRT.edp` or `aaRT.edp`) for each test case described above.
3. Run each case in **Freefem++** and observe the solution plots and error analysis.
4. Document your results and submit your code along with a report.

## Files Included

- `LaplaceRT.edp` - Example Freefem++ script (from the tutorial)
- `aaRT.edp` - Another Freefem++ example for RT0 spaces
- `user_code_case1.edp` - Freefem++ code for Case 1
- `user_code_case2.edp` - Freefem++ code for Case 2
- `user_code_case3.edp` - Freefem++ code for Case 3
- `user_code_case4.edp` - Freefem++ code for Case 4
- `plots/` - Folder containing plots of pressure, velocity, and error distributions for each test case.

## Conclusion

This project implements the mixed finite element method using RT0 elements and estimates the convergence of the method in terms of the $L^2$ norm errors. The computed pressure and velocity fields are analyzed for multiple test cases with varying permeability distributions, including a case with discontinuous permeability.

---

You can adjust this template as needed based on your specific implementation. Let me know if you need any further assistance!
