# AE 6009: Ultimate Fluid Mechanics Exam Study Guide

> **Exam:** 75 minutes | **Concepts:** 3–4 questions, 25% | **Analytical:** 2–3 problems, 75%  
> **Source scope:** Instructor's concept list, *AE 6009 Assignment 1*, and *AE 6009 Practice Problems Set 2*. Extra explanations, examples, and problems below are **supplemental review**, not confirmed exam questions. Assignment 1 explicitly prohibits AI assistance on submitted work; this guide does not solve its assigned derivations.

## 1. Exam strategy

| Phase | Time |
|---|---:|
| Scan questions and prioritize | 3 min |
| Concept questions | 15 min |
| Analytical problems | 52 min |
| Check units, signs, and boundary conditions | 5 min |

For three analytical problems, budget about **17 min each**; for two, about **26 min each**.

**High-priority skills:** explain the physical meaning of the nondimensional groups; state assumptions when simplifying Navier–Stokes; apply correct boundary conditions; compute wall shear and drag; use correct Cartesian/cylindrical operators; and choose reference scales for nondimensionalization.

## 2. Continuum hypothesis and Knudsen number

**Continuum assumption:** Treat fluid properties (density, pressure, velocity, and temperature) as smooth fields, even though molecules are discrete. Each mathematical “point” represents a volume containing enough molecules to average their behavior.

$$
\boxed{\mathrm{Kn}=\frac{\lambda}{L}}
$$

- $\lambda$: molecular **mean free path**, the average distance between molecular collisions.
- $L$: characteristic macroscopic length, such as a channel height.
- **Small $\mathrm{Kn}$**: continuum model is generally appropriate.
- **Large $\mathrm{Kn}$**: individual molecular effects become important.

| Knudsen number | Approximate regime |
|---|---|
| $\mathrm{Kn}<0.01$ | Continuum, typically no-slip |
| $0.01\le\mathrm{Kn}<0.1$ | Slip flow |
| $0.1\le\mathrm{Kn}<10$ | Transitional |
| $\mathrm{Kn}\ge10$ | Free molecular |

**Physical intuition:** Smaller devices or lower-pressure gases generally have higher $\mathrm{Kn}$. A small Reynolds number does *not* guarantee a small Knudsen number.

**Concept-answer template:** “Knudsen number compares the average molecular travel distance between collisions with the characteristic size of the flow. When it is very small, molecular effects can be averaged and continuum fluid equations are usually appropriate.”

## 3. Pressure, internal energy, and viscosity

### Pressure

$$
\boxed{p=\frac{F_{\mathrm{normal}}}{A}}
$$

Pressure is normal compressive force per unit area. In a gas, it arises from microscopic molecular momentum exchange. It is distinct from **shear stress**, which acts tangentially.

### Internal energy

Internal energy is **microscopic energy per unit mass**, associated with molecular motion and interactions. It **excludes** the fluid's organized, bulk kinetic energy $V^2/2$.

For a calorically perfect ideal gas:

$$
\boxed{e=c_vT},\qquad
\boxed{h=e+\frac{p}{\rho}=c_pT},\qquad
\boxed{p=\rho RT}
$$

These relations require the corresponding ideal-gas and constant-specific-heat assumptions.

### Viscosity

Dynamic viscosity $\mu$ measures a fluid's resistance to *rate of shear deformation*. For simple Newtonian shear:

$$
\boxed{\tau_{xy}=\mu\frac{du}{dy}}
$$

$$
[\mu]=\mathrm{Pa\cdot s},\qquad
\boxed{\nu=\frac{\mu}{\rho}},\qquad
[\nu]=\mathrm{m^2/s}
$$

Here $\nu$ is **kinematic viscosity**.

| Fluid | Typical change in dynamic viscosity as temperature rises | Reason |
|---|---|---|
| Gas | $\mu$ **increases** | Faster molecules transport momentum more effectively between layers |
| Liquid | $\mu$ **decreases** | Molecules rearrange more easily against cohesive intermolecular forces |

At ordinary dilute-gas conditions, gas dynamic viscosity is relatively insensitive to pressure. These are general trends, not universal laws for every fluid and regime.

## 4. Newtonian versus non-Newtonian fluids; Stokes hypothesis

**Newtonian:** At fixed conditions, shear stress is proportional to shear rate; e.g., air and water are often well approximated as Newtonian.

**Non-Newtonian:** That simple, constant-proportionality relationship does not hold. Examples include shear-thinning paint/ketchup, shear-thickening cornstarch mixtures, and yield-stress toothpaste.

**General Newtonian viscous-stress law:**

$$
\boxed{\tau_{ij}=2\mu S_{ij}+\lambda_v(\nabla\cdot\mathbf V)\delta_{ij}}
$$

$$
\boxed{S_{ij}=\frac12\left(\frac{\partial u_i}{\partial x_j}+\frac{\partial u_j}{\partial x_i}\right)}
$$

where $\delta_{ij}$ is the Kronecker delta and $\lambda_v$ is the second viscosity coefficient under this convention.

**Stokes hypothesis:** Assume the bulk viscosity is zero, which gives

$$
\boxed{\lambda_v=-\frac23\mu}
$$

and thus

$$
\boxed{\tau_{ij}=2\mu\left[S_{ij}-\frac13(\nabla\cdot\mathbf V)\delta_{ij}\right]}.
$$

**Do not confuse these:**

- **Stokes hypothesis** is a *constitutive modeling assumption* about viscous stresses.
- **Incompressibility**, $\nabla\cdot\mathbf V=0$ for constant-density flow, is a *kinematic flow condition*.
- When $\nabla\cdot\mathbf V=0$, the dilatational term disappears regardless of Stokes hypothesis.

## 5. Reynolds, Mach, and Prandtl numbers

### Reynolds number: inertia versus viscosity

$$
\boxed{\mathrm{Re}=\frac{\rho UL}{\mu}=\frac{UL}{\nu}}
$$

- **Low Re:** viscous effects dominate inertia at the selected scales.
- **High Re:** inertial effects dominate at the selected scales; viscosity can still be important near walls.
- High Re does **not** automatically mean turbulent flow. Transition depends on configuration and disturbances.

### Mach number: speed versus sound speed

$$
\boxed{\mathrm{Ma}=\frac{U}{a}}
$$

- **Low Ma:** compressibility effects due to motion are often small in ordinary gas flows.
- **High Ma:** compressibility becomes important.
- $\mathrm{Ma}\approx0.3$ is a common engineering guideline for low-speed gas approximations, **not** an absolute rule.

### Prandtl number: momentum versus heat diffusion

$$
\boxed{\mathrm{Pr}=\frac{\mu c_p}{k}=\frac{\nu}{\alpha}},\qquad
\boxed{\alpha=\frac{k}{\rho c_p}}
$$

- $\nu$ is momentum diffusivity.
- $\alpha$ is thermal diffusivity.
- **$\mathrm{Pr}\gg1$:** momentum diffuses faster than heat; thermal boundary layers are often thinner than velocity boundary layers under comparable forced-convection conditions.
- **$\mathrm{Pr}\ll1$:** heat diffuses faster than momentum.

### Nondimensionalization workflow (method, not Assignment 1's solution)

1. Choose reference scales $L,U,\rho_0,T_0,\mu_0$ and $L/U$ for time.
2. Define starred variables:

$$
x^*=\frac{x}{L},\qquad t^*=\frac{tU}{L},\qquad
\mathbf V^*=\frac{\mathbf V}{U},\qquad
\rho^*=\frac{\rho}{\rho_0}.
$$

3. Choose a **pressure scale deliberately**, for example dynamic pressure $\rho_0U^2$ or acoustic pressure $\rho_0a_0^2$.
4. Substitute scaled variables into the equations, divide each equation by its reference magnitude, and interpret the nondimensional coefficients.

**Trap:** The visible coefficient involving $\mathrm{Ma}$ depends on the **pressure scale**. Do not automatically insert $\mathrm{Ma}^{-2}$ in every pressure term.

## 6. Navier–Stokes analytical toolbox

### Conservation of mass

$$
\boxed{\frac{\partial\rho}{\partial t}+\nabla\cdot(\rho\mathbf V)=0}
$$

For constant density:

$$
\boxed{\nabla\cdot\mathbf V=0}
$$

In 2-D Cartesian coordinates:

$$
\boxed{\frac{\partial u}{\partial x}+\frac{\partial v}{\partial y}=0}
$$

### Conservation of momentum

$$
\boxed{\rho\left[\frac{\partial\mathbf V}{\partial t}+(\mathbf V\cdot\nabla)\mathbf V\right]=-\nabla p+\nabla\cdot\boldsymbol\tau+\rho\mathbf b}
$$

For incompressible Newtonian flow with constant $\mu$:

$$
\boxed{\rho\frac{D\mathbf V}{Dt}=-\nabla p+\mu\nabla^2\mathbf V+\rho\mathbf b}
$$

### Before simplifying, check assumptions

| Assumption | Consequence |
|---|---|
| Steady | $\partial/\partial t=0$ |
| Fully developed in $x$ | Velocity profile independent of $x$ |
| Unidirectional | Other velocity components vanish |
| Axisymmetric | $\partial/\partial\theta=0$ |
| No body force | $\mathbf b=\mathbf0$ |
| Constant $\mu$ and incompressible | $\nabla\cdot\boldsymbol\tau=\mu\nabla^2\mathbf V$ |

### Coordinate-specific viscous terms

For axisymmetric **axial** flow $u=u(r)$:

$$
\boxed{\nabla^2u=\frac1r\frac{d}{dr}\left(r\frac{du}{dr}\right)}
$$

For axisymmetric **azimuthal** velocity $u_\theta=u_\theta(r)$, the relevant vector-Laplacian component is:

$$
\boxed{\frac{d^2u_\theta}{dr^2}+\frac1r\frac{du_\theta}{dr}-\frac{u_\theta}{r^2}}
$$

**Trap:** The azimuthal component has the extra $-u_\theta/r^2$ term.

### Boundary conditions

- **No slip:** Tangential fluid speed matches wall speed.
- **No penetration:** Normal fluid speed matches normal wall speed.
- **Stationary wall:** $u=0$ at the wall.
- **Pipe centerline symmetry:** $du/dr=0$ at $r=0$, with finite velocity.
- **Rotating wall:** $u_\theta(R)=\Omega R$.

## 7. Exact-flow patterns

### Planar Poiseuille flow

For steady, fully developed pressure-driven flow between stationary plates at $y=\pm h$:

$$
\boxed{0=-\frac{dp}{dx}+\mu\frac{d^2u}{dy^2}},\qquad
u(-h)=u(h)=0
$$

A pressure drop in the positive flow direction means $dp/dx<0$. Integrating twice gives a parabola.

### Pipe-flow wall force balance

Let $\Delta p=p_{\mathrm{in}}-p_{\mathrm{out}}>0$ across a pipe segment of length $L$ and radius $R$. For fully developed horizontal flow with no other axial forces:

$$
\boxed{|F_{\mathrm{wall}}|=|\tau_w|(2\pi RL)=\Delta p\,(\pi R^2)}
$$

The **wall force on the fluid** points upstream; the **fluid force on the pipe** points downstream.

### Flow between rotating concentric cylinders

For steady axisymmetric, azimuthal-only flow between long cylinders, the general velocity form is

$$
\boxed{u_\theta(r)=Ar+\frac Br}
$$

For a fresh practice problem, determine $A,B$ using

$$
u_\theta(r_1)=\Omega_1r_1,\qquad u_\theta(r_2)=\Omega_2r_2.
$$

The $Ar$ term represents solid-body-like rotation; $B/r$ adds swirl. This relates to an Assignment 1 topic, but the assigned derivation and final expression are not provided here.

---

## 8. Concept practice (12 questions)

Try answering each in **2–4 sentences**, without looking at the key.

1. **C1.** What does “continuum” mean physically? Can a flow have small Re but large Kn?
2. **C2.** A gas flows in a microchannel at very low pressure. What happens to Kn, and why?
3. **C3.** Explain pressure and internal energy using molecular behavior. How do they differ from bulk motion?
4. **C4.** Why does $\mu$ usually rise with temperature for gases but fall for liquids?
5. **C5.** Give a Newtonian-fluid example and a shear-thinning-fluid example.
6. **C6.** What is Stokes hypothesis? Why is it not the same as incompressibility?
7. **C7.** Two similar flows have $\mathrm{Re}=0.01$ and $\mathrm{Re}=10{,}000$. Which effects are relatively more important?
8. **C8.** What does Mach number compare? Is $\mathrm{Ma}<0.3$ an absolute incompressibility requirement?
9. **C9.** If $\mathrm{Pr}=0.02$, is thermal diffusion faster or slower than momentum diffusion?
10. **C10.** Why can a highly viscous fluid have low Re at otherwise similar conditions?
11. **C11.** What is the difference between $\mu$ and $\nu$? State units.
12. **C12.** What does fully developed flow imply, and what does it *not* imply about pressure variation?

## 9. Original analytical practice (easy to exam-level)

### A1. Reynolds-number scaling (8 min)

Water has $\rho=1000\ \mathrm{kg/m^3}$, $\mu=1.0\times10^{-3}\ \mathrm{Pa\cdot s}$, $U=0.20\ \mathrm{m/s}$, and $L=0.005\ \mathrm m$. Calculate Re. If $U$ doubles and $L$ halves, what happens to Re? Interpret.

### A2. Mach and Prandtl numbers (8 min)

Given $U=90\ \mathrm{m/s}$, $a=300\ \mathrm{m/s}$, $\mu=1.8\times10^{-5}\ \mathrm{Pa\cdot s}$, $c_p=1000\ \mathrm{J/(kg\cdot K)}$, and $k=0.025\ \mathrm{W/(m\cdot K)}$, calculate Ma and Pr; interpret each.

### A3. Incompressible viscous-stress identity (12 min)

For a smooth 2-D incompressible velocity field $u(x,y),v(x,y)$ and constant $\mu$, show

$$
\frac{\partial}{\partial x}\left(2\mu\frac{\partial u}{\partial x}\right)
+\frac{\partial}{\partial y}\left[\mu\left(\frac{\partial u}{\partial y}+\frac{\partial v}{\partial x}\right)\right]
=\mu\left(\frac{\partial^2u}{\partial x^2}+\frac{\partial^2u}{\partial y^2}\right).
$$

State exactly where continuity and equality of mixed partial derivatives are used.

### A4. Planar Couette flow (12 min)

A Newtonian liquid fills $0\le y\le H$. The bottom plate is stationary, and the top moves at $U$. With zero streamwise pressure gradient, derive $u(y)$, $\tau_{xy}$, and the shear force **magnitude** on a plate of area $A$. State assumptions and wall conditions.

### A5. Planar pressure-driven flow (18 min)

Stationary plates are at $y=\pm h$. Constant $dp/dx=-G$ with $G>0$ drives steady fully developed flow. Find $u(y)$, centerline speed $u_{\max}$, and volume flow rate **per unit spanwise width** $q$. Check signs and units.

### A6. Pipe pressure and friction (15 min)

A horizontal circular pipe has $R=0.010\ \mathrm m$, $L=2\ \mathrm m$, and $p_{\mathrm{in}}-p_{\mathrm{out}}=400\ \mathrm{Pa}$. Find wall shear stress **magnitude** and wall-force **magnitude** using a force balance. State the direction of friction on the fluid.

### A7. Equal-speed rotating cylinders (10 min)

Two concentric cylinders rotate in the same direction at the same angular speed $\Omega$. Without solving differential equations, propose $u_\theta(r)$; verify wall conditions and determine whether shear strain rate vanishes.

### A8. Reynolds number from scales (15 min)

Use characteristic scales to estimate the inertial momentum term as $\rho U^2/L$ and viscous term as $\mu U/L^2$. Find their ratio. What happens to the dimensionless pressure-gradient coefficient when pressure is scaled with $\rho U^2$?

---

## 10. Full 75-minute practice exam

**Concept section: 25 points. Target: 15 min.**

- **Q1 (8 pts):** Define Kn. Explain why a continuum assumption might fail for a rarefied gas and give one operating change that increases Kn.
- **Q2 (8 pts):** Contrast temperature effects on liquid and gas viscosity and explain both physically.
- **Q3 (9 pts):** Define Re, Ma, and Pr as physical ratios. Interpret very low and very high values of each.

**Analytical section: 75 points. Target: 52 min, plus time to scan/check.**

**Q4 (25 pts): Couette flow.** Two plates are separated by $H=4\ \mathrm{mm}$. The top plate travels at $U=0.80\ \mathrm{m/s}$; $\mu=0.12\ \mathrm{Pa\cdot s}$ and plate area $A=0.10\ \mathrm{m^2}$. Find the velocity profile, uniform shear stress, and force magnitude. State assumptions and boundary conditions.

**Q5 (25 pts): Pressure-driven flow.** Stationary plates at $y=\pm0.010\ \mathrm m$ contain liquid with $\mu=0.050\ \mathrm{Pa\cdot s}$. Pressure gradient $dp/dx=-20\ \mathrm{Pa/m}$. Derive $u(y)$, $u_{\max}$, and $q$ per unit width. What changes if the pressure-gradient magnitude doubles?

**Q6 (25 pts): Pipe force balance.** For $R=0.015\ \mathrm m$, $L=3.0\ \mathrm m$, and $\Delta p=600\ \mathrm{Pa}$, derive the pressure-force/wall-shear-force balance, calculate wall shear magnitude and wall-force magnitude, and explain force directions.

---

## 11. Concept answer key

| Question | Expected answer |
|---|---|
| C1 | Continuum treats properties as smooth averages. Yes, Re and Kn measure different physical ratios. |
| C2 | Low gas pressure increases mean free path and hence Kn at fixed channel size. |
| C3 | Pressure reflects normal stress/molecular momentum transfer; internal energy is microscopic energy, not bulk translation. |
| C4 | Higher molecular speeds enhance gas momentum transport; warming liquids promotes rearrangement against cohesive interactions. |
| C5 | Water/air: Newtonian approximations; paint/ketchup: often shear thinning. |
| C6 | Stokes assumes zero bulk viscosity (equivalently $\lambda_v=-2\mu/3$ in this convention); incompressibility is $\nabla\cdot\mathbf V=0$. |
| C7 | $0.01$: viscosity dominates. $10{,}000$: inertia dominates at reference scales, but viscous wall effects remain. |
| C8 | $\mathrm{Ma}=U/a$; the $0.3$ cutoff is a guideline rather than an absolute law. |
| C9 | $\mathrm{Pr}=\nu/\alpha=0.02$ means thermal diffusion is far faster. |
| C10 | $\mathrm{Re}\propto1/\mu$ when other variables are fixed. |
| C11 | $\mu$: dynamic viscosity, $\mathrm{Pa\cdot s}$; $\nu=\mu/\rho$: kinematic viscosity, $\mathrm{m^2/s}$. |
| C12 | Velocity profile does not change downstream; pressure may still have a gradient. |

## 12. Analytical practice answer key

### A1

$$
\mathrm{Re}=\frac{(1000)(0.20)(0.005)}{0.001}=\boxed{1000}.
$$

Double $U$ and halve $L$: the product $UL$ stays unchanged, so **Re remains 1000**.

### A2

$$
\mathrm{Ma}=\frac{90}{300}=\boxed{0.30},\qquad
\mathrm{Pr}=\frac{(1.8\times10^{-5})(1000)}{0.025}=\boxed{0.72}.
$$

Momentum and heat diffusivities are of similar order.

### A3

Writing $u_{xx}=\partial^2u/\partial x^2$ etc., expanding gives

$$
\mu(2u_{xx}+u_{yy}+v_{xy}).
$$

Differentiate incompressibility $u_x+v_y=0$ with respect to $x$:

$$
u_{xx}+v_{yx}=0.
$$

For smooth fields, $v_{xy}=v_{yx}=-u_{xx}$, hence

$$
\boxed{\mu(u_{xx}+u_{yy})}.
$$

### A4

$$
\mu\frac{d^2u}{dy^2}=0,\qquad u(0)=0,\quad u(H)=U.
$$

$$
\boxed{u(y)=\frac{Uy}{H}},\qquad
\boxed{\tau_{xy}=\mu\frac{U}{H}},\qquad
\boxed{|F|=\frac{\mu UA}{H}}.
$$

Viscous force on the moving plate opposes its motion.

### A5

$$
\mu\frac{d^2u}{dy^2}=-G,\qquad u(\pm h)=0.
$$

$$
\boxed{u(y)=\frac{G}{2\mu}(h^2-y^2)}
$$

$$
\boxed{u_{\max}=\frac{Gh^2}{2\mu}},\qquad
\boxed{q=\int_{-h}^{h}u(y)\,dy=\frac{2Gh^3}{3\mu}}.
$$

Units of $q$ per unit width are $\mathrm{m^2/s}$.

### A6

$$
\Delta p\,\pi R^2=|\tau_w|\,2\pi RL
\quad\Rightarrow\quad
|\tau_w|=\frac{\Delta p\,R}{2L}.
$$

$$
\boxed{|\tau_w|=\frac{400(0.010)}{2(2)}=1\ \mathrm{Pa}}
$$

$$
\boxed{|F_{\mathrm{wall}}|=400\pi(0.010)^2\approx0.126\ \mathrm N}.
$$

Wall friction **on the fluid** acts upstream.

### A7

$$
\boxed{u_\theta(r)=\Omega r}
$$

It satisfies $u_\theta(r_1)=\Omega r_1$ and $u_\theta(r_2)=\Omega r_2$. Shear strain rate vanishes:

$$
\frac{du_\theta}{dr}-\frac{u_\theta}{r}=\Omega-\Omega=\boxed{0}.
$$

### A8

$$
\frac{\rho U^2/L}{\mu U/L^2}
=\boxed{\frac{\rho UL}{\mu}=\mathrm{Re}}.
$$

Scaling pressure with $\rho U^2$ makes its gradient coefficient order one relative to inertia; the constant-viscosity term carries $1/\mathrm{Re}$.

## 13. Timed exam answer key

### Q1

$$\mathrm{Kn}=\lambda/L.$$

For large Kn, molecular travel lengths approach flow dimensions, so local continuum/no-slip assumptions can fail. Lowering gas pressure generally raises Kn at fixed $L$.

### Q2

Gas viscosity generally **increases** with $T$ because fast molecules transport momentum between layers more effectively. Liquid viscosity generally **decreases** because warmer molecules rearrange more easily against cohesive forces.

### Q3

$$
\mathrm{Re}=\frac{\rho UL}{\mu}\quad(\text{inertia/viscous}),\qquad
\mathrm{Ma}=\frac Ua\quad(\text{flow/sound speed}),\qquad
\mathrm{Pr}=\frac\nu\alpha\quad(\text{momentum/thermal diffusion}).
$$

Low/high Re favors viscosity/inertia; low/high Ma suggests weaker/stronger motion-induced compressibility relevance in common gas flows; low/high Pr favors heat/momentum diffusion.

### Q4

$H=0.004\ \mathrm m$, using $y$ measured upward from the fixed wall:

$$
\boxed{u(y)=0.80\frac{y}{0.004}\ \mathrm{m/s}}
$$

$$
\boxed{\tau=\frac{(0.12)(0.80)}{0.004}=24\ \mathrm{Pa}},\qquad
\boxed{|F|=(24)(0.10)=2.4\ \mathrm N}.
$$

Assume steady, incompressible, Newtonian, unidirectional, fully developed flow with constant viscosity, no pressure gradient, and no slip.

### Q5

With $h=0.010\ \mathrm m$, $G=20\ \mathrm{Pa/m}$:

$$
\boxed{u(y)=\frac{20}{2(0.050)}(0.010^2-y^2)=200(0.0001-y^2)\ \mathrm{m/s}}
$$

Here $y$ is inserted numerically in meters.

$$
\boxed{u_{\max}=0.020\ \mathrm{m/s}}
$$

$$
\boxed{q=\frac{2(20)(0.010)^3}{3(0.050)}=2.667\times10^{-4}\ \mathrm{m^2/s}}.
$$

Doubling $G$ doubles the velocity throughout the profile without changing its parabolic shape.

### Q6

$$
\Delta p\,\pi R^2=|\tau_w|\,2\pi RL.
$$

$$
\boxed{|\tau_w|=\frac{600(0.015)}{2(3.0)}=1.5\ \mathrm{Pa}}
$$

$$
\boxed{|F_{\mathrm{wall}}|=600\pi(0.015)^2\approx0.424\ \mathrm N}.
$$

Fluid pulls on the pipe downstream; the pipe's friction force on the fluid is upstream.

---

## 14. Last-hour checklist

- [ ] Explain **continuum** and **Knudsen number** without notes.
- [ ] Describe **pressure**, **internal energy**, and gas/liquid **viscosity trends**.
- [ ] Distinguish **Newtonian/non-Newtonian**, **Stokes hypothesis/incompressibility**.
- [ ] Explain **Re**, **Ma**, **Pr** physically and write each equation.
- [ ] Simplify **continuity** and **Navier–Stokes**, showing assumptions.
- [ ] Remember the **azimuthal** $-u_\theta/r^2$ viscous term.
- [ ] Apply **no-slip**, **symmetry**, and **rotating-wall** boundary conditions.
- [ ] Convert **pressure drop** to **wall shear and drag** with correct directions.
- [ ] Choose and state **pressure scale** when nondimensionalizing.
- [ ] Complete three analytical practice problems in about **52 minutes**.
- [ ] Check **units, signs, boundary conditions, and limiting cases**.

**Frequent mistakes:** Pressure is not tangential shear stress; gas and liquid viscosity often have opposite temperature trends; Re does not determine compressibility; fully developed does *not* imply zero pressure gradient; rotating-wall speed is $\Omega R$ rather than $\Omega$; and force on the pipe is opposite force on the fluid.

> **Markdown compatibility:** Equations use standard MathJax/LaTeX syntax: `$...$` for inline and `$$...$$` for display. Recommended for Obsidian (Reading View or Live Preview) and other MathJax-enabled Markdown viewers. Basic Markdown previews without a math engine will show the LaTeX source instead of rendered equations.
