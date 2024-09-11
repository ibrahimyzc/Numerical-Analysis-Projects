# Domain Decomposition for Mixed Finite Elements

This project explores overlapping and non-overlapping domain decomposition algorithms for mixed finite element discretizations of elliptic problems using **Freefem++**.

## Part I: Getting Familiar

### Objective
In this part, we aim to understand and implement basic domain decomposition methods by using and modifying example codes provided in **Freefem++**. The focus will be on overlapping and non-overlapping Schwarz methods.

### Steps

1. **Run Example Codes**:
   - Run the following examples in `examples/tutorial/`:
     - `schwarz-overlap.edp`
     - `schwarz-no-overlap.edp`
     - `schwarz-gc.edp`

2. **Modify the Schwarz-overlap.edp**:
   - Add a convergence criterion to the code. Use `schwarz-b.edp` from `examples/mpi/schwarz-b.edp` as a reference for how to implement this.
   - Modify the convergence tolerance to `1e-2` and set the maximum number of iterations to 500:

   ```cpp
   if (err < 1e-2) break;
   ```

   - Run the code for `n = 4, 8, 16, 32`, and report the number of iterations versus `n`. Discuss the results.

3. **Modify the Schwarz-gc.edp**:
   - Change the LinearCG tolerance to `1e-6` and set the maximum number of iterations to 500:

   ```cpp
   LinearCG(BoundaryProblem,p[],q[],eps=1.e-6,nbiter=500);
   ```

   - Run the code for `n = 4, 8, 16, 32`. Report the number of iterations and discuss the results.
   - Change the tolerance to `1e-2` and ensure the results are consistent with `schwarz-overlap.edp`.

4. **Run Additional Tests**:
   - Run the code for `n = 4, 8, 16, 32` and report the results.

## Part II: Domain Decomposition for Mixed Finite Elements

### Objective
This part focuses on applying domain decomposition algorithms for mixed finite elements (MFE) with RT0 spaces. The goal is to solve local Dirichlet problems and match fluxes using the modified versions of `schwarz-overlap.edp` and `schwarz-gc.edp`.

### Steps

 1. **Modify the Schwarz Methods for Mixed Finite Elements**:

- Using the templates from the modified `schwarz-overlap.edp` and `schwarz-gc.edp` from Part I, write two-subdomain overlapping Schwarz and non-overlapping Shur-complement based codes for solving:

$$
\alpha p - \nabla \cdot (\mathbf{K} \nabla p) = f \quad \text{in} \ \Omega \subset \mathbb{R}^2, \quad p = g \ \text{on} \ \partial \Omega
$$

using mixed finite element methods with RT0 spaces.

- In the `schwarz-gc.edp`, modify the `BoundaryProblem` function to solve local Dirichlet problems and iterate to match fluxes.

2. **Change Convergence Criteria**:
   - In `schwarz-overlap.edp`, change the convergence tolerance to `1e-2` and set the maximum number of iterations to 500.
   - In `schwarz-gc.edp`, change the LinearCG tolerance to `1e-6` and the maximum number of iterations to 500.

3.  **Run Test Problems**:

    Run the problems from the project `Mixed Finite Element Methods for Flow `:

- **Case 1**: $p(x, y) = x^3 + y^3$ in $\Omega = (0, 1) \times (0, 1)$ with $\alpha = 1$ and $\mathbf{K} = 1$.

- **Case 2**: Same as above, except
  
  $$\mathbf{K}(x, y) = \frac{1}{1 + 10(x^2 + y^2)}$$

- **Case 3**: $\Omega$ is an L-shaped domain obtained by removing the upper-right quarter from the unit square. Parameters: $\alpha = 1$, $\mathbf{K} = 1$, $f = 1$, $g = 0$.

- **Case 4**: $\Omega = (0, 1) \times (0, 1)$ with $\alpha = 1$, and

$$
\mathbf{K} = 
\begin{cases} 
100, & 0 < x, y < 1/2 \\
1, & \text{otherwise}
\end{cases}
$$

$$
f = 0$, $g = (1 - x)|_{\partial \Omega}.
$$



## How to Run the Code

1. Install **Freefem++**: Follow the [Freefem++ installation guide](https://freefem.org/) if needed.
2. Run each case in **Freefem++** and observe the solutions and error analysis.
