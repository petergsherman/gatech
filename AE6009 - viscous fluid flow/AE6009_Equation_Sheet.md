# AE6009 Viscous Fluid Flow: Equation Sheet
## 1. Dimensionless Numbers
| Reynolds | Prandtl | Knudsen |
|---|---|---|
| $Re=\frac{\rho UL}{\mu}=\frac{UL}{\nu}$, inertia over viscous | $Pr=\frac{\nu}{\alpha}=\frac{\mu c_p}{k}$, momentum diffusion over heat diffusion | $Kn=\frac{\lambda}{L}$, mean free path over length, $\lambda=\frac{\mu}{p}\sqrt{\frac{\pi RT}{2}}$, $Kn=\sqrt{\frac{\pi\gamma}{2}}\,\frac{Ma}{Re}$ |
| Pipe $Re_D=\frac{\rho\bar uD}{\mu}$, laminar below 2300; plate $Re_x=\frac{Ux}{\nu}$, transition near $5\times10^5$ | Air about 0.71, water about 7; Péclet $Pe=Re\,Pr$ | Continuum below 0.01; slip 0.01 to 0.1; transitional 0.1 to 10; free molecular above 10 |
## 2. Operators
- **Vector:** $\frac{D}{Dt}=\frac{\partial}{\partial t}+\mathbf V\cdot\nabla$, $\;\frac{D\mathbf V}{Dt}=\frac{\partial\mathbf V}{\partial t}+(\mathbf V\cdot\nabla)\mathbf V$, $\;\boldsymbol\omega=\nabla\times\mathbf V$, $\;\varepsilon_{ij}=\frac12\left(\frac{\partial u_i}{\partial x_j}+\frac{\partial u_j}{\partial x_i}\right)$
#### Components
| Cartesian $(u,v,w)$ | Cylindrical $(v_r,v_\theta,v_z)$ |
|---|---|
| $\frac{D}{Dt}=\frac{\partial}{\partial t}+u\frac{\partial}{\partial x}+v\frac{\partial}{\partial y}+w\frac{\partial}{\partial z}$ | $\frac{D}{Dt}=\frac{\partial}{\partial t}+v_r\frac{\partial}{\partial r}+\frac{v_\theta}{r}\frac{\partial}{\partial\theta}+v_z\frac{\partial}{\partial z}$ (scalars) |
| $\frac{D\mathbf V}{Dt}=\left(\frac{Du}{Dt},\frac{Dv}{Dt},\frac{Dw}{Dt}\right)$ | $\frac{D\mathbf V}{Dt}=\left(\frac{Dv_r}{Dt}-\frac{v_\theta^2}{r},\;\frac{Dv_\theta}{Dt}+\frac{v_rv_\theta}{r},\;\frac{Dv_z}{Dt}\right)$ |
| $\nabla\cdot\mathbf V=\frac{\partial u}{\partial x}+\frac{\partial v}{\partial y}+\frac{\partial w}{\partial z}$ | $\nabla\cdot\mathbf V=\frac{1}{r}\frac{\partial(rv_r)}{\partial r}+\frac{1}{r}\frac{\partial v_\theta}{\partial\theta}+\frac{\partial v_z}{\partial z}$ |
| $\nabla^2f=\frac{\partial^2f}{\partial x^2}+\frac{\partial^2f}{\partial y^2}+\frac{\partial^2f}{\partial z^2}$ | $\nabla^2f=\frac{1}{r}\frac{\partial}{\partial r}\left(r\frac{\partial f}{\partial r}\right)+\frac{1}{r^2}\frac{\partial^2f}{\partial\theta^2}+\frac{\partial^2f}{\partial z^2}$ |
| $\omega_x=\frac{\partial w}{\partial y}-\frac{\partial v}{\partial z}$, $\omega_y=\frac{\partial u}{\partial z}-\frac{\partial w}{\partial x}$, $\omega_z=\frac{\partial v}{\partial x}-\frac{\partial u}{\partial y}$ | $\omega_r=\frac{1}{r}\frac{\partial v_z}{\partial\theta}-\frac{\partial v_\theta}{\partial z}$, $\omega_\theta=\frac{\partial v_r}{\partial z}-\frac{\partial v_z}{\partial r}$, $\omega_z=\frac{1}{r}\frac{\partial(rv_\theta)}{\partial r}-\frac{1}{r}\frac{\partial v_r}{\partial\theta}$ |
## 3. Stokes Stress Relations
- **General:** $\sigma_{ij}=-p\delta_{ij}+\tau_{ij}$, $\;\tau_{ij}=\mu\left(\frac{\partial u_i}{\partial x_j}+\frac{\partial u_j}{\partial x_i}\right)+\lambda\delta_{ij}\nabla\cdot\mathbf V=2\mu\varepsilon_{ij}+\lambda\delta_{ij}\nabla\cdot\mathbf V$, symmetric $\tau_{ij}=\tau_{ji}$
- Bulk viscosity $\kappa=\lambda+\frac23\mu$; **Stokes hypothesis** $\kappa=0\Rightarrow\lambda=-\frac23\mu$; mean pressure $\bar p=-\frac{\sigma_{ii}}{3}=p-\kappa\nabla\cdot\mathbf V$; incompressible: $\tau_{ij}=2\mu\varepsilon_{ij}$
- **Stokes postulates:** (1) stress is linear in strain rate, (2) fluid is isotropic, (3) zero strain rate gives $\sigma_{ij}=-p\delta_{ij}$
#### Components
| Cartesian | Cylindrical |
|---|---|
| $\tau_{xx}=2\mu\frac{\partial u}{\partial x}+\lambda\nabla\cdot\mathbf V$ | $\tau_{rr}=2\mu\frac{\partial v_r}{\partial r}+\lambda\nabla\cdot\mathbf V$ |
| $\tau_{yy}=2\mu\frac{\partial v}{\partial y}+\lambda\nabla\cdot\mathbf V$ | $\tau_{\theta\theta}=2\mu\left(\frac{1}{r}\frac{\partial v_\theta}{\partial\theta}+\frac{v_r}{r}\right)+\lambda\nabla\cdot\mathbf V$ |
| $\tau_{zz}=2\mu\frac{\partial w}{\partial z}+\lambda\nabla\cdot\mathbf V$ | $\tau_{zz}=2\mu\frac{\partial v_z}{\partial z}+\lambda\nabla\cdot\mathbf V$ |
| $\tau_{xy}=\mu\left(\frac{\partial u}{\partial y}+\frac{\partial v}{\partial x}\right)$ | $\tau_{r\theta}=\mu\left[r\frac{\partial}{\partial r}\left(\frac{v_\theta}{r}\right)+\frac{1}{r}\frac{\partial v_r}{\partial\theta}\right]$ |
| $\tau_{yz}=\mu\left(\frac{\partial v}{\partial z}+\frac{\partial w}{\partial y}\right)$ | $\tau_{\theta z}=\mu\left(\frac{\partial v_\theta}{\partial z}+\frac{1}{r}\frac{\partial v_z}{\partial\theta}\right)$ |
| $\tau_{xz}=\mu\left(\frac{\partial w}{\partial x}+\frac{\partial u}{\partial z}\right)$ | $\tau_{rz}=\mu\left(\frac{\partial v_r}{\partial z}+\frac{\partial v_z}{\partial r}\right)$ |
## 4. Continuity
- **Vector:** compressible $\frac{\partial\rho}{\partial t}+\nabla\cdot(\rho\mathbf V)=0\iff\frac{D\rho}{Dt}+\rho\nabla\cdot\mathbf V=0$; incompressible $\nabla\cdot\mathbf V=0$
#### Components
| Cartesian | Cylindrical |
|---|---|
| $\frac{\partial\rho}{\partial t}+\frac{\partial(\rho u)}{\partial x}+\frac{\partial(\rho v)}{\partial y}+\frac{\partial(\rho w)}{\partial z}=0$ | $\frac{\partial\rho}{\partial t}+\frac{1}{r}\frac{\partial(\rho rv_r)}{\partial r}+\frac{1}{r}\frac{\partial(\rho v_\theta)}{\partial\theta}+\frac{\partial(\rho v_z)}{\partial z}=0$ |
| $\frac{\partial u}{\partial x}+\frac{\partial v}{\partial y}+\frac{\partial w}{\partial z}=0$ | $\frac{1}{r}\frac{\partial(rv_r)}{\partial r}+\frac{1}{r}\frac{\partial v_\theta}{\partial\theta}+\frac{\partial v_z}{\partial z}=0$ |
## 5. Navier-Stokes: Compressible
- **General:** $\rho\frac{D\mathbf V}{Dt}=\rho\mathbf g-\nabla p+\nabla\cdot\tau_{ij}$
- **Constant $\mu,\lambda$:** $\rho\frac{D\mathbf V}{Dt}=\rho\mathbf g-\nabla p+\mu\nabla^2\mathbf V+(\lambda+\mu)\nabla(\nabla\cdot\mathbf V)$; with Stokes hypothesis the last term is $\frac{\mu}{3}\nabla(\nabla\cdot\mathbf V)$
#### Components (general, stresses from section 3)
| Cartesian | Cylindrical |
|---|---|
| **x:** $\rho\left(\frac{\partial u}{\partial t}+u\frac{\partial u}{\partial x}+v\frac{\partial u}{\partial y}+w\frac{\partial u}{\partial z}\right)=\rho g_x-\frac{\partial p}{\partial x}+\frac{\partial}{\partial x}\left[2\mu\frac{\partial u}{\partial x}+\lambda\nabla\cdot\mathbf V\right]+\frac{\partial}{\partial y}\left[\mu\left(\frac{\partial u}{\partial y}+\frac{\partial v}{\partial x}\right)\right]+\frac{\partial}{\partial z}\left[\mu\left(\frac{\partial w}{\partial x}+\frac{\partial u}{\partial z}\right)\right]$ | **r:** $\rho\left(\frac{\partial v_r}{\partial t}+v_r\frac{\partial v_r}{\partial r}+\frac{v_\theta}{r}\frac{\partial v_r}{\partial\theta}+v_z\frac{\partial v_r}{\partial z}-\frac{v_\theta^2}{r}\right)=\rho g_r-\frac{\partial p}{\partial r}+\frac{1}{r}\frac{\partial(r\tau_{rr})}{\partial r}+\frac{1}{r}\frac{\partial\tau_{r\theta}}{\partial\theta}+\frac{\partial\tau_{rz}}{\partial z}-\frac{\tau_{\theta\theta}}{r}$ |
| **y:** $\rho\left(\frac{\partial v}{\partial t}+u\frac{\partial v}{\partial x}+v\frac{\partial v}{\partial y}+w\frac{\partial v}{\partial z}\right)=\rho g_y-\frac{\partial p}{\partial y}+\frac{\partial}{\partial x}\left[\mu\left(\frac{\partial v}{\partial x}+\frac{\partial u}{\partial y}\right)\right]+\frac{\partial}{\partial y}\left[2\mu\frac{\partial v}{\partial y}+\lambda\nabla\cdot\mathbf V\right]+\frac{\partial}{\partial z}\left[\mu\left(\frac{\partial v}{\partial z}+\frac{\partial w}{\partial y}\right)\right]$ | **θ:** $\rho\left(\frac{\partial v_\theta}{\partial t}+v_r\frac{\partial v_\theta}{\partial r}+\frac{v_\theta}{r}\frac{\partial v_\theta}{\partial\theta}+v_z\frac{\partial v_\theta}{\partial z}+\frac{v_rv_\theta}{r}\right)=\rho g_\theta-\frac{1}{r}\frac{\partial p}{\partial\theta}+\frac{1}{r^2}\frac{\partial(r^2\tau_{r\theta})}{\partial r}+\frac{1}{r}\frac{\partial\tau_{\theta\theta}}{\partial\theta}+\frac{\partial\tau_{\theta z}}{\partial z}$ |
| **z:** $\rho\left(\frac{\partial w}{\partial t}+u\frac{\partial w}{\partial x}+v\frac{\partial w}{\partial y}+w\frac{\partial w}{\partial z}\right)=\rho g_z-\frac{\partial p}{\partial z}+\frac{\partial}{\partial x}\left[\mu\left(\frac{\partial w}{\partial x}+\frac{\partial u}{\partial z}\right)\right]+\frac{\partial}{\partial y}\left[\mu\left(\frac{\partial v}{\partial z}+\frac{\partial w}{\partial y}\right)\right]+\frac{\partial}{\partial z}\left[2\mu\frac{\partial w}{\partial z}+\lambda\nabla\cdot\mathbf V\right]$ | **z:** $\rho\left(\frac{\partial v_z}{\partial t}+v_r\frac{\partial v_z}{\partial r}+\frac{v_\theta}{r}\frac{\partial v_z}{\partial\theta}+v_z\frac{\partial v_z}{\partial z}\right)=\rho g_z-\frac{\partial p}{\partial z}+\frac{1}{r}\frac{\partial(r\tau_{rz})}{\partial r}+\frac{1}{r}\frac{\partial\tau_{\theta z}}{\partial\theta}+\frac{\partial\tau_{zz}}{\partial z}$ |
- **Constant $\mu,\lambda$ components:** take the section 6 equations and add $(\lambda+\mu)\frac{\partial(\nabla\cdot\mathbf V)}{\partial x}$, $(\lambda+\mu)\frac{\partial(\nabla\cdot\mathbf V)}{\partial y}$, $(\lambda+\mu)\frac{\partial(\nabla\cdot\mathbf V)}{\partial z}$ in Cartesian, and $(\lambda+\mu)\frac{\partial(\nabla\cdot\mathbf V)}{\partial r}$, $(\lambda+\mu)\frac{1}{r}\frac{\partial(\nabla\cdot\mathbf V)}{\partial\theta}$, $(\lambda+\mu)\frac{\partial(\nabla\cdot\mathbf V)}{\partial z}$ in cylindrical
## 6. Navier-Stokes: Incompressible (constant $\rho,\mu$)
- **Vector:** $\rho\frac{D\mathbf V}{Dt}=\rho\mathbf g-\nabla p+\mu\nabla^2\mathbf V$, $\;\nabla\cdot\mathbf V=0$
#### Components
| Cartesian | Cylindrical |
|---|---|
| **x:** $\rho\left(\frac{\partial u}{\partial t}+u\frac{\partial u}{\partial x}+v\frac{\partial u}{\partial y}+w\frac{\partial u}{\partial z}\right)=\rho g_x-\frac{\partial p}{\partial x}+\mu\left(\frac{\partial^2u}{\partial x^2}+\frac{\partial^2u}{\partial y^2}+\frac{\partial^2u}{\partial z^2}\right)$ | **r:** $\rho\left(\frac{\partial v_r}{\partial t}+v_r\frac{\partial v_r}{\partial r}+\frac{v_\theta}{r}\frac{\partial v_r}{\partial\theta}+v_z\frac{\partial v_r}{\partial z}-\frac{v_\theta^2}{r}\right)=\rho g_r-\frac{\partial p}{\partial r}+\mu\left[\frac{\partial}{\partial r}\left(\frac{1}{r}\frac{\partial(rv_r)}{\partial r}\right)+\frac{1}{r^2}\frac{\partial^2v_r}{\partial\theta^2}+\frac{\partial^2v_r}{\partial z^2}-\frac{2}{r^2}\frac{\partial v_\theta}{\partial\theta}\right]$ |
| **y:** $\rho\left(\frac{\partial v}{\partial t}+u\frac{\partial v}{\partial x}+v\frac{\partial v}{\partial y}+w\frac{\partial v}{\partial z}\right)=\rho g_y-\frac{\partial p}{\partial y}+\mu\left(\frac{\partial^2v}{\partial x^2}+\frac{\partial^2v}{\partial y^2}+\frac{\partial^2v}{\partial z^2}\right)$ | **θ:** $\rho\left(\frac{\partial v_\theta}{\partial t}+v_r\frac{\partial v_\theta}{\partial r}+\frac{v_\theta}{r}\frac{\partial v_\theta}{\partial\theta}+v_z\frac{\partial v_\theta}{\partial z}+\frac{v_rv_\theta}{r}\right)=\rho g_\theta-\frac{1}{r}\frac{\partial p}{\partial\theta}+\mu\left[\frac{\partial}{\partial r}\left(\frac{1}{r}\frac{\partial(rv_\theta)}{\partial r}\right)+\frac{1}{r^2}\frac{\partial^2v_\theta}{\partial\theta^2}+\frac{\partial^2v_\theta}{\partial z^2}+\frac{2}{r^2}\frac{\partial v_r}{\partial\theta}\right]$ |
| **z:** $\rho\left(\frac{\partial w}{\partial t}+u\frac{\partial w}{\partial x}+v\frac{\partial w}{\partial y}+w\frac{\partial w}{\partial z}\right)=\rho g_z-\frac{\partial p}{\partial z}+\mu\left(\frac{\partial^2w}{\partial x^2}+\frac{\partial^2w}{\partial y^2}+\frac{\partial^2w}{\partial z^2}\right)$ | **z:** $\rho\left(\frac{\partial v_z}{\partial t}+v_r\frac{\partial v_z}{\partial r}+\frac{v_\theta}{r}\frac{\partial v_z}{\partial\theta}+v_z\frac{\partial v_z}{\partial z}\right)=\rho g_z-\frac{\partial p}{\partial z}+\mu\left[\frac{1}{r}\frac{\partial}{\partial r}\left(r\frac{\partial v_z}{\partial r}\right)+\frac{1}{r^2}\frac{\partial^2v_z}{\partial\theta^2}+\frac{\partial^2v_z}{\partial z^2}\right]$ |
## 7. ODE Toolkit
| Type | Equation | Solution |
|---|---|---|
| Direct integration | $\frac{d^2u}{dy^2}=C$ | $u=\frac{C}{2}y^2+C_1y+C_2$ |
| Radial (pipe) | $\frac{1}{r}\frac{d}{dr}\left(r\frac{du}{dr}\right)=C$ | $u=\frac{C}{4}r^2+C_1\ln r+C_2$; finite at $r=0\Rightarrow C_1=0$ |
| Swirl | $\frac{d}{dr}\left[\frac{1}{r}\frac{d(rv_\theta)}{dr}\right]=0$ | $v_\theta=C_1r+\frac{C_2}{r}$ |
| Euler-Cauchy | $r^2\frac{d^2f}{dr^2}+ar\frac{df}{dr}+bf=0$ | $f=r^m$ with $m(m-1)+am+b=0$; repeated root: $r^m(C_1+C_2\ln r)$ |
| Constant coefficient | $\frac{d^2f}{dx^2}+a\frac{df}{dx}+bf=0$, roots of $s^2+as+b=0$ | Real: $C_1e^{s_1x}+C_2e^{s_2x}$; repeated: $(C_1+C_2x)e^{sx}$; complex $\alpha\pm i\beta$: $e^{\alpha x}(C_1\cos\beta x+C_2\sin\beta x)$ |
| Hyperbolic | $\frac{d^2f}{dx^2}-k^2f=0$ | $C_1\sinh kx+C_2\cosh kx$ |
| First order linear | $\frac{dy}{dx}+P(x)y=Q(x)$ | $y=\frac{1}{I}\left(\int IQ\,dx+C\right)$, $I=e^{\int P\,dx}$ |
| Separable | $\frac{dy}{dx}=g(x)h(y)$ | $\int\frac{dy}{h(y)}=\int g(x)\,dx$ |
| Separation constant | $f(x)=g(y)$ for all $x,y$ | Both equal a constant, for example $\frac{dp}{dx}=\mu\frac{d^2u}{dy^2}=$ constant |
| Similarity | $\frac{\partial u}{\partial t}=\nu\frac{\partial^2u}{\partial y^2}$, $\eta=\frac{y}{2\sqrt{\nu t}}$, $u=Uf(\eta)$ | $\frac{d^2f}{d\eta^2}+2\eta\frac{df}{d\eta}=0\Rightarrow f=C_1\,\mathrm{erf}\,\eta+C_2$ |
| Oscillatory | $u=\mathrm{Re}[f(y)e^{i\omega t}]$ (real part) $\Rightarrow i\omega f=\nu\frac{d^2f}{dy^2}$ | $f=Ae^{-(1+i)ky}+Be^{(1+i)ky}$, $k=\sqrt{\frac{\omega}{2\nu}}$ |
| Separation of variables | $u=u_{ss}(y)+\tilde u(y,t)$ with $\tilde u=0$ at walls; $\tilde u=Y(y)T(t)$: $\frac{1}{\nu T}\frac{dT}{dt}=\frac{1}{Y}\frac{d^2Y}{dy^2}=-\beta^2$ | $T=e^{-\nu\beta^2t}$, $Y=A\sin\beta y+B\cos\beta y$; on $0\le y\le h$: $\beta_n=\frac{n\pi}{h}$, $b_n=\frac{2}{h}\int_0^h\tilde u(y,0)\sin\frac{n\pi y}{h}\,dy$ |
| Bessel | $x^2\frac{d^2y}{dx^2}+x\frac{dy}{dx}+(x^2-n^2)y=0$ | $C_1J_n(x)+C_2Y_n(x)$, $Y_n\to\infty$ at 0; with $-x^2$ instead: $I_n,K_n$; pipe startup $\frac{d^2R}{dr^2}+\frac{1}{r}\frac{dR}{dr}+\beta^2R=0\Rightarrow J_0(\beta r)$, $J_0(\beta_nR)=0$ |
- **Boundary conditions:** no slip $u_{fluid}=u_{wall}$; free surface $\tau=\mu\frac{du}{dy}=0$; symmetry $\frac{du}{dy}=0$; on the axis $u$ is finite; far field is bounded
## 8. Exact Solutions: Step by Step
- **Recipe:** (1) list assumptions (2) continuity tells you what is zero (3) cancel terms in each momentum equation (4) integrate the ODE (5) apply boundary conditions to find the constants (6) get $Q$, $\bar u$, $\tau_w$
### 8.1 Couette Flow (plate at $y=0$ fixed, plate at $y=h$ moving at $U$, no pressure gradient)
1. **Assume:** steady $\left(\frac{\partial}{\partial t}=0\right)$, infinite plates $\left(\frac{\partial}{\partial z}=0\right)$, $v=w=0$, $\frac{\partial p}{\partial x}=0$, no gravity along $x$
2. **Continuity:** $\frac{\partial u}{\partial x}+\underbrace{\frac{\partial v}{\partial y}}_{v=0}+\underbrace{\frac{\partial w}{\partial z}}_{w=0}=0\Rightarrow\frac{\partial u}{\partial x}=0$, so $u=u(y)$ only (fully developed)
3. **x-momentum:** $\rho\Big(\underbrace{\frac{\partial u}{\partial t}}_{\text{steady}}+\underbrace{u\frac{\partial u}{\partial x}}_{\text{continuity}}+\underbrace{v\frac{\partial u}{\partial y}}_{v=0}+\underbrace{w\frac{\partial u}{\partial z}}_{w=0}\Big)=\underbrace{\rho g_x}_{0}-\underbrace{\frac{\partial p}{\partial x}}_{0}+\mu\Big(\underbrace{\frac{\partial^2u}{\partial x^2}}_{\text{continuity}}+\frac{\partial^2u}{\partial y^2}+\underbrace{\frac{\partial^2u}{\partial z^2}}_{\text{infinite}}\Big)\;\Rightarrow\;\frac{d^2u}{dy^2}=0$
4. **Integrate twice:** $\frac{du}{dy}=C_1\;\Rightarrow\;u=C_1y+C_2$
5. **Boundary conditions:** $u(0)=0\Rightarrow C_2=0$; $\;u(h)=U\Rightarrow C_1h=U\Rightarrow C_1=\frac{U}{h}$
6. **Result:** $u=\frac{Uy}{h}$, $\;\tau=\mu\frac{du}{dy}=\frac{\mu U}{h}$ (same everywhere), $\;Q=\frac{Uh}{2}$ per unit width
### 8.2 Couette-Poiseuille Flow (same as 8.1 but with a pressure gradient $\frac{dp}{dx}$)
1. **Assume and continuity:** same as 8.1, so $u=u(y)$
2. **y-momentum:** every term is zero except $0=-\frac{\partial p}{\partial y}$, so $p=p(x)$ only
3. **x-momentum:** same cancellations as 8.1 but keep pressure: $0=-\frac{dp}{dx}+\mu\frac{d^2u}{dy^2}$. Left side depends only on $x$, right side only on $y$, so $\frac{dp}{dx}$ is a constant
4. **Integrate twice:** $\frac{d^2u}{dy^2}=\frac{1}{\mu}\frac{dp}{dx}\;\Rightarrow\;\frac{du}{dy}=\frac{1}{\mu}\frac{dp}{dx}y+C_1\;\Rightarrow\;u=\frac{1}{2\mu}\frac{dp}{dx}y^2+C_1y+C_2$
5. **Boundary conditions:** $u(0)=0\Rightarrow C_2=0$; $\;u(h)=U\Rightarrow\frac{1}{2\mu}\frac{dp}{dx}h^2+C_1h=U\Rightarrow C_1=\frac{U}{h}-\frac{h}{2\mu}\frac{dp}{dx}$
6. **Result:** $u=\frac{Uy}{h}-\frac{1}{2\mu}\frac{dp}{dx}\,y(h-y)$, $\;Q=\int_0^hu\,dy=\frac{Uh}{2}-\frac{h^3}{12\mu}\frac{dp}{dx}$
### 8.3 Plane Poiseuille Flow (fixed walls at $y=\pm h$, driven by $\frac{dp}{dx}$)
1. **Assume, continuity, momentum:** same as 8.2, giving $\mu\frac{d^2u}{dy^2}=\frac{dp}{dx}$
2. **Integrate twice:** $u=\frac{1}{2\mu}\frac{dp}{dx}y^2+C_1y+C_2$
3. **Boundary conditions:** $u(h)=0$ and $u(-h)=0$. Subtract the two: $2C_1h=0\Rightarrow C_1=0$ (same as symmetry $\frac{du}{dy}(0)=0$). Then $\frac{1}{2\mu}\frac{dp}{dx}h^2+C_2=0\Rightarrow C_2=-\frac{h^2}{2\mu}\frac{dp}{dx}$
4. **Result:** $u=-\frac{1}{2\mu}\frac{dp}{dx}(h^2-y^2)$, $\;u_{max}=u(0)=-\frac{h^2}{2\mu}\frac{dp}{dx}$
5. **Derived:** $Q=\int_{-h}^{h}u\,dy=-\frac{2h^3}{3\mu}\frac{dp}{dx}$, $\;\bar u=\frac{Q}{2h}=\frac23u_{max}$, $\;\tau_w=\mu\frac{du}{dy}\Big|_{y=-h}=-h\frac{dp}{dx}$
### 8.4 Hagen-Poiseuille Flow (pipe of radius $R$, driven by $\frac{dp}{dz}$)
1. **Assume:** steady, axisymmetric $\left(\frac{\partial}{\partial\theta}=0\right)$, $v_r=v_\theta=0$, $v_z=u$, no gravity along $z$
2. **Continuity:** $\underbrace{\frac{1}{r}\frac{\partial(rv_r)}{\partial r}}_{v_r=0}+\underbrace{\frac{1}{r}\frac{\partial v_\theta}{\partial\theta}}_{v_\theta=0}+\frac{\partial v_z}{\partial z}=0\Rightarrow\frac{\partial u}{\partial z}=0$, so $u=u(r)$ only
3. **r-momentum:** every velocity term is zero, leaving $0=-\frac{\partial p}{\partial r}$, so $p=p(z)$ only
4. **z-momentum:** $\rho\Big(\underbrace{\frac{\partial v_z}{\partial t}}_{\text{steady}}+\underbrace{v_r\frac{\partial v_z}{\partial r}}_{v_r=0}+\underbrace{\frac{v_\theta}{r}\frac{\partial v_z}{\partial\theta}}_{v_\theta=0}+\underbrace{v_z\frac{\partial v_z}{\partial z}}_{\text{continuity}}\Big)=-\frac{dp}{dz}+\mu\Big[\frac{1}{r}\frac{d}{dr}\left(r\frac{du}{dr}\right)+\underbrace{\frac{1}{r^2}\frac{\partial^2v_z}{\partial\theta^2}}_{\text{axisymmetric}}+\underbrace{\frac{\partial^2v_z}{\partial z^2}}_{\text{continuity}}\Big]\;\Rightarrow\;\frac{1}{r}\frac{d}{dr}\left(r\frac{du}{dr}\right)=\frac{1}{\mu}\frac{dp}{dz}$
5. **Integrate:** multiply by $r$: $\frac{d}{dr}\left(r\frac{du}{dr}\right)=\frac{1}{\mu}\frac{dp}{dz}r\;\Rightarrow\;r\frac{du}{dr}=\frac{1}{2\mu}\frac{dp}{dz}r^2+C_1\;\Rightarrow\;\frac{du}{dr}=\frac{1}{2\mu}\frac{dp}{dz}r+\frac{C_1}{r}\;\Rightarrow\;u=\frac{1}{4\mu}\frac{dp}{dz}r^2+C_1\ln r+C_2$
6. **Boundary conditions:** $u$ finite at $r=0$ but $\ln0\to-\infty$, so $C_1=0$; $\;u(R)=0\Rightarrow C_2=-\frac{R^2}{4\mu}\frac{dp}{dz}$
7. **Result:** $u=-\frac{1}{4\mu}\frac{dp}{dz}(R^2-r^2)$, $\;u_{max}=-\frac{R^2}{4\mu}\frac{dp}{dz}$
8. **Derived:** $Q=\int_0^Ru\,2\pi r\,dr=-\frac{\pi R^4}{8\mu}\frac{dp}{dz}$, $\;\bar u=\frac{Q}{\pi R^2}=\frac{u_{max}}{2}$, $\;\tau_w=-\mu\frac{du}{dr}\Big|_R=-\frac{R}{2}\frac{dp}{dz}$, $\;f=\frac{64}{Re_D}$
### 8.5 Annulus (fixed walls at $r=R_i$ and $r=R_o$, driven by $\frac{dp}{dz}$)
1. **Assume through integrate:** same as 8.4, $u=\frac{1}{4\mu}\frac{dp}{dz}r^2+C_1\ln r+C_2$. Keep $C_1$ since $r=0$ is not in the flow
2. **Boundary conditions:** $u(R_o)=0$: $\frac{1}{4\mu}\frac{dp}{dz}R_o^2+C_1\ln R_o+C_2=0$; $\;u(R_i)=0$: $\frac{1}{4\mu}\frac{dp}{dz}R_i^2+C_1\ln R_i+C_2=0$
3. **Solve:** subtract: $\frac{1}{4\mu}\frac{dp}{dz}(R_o^2-R_i^2)+C_1\ln\frac{R_o}{R_i}=0\Rightarrow C_1=-\frac{1}{4\mu}\frac{dp}{dz}\frac{R_o^2-R_i^2}{\ln(R_o/R_i)}$; then $C_2=-\frac{1}{4\mu}\frac{dp}{dz}R_o^2-C_1\ln R_o$
4. **Result:** $u=-\frac{1}{4\mu}\frac{dp}{dz}\left[R_o^2-r^2+(R_o^2-R_i^2)\frac{\ln(r/R_o)}{\ln(R_o/R_i)}\right]$
### 8.6 Circular Couette Flow (inner cylinder $R_1$ spinning at $\Omega_1$, outer cylinder $R_2$ spinning at $\Omega_2$)
1. **Assume:** steady, $v_r=v_z=0$, $v_\theta=v_\theta(r)$, $\frac{\partial}{\partial\theta}=\frac{\partial}{\partial z}=0$, no gravity
2. **Continuity:** $\frac{1}{r}\frac{\partial v_\theta}{\partial\theta}=0$, satisfied automatically
3. **θ-momentum:** $\rho\Big(\underbrace{\frac{\partial v_\theta}{\partial t}}_{\text{steady}}+\underbrace{v_r\frac{\partial v_\theta}{\partial r}}_{v_r=0}+\underbrace{\frac{v_\theta}{r}\frac{\partial v_\theta}{\partial\theta}}_{0}+\underbrace{v_z\frac{\partial v_\theta}{\partial z}}_{v_z=0}+\underbrace{\frac{v_rv_\theta}{r}}_{v_r=0}\Big)=-\underbrace{\frac{1}{r}\frac{\partial p}{\partial\theta}}_{0}+\mu\Big[\frac{d}{dr}\left(\frac{1}{r}\frac{d(rv_\theta)}{dr}\right)+\underbrace{\frac{1}{r^2}\frac{\partial^2v_\theta}{\partial\theta^2}}_{0}+\underbrace{\frac{\partial^2v_\theta}{\partial z^2}}_{0}+\underbrace{\frac{2}{r^2}\frac{\partial v_r}{\partial\theta}}_{0}\Big]\;\Rightarrow\;\frac{d}{dr}\left(\frac{1}{r}\frac{d(rv_\theta)}{dr}\right)=0$
4. **Integrate:** $\frac{1}{r}\frac{d(rv_\theta)}{dr}=2C_1\;\Rightarrow\;\frac{d(rv_\theta)}{dr}=2C_1r\;\Rightarrow\;rv_\theta=C_1r^2+C_2\;\Rightarrow\;v_\theta=C_1r+\frac{C_2}{r}$
5. **Boundary conditions:** $v_\theta(R_1)=\Omega_1R_1$ and $v_\theta(R_2)=\Omega_2R_2$. Multiply each by its radius: $\Omega_1R_1^2=C_1R_1^2+C_2$ and $\Omega_2R_2^2=C_1R_2^2+C_2$
6. **Solve:** subtract: $C_1=\frac{\Omega_2R_2^2-\Omega_1R_1^2}{R_2^2-R_1^2}$; then $C_2=\Omega_1R_1^2-C_1R_1^2=\frac{(\Omega_1-\Omega_2)R_1^2R_2^2}{R_2^2-R_1^2}$
7. **r-momentum (pressure):** $-\rho\frac{v_\theta^2}{r}=-\frac{\partial p}{\partial r}\Rightarrow\frac{dp}{dr}=\frac{\rho v_\theta^2}{r}$ (pressure rises outward)
8. **Shear and torque:** $\tau_{r\theta}=\mu r\frac{d}{dr}\left(\frac{v_\theta}{r}\right)=-\frac{2\mu C_2}{r^2}$, torque per unit length $=\tau_{r\theta}(2\pi r)r$, magnitude $4\pi\mu\lvert C_2\rvert$ at every radius
9. **Special cases:** outer fixed $(\Omega_2=0)$: $C_1=-\frac{\Omega_1R_1^2}{R_2^2-R_1^2}$, $C_2=\frac{\Omega_1R_1^2R_2^2}{R_2^2-R_1^2}$; single cylinder in infinite fluid: $v_\theta=\frac{\Omega_1R_1^2}{r}$
### 8.7 Falling Film (liquid layer of thickness $h$ on an incline at angle $\theta$, $x$ down the slope, $y$ up from the wall)
1. **Assume:** steady, $v=0$, $u=u(y)$, free surface at atmospheric pressure so $\frac{\partial p}{\partial x}=0$; gravity $g_x=g\sin\theta$, $g_y=-g\cos\theta$
2. **x-momentum:** convective terms vanish as in 8.1, leaving $0=\rho g\sin\theta+\mu\frac{d^2u}{dy^2}$
3. **y-momentum:** $0=-\rho g\cos\theta-\frac{\partial p}{\partial y}\Rightarrow p=p_a+\rho g\cos\theta\,(h-y)$ (hydrostatic)
4. **Integrate twice:** $\frac{du}{dy}=-\frac{\rho g\sin\theta}{\mu}y+C_1\;\Rightarrow\;u=-\frac{\rho g\sin\theta}{2\mu}y^2+C_1y+C_2$
5. **Boundary conditions:** no slip $u(0)=0\Rightarrow C_2=0$; no shear at free surface $\frac{du}{dy}(h)=0\Rightarrow C_1=\frac{\rho g\sin\theta}{\mu}h$
6. **Result:** $u=\frac{\rho g\sin\theta}{\mu}\left(hy-\frac{y^2}{2}\right)$, $\;u_{max}=u(h)=\frac{\rho g\sin\theta\,h^2}{2\mu}$, $\;Q=\int_0^hu\,dy=\frac{\rho g\sin\theta\,h^3}{3\mu}$
### 8.8 Stokes First Problem (plate at $y=0$ suddenly starts moving at $U$, fluid above initially at rest)
1. **Assume:** $u=u(y,t)$, $v=0$, infinite plate $\left(\frac{\partial}{\partial x}=0\right)$, no pressure gradient
2. **x-momentum:** $\rho\Big(\frac{\partial u}{\partial t}+\underbrace{u\frac{\partial u}{\partial x}}_{0}+\underbrace{v\frac{\partial u}{\partial y}}_{v=0}\Big)=-\underbrace{\frac{\partial p}{\partial x}}_{0}+\mu\Big(\underbrace{\frac{\partial^2u}{\partial x^2}}_{0}+\frac{\partial^2u}{\partial y^2}\Big)\;\Rightarrow\;\frac{\partial u}{\partial t}=\nu\frac{\partial^2u}{\partial y^2}$
3. **Conditions:** $u(y,0)=0$, $\;u(0,t)=U$, $\;u(\infty,t)=0$
4. **Similarity variable:** $\eta=\frac{y}{2\sqrt{\nu t}}$, $u=Uf(\eta)$. Chain rule: $\frac{\partial u}{\partial t}=-\frac{\eta}{2t}Uf'$, $\;\frac{\partial^2u}{\partial y^2}=\frac{U}{4\nu t}f''$. Substitute: $-\frac{\eta}{2t}f'=\frac{1}{4t}f''\Rightarrow f''+2\eta f'=0$
5. **Transform conditions:** $y=0\to\eta=0$: $f(0)=1$; $\;y\to\infty$ and $t=0$ both give $\eta\to\infty$: $f(\infty)=0$
6. **Solve:** let $g=f'$: $g'=-2\eta g\Rightarrow g=C_1e^{-\eta^2}\Rightarrow f=C_1\frac{\sqrt\pi}{2}\mathrm{erf}\,\eta+C_2$. $f(0)=1\Rightarrow C_2=1$; $f(\infty)=0\Rightarrow C_1\frac{\sqrt\pi}{2}=-1$
7. **Result:** $u=U\left[1-\mathrm{erf}\,\eta\right]=U\,\mathrm{erfc}\left(\frac{y}{2\sqrt{\nu t}}\right)$, $\;\delta_{99}\approx3.64\sqrt{\nu t}$, $\;\tau_w=\mu\frac{\partial u}{\partial y}\Big|_0=-\frac{\mu U}{\sqrt{\pi\nu t}}$
### 8.9 Stokes Second Problem (plate at $y=0$ oscillates as $u(0,t)=U\cos\omega t$)
1. **Assume and momentum:** same as 8.8: $\frac{\partial u}{\partial t}=\nu\frac{\partial^2u}{\partial y^2}$, with $u$ bounded as $y\to\infty$ (steady periodic, no initial condition)
2. **Complex form:** $u=\mathrm{Re}\left[f(y)e^{i\omega t}\right]$ (real part). Substitute: $i\omega f=\nu\frac{d^2f}{dy^2}$
3. **Solve:** $s^2=\frac{i\omega}{\nu}\Rightarrow s=\pm(1+i)k$ with $k=\sqrt{\frac{\omega}{2\nu}}$ (using $\sqrt i=\frac{1+i}{\sqrt2}$), so $f=Ae^{-(1+i)ky}+Be^{(1+i)ky}$
4. **Boundary conditions:** bounded at $\infty\Rightarrow B=0$; $\;u(0,t)=\mathrm{Re}[Ue^{i\omega t}]\Rightarrow A=U$
5. **Result:** $u=\mathrm{Re}\left[Ue^{-ky}e^{i(\omega t-ky)}\right]=Ue^{-ky}\cos(\omega t-ky)$; amplitude decays as $e^{-ky}$, phase lags by $ky$; $\delta_{99}\approx4.6\sqrt{\frac{2\nu}{\omega}}$
### 8.10 Couette Startup (plate at $y=0$ fixed, plate at $y=h$ suddenly moves at $U$)
1. **Momentum:** same as 8.8: $\frac{\partial u}{\partial t}=\nu\frac{\partial^2u}{\partial y^2}$, with $u(0,t)=0$, $u(h,t)=U$, $u(y,0)=0$
2. **Split off steady part:** $u_{ss}=\frac{Uy}{h}$ (result of 8.1). Let $u=\frac{Uy}{h}+\tilde u$. Then $\frac{\partial\tilde u}{\partial t}=\nu\frac{\partial^2\tilde u}{\partial y^2}$ with $\tilde u(0,t)=\tilde u(h,t)=0$ and $\tilde u(y,0)=-\frac{Uy}{h}$
3. **Separate:** $\tilde u=Y(y)T(t)\Rightarrow T=e^{-\nu\beta^2t}$, $Y=A\sin\beta y+B\cos\beta y$
4. **Boundary conditions:** $Y(0)=0\Rightarrow B=0$; $\;Y(h)=0\Rightarrow\sin\beta h=0\Rightarrow\beta_n=\frac{n\pi}{h}$
5. **Superpose:** $\tilde u=\sum_{n=1}^{\infty}b_n\sin\frac{n\pi y}{h}\,e^{-n^2\pi^2\nu t/h^2}$
6. **Initial condition:** $b_n=\frac{2}{h}\int_0^h\left(-\frac{Uy}{h}\right)\sin\frac{n\pi y}{h}\,dy=\frac{2U(-1)^n}{n\pi}$ (using $\int_0^hy\sin\frac{n\pi y}{h}dy=\frac{h^2(-1)^{n+1}}{n\pi}$)
7. **Result:** $u=\frac{Uy}{h}+\sum_{n=1}^{\infty}\frac{2U(-1)^n}{n\pi}\sin\frac{n\pi y}{h}\,e^{-n^2\pi^2\nu t/h^2}$; reaches steady state when $t\sim\frac{h^2}{\nu}$
