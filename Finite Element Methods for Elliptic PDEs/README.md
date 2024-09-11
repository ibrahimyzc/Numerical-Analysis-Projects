# Finite Element Solution of Elliptic PDEs

This project involves writing and implementing a finite element code to solve an elliptic partial differential equation (PDE) using continuous piecewise linear basis functions on a triangular grid. The project includes solving several problems with varying coefficients and calculating the error estimates for different mesh refinements.

## Problem Statement

We aim to solve the PDE of the form:

$$ -\nabla \cdot (a(x, y) \nabla u) + b(x, y) u = f(x, y), \quad \text{in} \ \Omega = (0, 1)^2 $$

subject to the boundary condition:

$$ u = g(x, y), \quad \text{on} \ \partial \Omega $$

where $a(x, y)$, $b(x, y)$, $f(x, y)$, and $g(x, y)$ are given functions. We use continuous piecewise linear basis functions on a triangular grid, obtained by partitioning $\Omega$ with a rectangular grid and then dividing each rectangle into two triangles.

## Numerical Methods

The finite element method (FEM) was used to approximate the solution $u(x, y)$ by solving the weak form of the PDE. The following steps were performed:

1. Discretize the domain $\Omega = (0, 1)^2$ into right triangles.
2. Use continuous piecewise linear functions as basis functions on the triangular elements.
3. Assemble the stiffness matrix and load vector based on the weak form of the PDE.
4. Solve the resulting system of linear equations for the unknown coefficients of the finite element approximation.
5. Apply the code to the specific test cases given below.

## Test Cases

### Case A: True solution $p(x, y) = \sin(\pi x)\sin(\pi y)$

1. **i)** $a(x, y) = 1$, $b(x, y) = 1$

2. **ii)** 

$$
a(x, y) = \frac{1}{1 + 10(x^2 + y^2)}, \quad b(x, y) = 0
$$

### Case B: True solution

$$
p(x, y) =
\begin{cases} 
x^2 y^3 + \cos(xy), & 0 \leq x \leq 1/2 \\
\left(\frac{2x + 9}{20}\right)y^3 + \cos\left(\frac{(2x + 9)}{20} y\right), & 1/2 \leq x \leq 1
\end{cases}
$$

For the coefficients $a(x, y)$ and $b(x, y)$:

$$
a(x, y) =
\begin{cases} 
1, & 0 \leq x \leq 1/2 \\
10, & 1/2 < x \leq 1
\end{cases}
$$

$$
b(x, y) = 0
$$

### Boundary and Forcing Functions

In all cases, the boundary condition $g(x, y)$ and the forcing function $f(x, y)$ are derived by plugging the true solution $p(x, y)$ into the given differential equation.

## Convergence Analysis

For each test case, the code estimates the convergence of the finite element error in the $H^1$ and $L^2$ norms. The following levels of mesh refinement were used:
- Coarse grid: $h = 1/4$
- Fine grid: $h = 1/32$

The computed solutions are plotted for each case and compared against the true solution.

## How to Run the Code

1. Download and run the provided code in your chosen programming language.
2. Adjust the parameters as needed for grid refinement and test cases.
3. The solutions for the above test cases will be computed and plotted.
4. Ensure the boundary conditions and source terms match the problem definitions.

## Files Included

- `finite_element_solver.m` - Main script for solving the elliptic PDE using finite element method.
- `test_case_A1.m` - Solves Case A (i) with $a(x, y) = 1$, $b(x, y) = 1$.
- `test_case_A2.m` - Solves Case A (ii) with variable $a(x, y)$ and $b(x, y) = 0$.
- `test_case_B.m` - Solves Case B with piecewise defined $a(x, y)$.
- `plots/` - Folder containing generated plots for different mesh refinements.

## Results and Discussion

- The finite element method accurately approximates the true solutions for each of the test cases.
- The error in $H^1$ and $L^2$ norms is calculated for each level of mesh refinement, demonstrating convergence as the mesh is refined.
- The results confirm that as the mesh is refined, the finite element solution approaches the true solution, with decreasing error.

