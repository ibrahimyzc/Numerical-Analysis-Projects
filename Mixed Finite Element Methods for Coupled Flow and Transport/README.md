# Coupled Flow and Transport Simulation Using Mixed Finite Element Method with RT0 Elements

This project aims to simulate coupled flow and transport using the mixed finite element method with Raviart-Thomas (RT0) elements in **Freefem++**. The Darcy velocity from the flow equation is used in the transport equation, and the project involves comparisons between the Mixed FEM and the Galerkin FEM methods for flow.

## Problem Statement

The goal is to solve the following system of equations:

1. **Flow Equation**:

$$
\alpha p - \nabla \cdot (\mathbf{K} \nabla p) = f \quad \text{in} \ \Omega \subset \mathbb{R}^2, \quad p = g \ \text{on} \ \partial \Omega
$$

2. **Transport Equation**:

$$
\frac{\partial c}{\partial t} + \mathbf{u} \cdot \nabla c = 0, \quad c(x, y, 0) = c_0(x, y)
$$

where $\mathbf{u} = - \mathbf{K} \nabla p$ is the Darcy velocity, computed from the flow equation.


## Steps

### 1. Implement the Flow Equation

- Use the mixed finite element method (RT0 spaces) for solving the flow equation.
- Compute the Darcy velocity $\mathbf{u} = [u_1, u_2]$.
- Use the Freefem++ function `convect` for solving the transport equation based on the computed velocity. (See Section 9.5.2 of the Freefem++ manual for more information on `convect`.)

### 2. Implement the Transport Equation

- Implement the transport equation using the Darcy velocity vector $\mathbf{u}$ from the flow solution.
- You can pass the velocity vector $\mathbf{u} = [u_1, u_2]$ directly into the `convect` function for solving the transport equation.

## Problem Setup

Solve the problem in the domain $\Omega = (0, 1) \times (0, 1)$ with the following parameters:
- $\alpha = 1$, $f = 0$
- Use $g(x, y) = 1 - x$ as the pressure boundary condition to create flow from left to right.

The permeability tensor $\mathbf{K}$ is defined as:

$$
\mathbf{K}(x, y) = 
\begin{cases} 
0.0001, & 0.4 \leq x \leq 0.6 \\
1, & \text{otherwise}
\end{cases}
$$

The initial condition for the transport equation is a contaminant plume:
$$
c_0(x, y) = \exp\left(-100 \left( (x - 0.2)^2 + (y - 0.5)^2 \right)\right)
$$

### Simulation Parameters
- Mesh size: $h = 1/40$
- Time step: $\Delta t = 0.01$
- Final time: $t = 1$

## Tasks

### 1. Visualize the Contaminant Front

- Plot the concentration $c$ at each time step to visualize the moving front of the contaminant plume. You can use `wait=0` in Freefem++ to view the front.

### 2. Run a Modified Simulation Using Galerkin FEM

- Use the Galerkin finite element method (continuous P1 elements) for computing the velocity.
- Define the velocity elements as:
  $$ 
  \text{vel1} = -K \cdot \frac{\partial p}{\partial x}, \quad \text{vel2} = -K \cdot \frac{\partial p}{\partial y}
  $$
- Ensure that the velocity vectors are in the continuous P1 space so that they are compatible with the `convect` function.

### 3. Compare Mixed FEM and Galerkin FEM Methods

- For both cases (Mixed FEM and Galerkin FEM), plot and submit the computed:
  - Pressure and velocity fields
  - Contaminant concentration at the final time step
- Compare the quality of solutions from the two methods.

## How to Run the Code

1. Install **Freefem++**: Follow the [Freefem++ installation guide](https://freefem.org/) if needed.
2. Write the Freefem++ code for both the flow and transport problems as described.
3. Set up the parameters and mesh for the problem.
4. Use the `convect` function for the transport equation.
5. Visualize the results for both the mixed FEM and Galerkin FEM methods.


## Conclusion

This project demonstrates the application of the mixed finite element method and the Galerkin finite element method for solving coupled flow and transport problems. The comparison between the two methods provides insights into the quality of velocity and contaminant transport simulation under different discretization techniques.

---

You can modify this `README.md` as needed based on your specific implementation. Let me know if you need further assistance!
