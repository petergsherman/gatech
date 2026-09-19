---
note_type: running-notes
course: AE6353
tags:
- gt
- notes/running
permalink: brain/ae6353-orbital-mechanics/ae6353-running-notes
---

# 2026-08-24

*Source: [[8-24-2026 rough notes.pdf]] · Refined: [[2026-08-24 refined notes]]*

> [!aside]
> order *Fundamentals of Astrodynamics* 2nd ed. <span style="color:purple">— reminder to order the textbook (Bate, Mueller & White is the standard "Fundamentals of Astrodynamics" 2nd ed.)</span>

Comments: We look at the motion of bodies in space
→ Focus on translational motion (particles)
→ attitude dynamics is AE 6356

Almost everything we do has roots in the ==n-body problem==

### N-Body problem

- described by Newton in 1687
- much of what we need centers around a few key results:

1. <u style="text-decoration-color:#1a73e8"><b>Newton's Second Law</b></u>: Time rate of change of linear momentum is proportional to the force applied

$$
\dot{\bar{p}} = \frac{d}{dt}(m\bar{v}) = \textcolor{red}{\cancel{\dot{m}\bar{v}}}^{\,\textcolor{red}{0}} + \underbrace{m\dot{\bar{v}}}_{m\bar{a}} \quad\Rightarrow\quad \dot{\bar{p}} = m\bar{a}
$$

$\textcolor{red}{\text{when } \dot{m} = 0}$

$$
\bar{F} = \dot{\bar{p}} = m\bar{a}
$$

★ <mark style="background:#aecbfa">Note: This law is only valid in an inertial frame</mark>
→ <mark>Frame that is not rotating or accel<span style="color:purple">erat</span>ing</mark> — A frame in which forces on particles cause no acceleration

> [!aside]
> Brush up on Kinematics and Reynolds transport

2. **Newton's Law of Universal Gravitation**: The gravitational attraction force between two objects is proportional to their masses and inversely to the distance between them.

$$
F = G\,\frac{m_1 m_2}{r^2} \qquad G = 6.674\times 10^{-11}\ \frac{\mathrm{N\,m^2}}{\mathrm{kg^2}}
$$

![[2026-08-24 fig1.svg]]

$$
\bar{r}_{12} = \bar{r}_2 - \bar{r}_1
$$

$\bar{F}_{12}$ at $m_1$, due to $m_2$

$$
\bar{F}_{12} = G\,\frac{m_1 m_2}{r_{12}^{\,2}}\,\frac{\bar{r}_{12}}{r_{12}}, \qquad r_{12} = \lVert \bar{r}_{12} \rVert
$$

$$
\bar{F}_{12} = G\,\frac{m_1 m_2}{r_{12}^{\,3}}\,\bar{r}_{12}
$$

likewise:

$$
\bar{F}_{21} = G\,\frac{m_1 m_2}{r_{21}^{\,3}}\,\bar{r}_{21} \quad\Rightarrow\quad \bar{F}_{12} + \bar{F}_{21} = 0
$$

From this we obtain a pair of equations:

$$
m_1: \quad \bar{F}_{12} = G\,\frac{m_1 m_2}{r_{12}^{\,3}}\,\bar{r}_{12} = G\,\frac{m_1 m_2}{\lVert \bar{r}_2 - \bar{r}_1 \rVert^{3}}\,(\bar{r}_2 - \bar{r}_1) = m_1 \ddot{\bar{r}}_1
$$

$$
m_2: \quad \bar{F}_{21} = G\,\frac{m_1 m_2}{\lVert \bar{r}_1 - \bar{r}_2 \rVert^{3}}\,(\bar{r}_1 - \bar{r}_2) = m_2 \ddot{\bar{r}}_2
$$

<span style="color:#1a73e8">6 second-order differential equations</span>

> [!aside]
> $\textcolor{red}{\ddot{x} + x - 3 = 0 \quad \text{— second order}}$
> $\textcolor{green}{\dot{v} + x - 3 = 0 \quad \text{— first order}}$

12 degrees of freedom, so we need 12 constants of integration

Generally: $6N$ DOFs for $N$-bodies

Let's generalize these laws for the N-body problem:

![[2026-08-24 fig2.svg]]

$\textcolor{red}{\bar{r}_{12} = \bar{r}_2 - \bar{r}_1, \quad \bar{r}_{1k} = \bar{r}_k - \bar{r}_1, \quad \vdots}$

For the $i^{\text{th}}$ body of the system:

$$
\bar{F}_i = G \sum_{\substack{i=1 \\ j \neq i}}^{\textcolor{purple}{N}} \frac{m_i m_j}{r_{ij}^{\,3}}\,\bar{r}_{ij}, \quad \text{where} \quad \sum_{i=1}^{N} \bar{F}_i = 0
$$
Is there enough info for a closed-form solution for $n \ge 2$?

Let's assume all particles have a constant mass, $\dot{m}_i = 0$.

We can apply Newton's second law:

$$
\sum \bar{F}_i = \sum m_i \ddot{\bar{r}}_i = 0
$$

since $\frac{d}{dt} m = 0$

$$
\frac{d^2}{dt^2}\left(\sum m_i \bar{r}_i\right) = 0
$$

Let's define the center of mass as $\bar{r}_{cm} = \dfrac{\sum m_i \bar{r}_i}{\sum m_i}$ and $\sum m_i \neq 0$

$$
\frac{d^2}{dt^2}\left(\left(\sum m_i\right)\bar{r}_{cm}\right) = \sum m_i\,\frac{d^2}{dt^2}\,\bar{r}_{cm} = 0
$$

$\textcolor{red}{\sum m_i \text{: not } 0 \qquad \tfrac{d^2}{dt^2}\bar{r}_{cm} \text{: must be zero}}$

$\ddot{\bar{r}} = 0$ → system COM cannot accelerate

$\dot{\bar{r}}_{cm} = \bar{c}_1$ → linear momentum of the system is conserved

$\bar{r}_{cm} = \bar{c}_1 t + \bar{c}_2$ → system COM can move with constant velocity

Knowing $\bar{r}_{cm}(t_0)$ and $\dot{\bar{r}}_{cm}(t_0)$: you know 6 constants of integration ($\bar{c}_1$ and $\bar{c}_2$) associated with conservation to <span style="color:purple">(likely "of")</span> the system's linear momentum.

Also consider angular momentum: look at torque…

$$
\sum \bar{r}_i \times \bar{F}_i \qquad \text{consider } n = 2
$$

$$
\bar{r}_1 \times \bar{F}_1 + \bar{r}_2 \times \bar{F}_2
= \bar{r}_1 \times \frac{G m_1 m_2}{r_{12}^{\,3}}(\bar{r}_2 - \bar{r}_1)
+ \bar{r}_2 \times \frac{G m_1 m_2}{r_{21}^{\,3}}(\bar{r}_1 - \bar{r}_2)
$$

$$
= \frac{G m_1 m_2}{r_{13}^{\,3}}\left(\bar{r}_1 \times \bar{r}_2 - \textcolor{red}{\cancel{\bar{r}_1 \times \bar{r}_1}}^{\,\textcolor{red}{0}} + \bar{r}_2 \times \bar{r}_1 - \textcolor{red}{\cancel{\bar{r}_2 \times \bar{r}_2}}^{\,\textcolor{red}{0}}\right)
$$
$\textcolor{green}{(-)}$ <span style="color:purple">— the green ink links r̄₁ × r̄₂ and r̄₂ × r̄₁: they are negatives of each other</span>

$$
= \bar{0} \qquad \text{In general…} \quad \sum \bar{r}_i \times \bar{F}_i = \bar{0}
$$

# 2026-08-26

*Source: [[08-26-2026 - OM rough notes.pdf]] · Refined: [[2026-08-26 refined notes]]*

Since $\bar{F}_i = m_i \ddot{\bar{r}}_i$

$$
\underbrace{\bar{r}_1 \times (m_1 \ddot{\bar{r}}_1) + \ldots + \bar{r}_n \times (m_n \ddot{\bar{r}}_n)}_{\textcolor{red}{0}} + \sum m_i \left(\bar{v}_i \times \bar{r}_i\right) = 0
$$

recall $\dfrac{d}{dt}(\bar{a}\times\bar{b}) = \dot{\bar{a}}\times\bar{b} + \bar{a}\times\dot{\bar{b}}$

$$
\frac{d}{dt}\left[\, m_1 \bar{r}_1\times\dot{\bar{r}}_1 + \ldots + m_n\bar{r}_n\times\dot{\bar{r}}_n \,\right] = 0
$$

<span style="color:#1a73e8">↰ d/dt of this is the top equation</span>

integrate

$$
m_1\bar{r}_1\times\dot{\bar{r}}_1 + \ldots + m_n\bar{r}_n\times\dot{\bar{r}}_n = \bar{C}_3
$$

$$
= \sum m_i\,\bar{r}_i\times\dot{\bar{r}}_i = \sum m_i\,\bar{r}_i\times\bar{v}_i = \bar{C}_3
$$

→ Total angular momentum is conserved. (constant)

Three constants of integration ($\bar{C}_3$) from the initial conditions $\bar{r}_i$ and $\dot{\bar{r}}_i$

### Energy

Now consider the total energy of the system.

$$
\mathcal{E} = \underset{\textcolor{red}{\uparrow\ \text{Kinetic}}}{T} + \underset{\textcolor{red}{\uparrow\ \text{potential}}}{V}
$$

Kinetic energy: $T = \dfrac{1}{2}\displaystyle\sum m_i v_i^{\,2} = \dfrac{1}{2}\displaystyle\sum m_i\,\dot{\bar{r}}_i\cdot\dot{\bar{r}}_i$

$\textcolor{red}{\dot{\bar{r}}^{\mathsf{T}}\dot{\bar{r}}\ \text{(assuming column vectors)}}$ <span style="color:purple">— the red note points at the dot product</span>

Potential energy: $V = -G\,\dfrac{m_1 m_2}{r}$

$$
\Delta PE = -W = \int F\,dr \ \leftarrow\ \text{gravity is conservative force, so } W \text{ is independent on the path taken}
$$

> [!aside]
> $V = -\dfrac{1}{2}G\displaystyle\sum_{i=1}^{N}\sum_{\substack{j=1\\ j\neq i}}^{N}\frac{m_i m_j}{r_{ij}}$ (For $N$-bodies)
>
> $\textcolor{red}{\uparrow\ \text{potential function}}$
>
> $\bar{F}_i = -\nabla_{\bar{r}_i}V = -\dfrac{\partial V}{\partial \bar{r}_i}$

Now, $\bar{F}_i = m_i\ddot{\bar{r}}_i$ — dot $\dot{\bar{r}}$ on both sides

$$
\sum \dot{\bar{r}}_i\cdot\bar{F}_i = \underbrace{\sum m_i\,\dot{\bar{r}}_i\cdot\ddot{\bar{r}}_i}_{\uparrow}
$$

$$
\sum\dot{\bar{r}}_i\cdot(-\nabla V) = \sum\frac{d}{dt}\left[\frac{1}{2} m_i\,\dot{\bar{r}}_i\cdot\dot{\bar{r}}_i\right] \ \longrightarrow\ \frac{1}{2} m_i\,\ddot{\bar{r}}\cdot\dot{\bar{r}}_i + \frac{1}{2} m_i\,\dot{\bar{r}}_i\cdot\ddot{\bar{r}}_i
$$

<span style="color:purple">— a red arrow in the notes ties this product-rule expansion back to the braced sum above</span>

$$
\underbrace{-\sum \frac{d\bar{r}_i}{dt}\,\frac{\partial V}{\partial \bar{r}_i}}_{=\ -\dot{V}} = \underbrace{\frac{d}{dt}\sum\left[\frac{1}{2} m_i\,\dot{\bar{r}}_i\cdot\dot{\bar{r}}_i\right]}_{=\ \dot{T}}
$$

So, $-\dot{V} = \dot{T} \ \rightarrow\ \dot{T} + \dot{V} = 0$

integrate…

$$
\boxed{\ T + V = C_4\ }
$$

Total energy is conserved

In summary, we have 10 constants of integration

$$
\text{Total linear momentum:}\quad \left.\begin{aligned}\dot{\bar{r}}_{cm} &= \bar{C}_1\\ \bar{r}_{cm} &= \bar{C}_1 t + \bar{C}_2\end{aligned}\right\}\ \bar{C}_1\ \text{and}\ \bar{C}_2 = 6\ \text{constants}
$$

$$
\text{Total momentum:}\quad \sum\left(m_i\,\bar{r}_i\times\dot{\bar{r}}_i\right) = \bar{C}_3 \ \rightarrow\ C_3 = 3\ \text{constants}
$$

$$
\text{Total energy:}\quad \mathcal{E} = T+V = C_4 \ \longrightarrow\ C_4 = 1\ \text{constant}
$$

There are $6N$ equations of motion for the n-body problem

For $N=2$: $\quad 6n = 12 > 10 \quad$ So what?

Remember: General analytical solution does not exist
↳ But some special cases do have analytical solutions
↳ We can simulate/propagate the EOM from I.C.s
↳ Constants of motion must be satisfied at all times
 ↳ Allowable motion is constrained

### Two body problem

Suppose we have a system of only two bodies and wish to describe the motion of one body <u>relative to</u> the other.

Assume:
1. Only two bodies
2. Only gravitational forces
3. Spherical mass distributions

![[2026-08-26 fig1.svg]]

$$
\bar{F}_1 = \textcolor{red}{\cancel{m_1}}\,\ddot{\bar{r}}_1 = G\,\frac{\textcolor{red}{\cancel{m_1}}\,m_2}{r_{12}^{\,3}}\,\bar{r}_{12}
$$

$$
\bar{F}_2 = \textcolor{red}{\cancel{m_2}}\,\ddot{\bar{r}}_2 = G\,\frac{m_1\,\textcolor{red}{\cancel{m_2}}}{r_{12}^{\,3}}\,\left(-\bar{r}_{12}\right)
$$

$$
\bar{r}_{12} = \bar{r}_2 - \bar{r}_1
$$

$$
\ddot{\bar{r}} = \ddot{\bar{r}}_2 - \ddot{\bar{r}}_1
$$

$$
\ddot{\bar{r}}_{12} = \ddot{\bar{r}}_2 - \ddot{\bar{r}}_1 = -\frac{Gm_1}{r_{12}^{\,3}}\,\bar{r}_{12} - \frac{Gm_2}{r_{12}^{\,3}}\,\bar{r}_{12} = \frac{-G(m_1+m_2)}{r_{12}^{\,3}}\,\bar{r}_{12}
$$

Typically $m_1 \gg m_2$. Thus, $\bar{r}_{12} \approx \dfrac{-Gm_1}{r_{12}^{\,3}}\,\bar{r}_{12}$ $\qquad \textcolor{red}{Gm_1 = \mu}$

Since there are only two bodies… $\bar{r}_{12} = \bar{r}$

Thus,

$$
\boxed{\ \ddot{\bar{r}} = -\frac{\mu}{r^3}\,\bar{r} \quad\text{or}\quad \ddot{\bar{r}} = -\frac{\mu}{r^2}\,\hat{r}\ } \qquad \hat{r} = \frac{\bar{r}}{r} \qquad r = \lVert\bar{r}\rVert
$$

### Specific energy

The specific energy is the total energy divided by the mass

$$
\mathcal{E} = \frac{KE + PE}{m_2} = \frac{T+V}{m_2} \qquad T = \frac{1}{2}m_2 v^2 \qquad V = -\frac{G m_1 m_2}{r}
$$

$$
\mathcal{E} = \frac{1}{\textcolor{red}{\cancel{m_2}}}\left[\frac{1}{2}\,\textcolor{red}{\cancel{m_2}}\,v^2 - \frac{G m_1\,\textcolor{red}{\cancel{m_2}}}{r}\right] = \frac{v^2}{2} - \frac{\mu}{r}
$$

$$
\boxed{\ \mathcal{E} = \frac{v^2}{2} - \frac{\mu}{r} \quad \text{Vis-viva equation}\ } \qquad \frac{d\mathcal{E}}{dt} = 0\ \text{ to show conserved}
$$

### Specific angular momentum

Recall that angular momentum is

$$
\bar{H} = \bar{r}\times(m\bar{v}) = \bar{r}\times m\dot{\bar{r}} \qquad \text{So,}\quad \bar{h} = \frac{\bar{H}}{m} = \frac{1}{m}\left(\bar{r}\times m\bar{v}\right) = \bar{r}\times\bar{v}
$$

![[2026-08-26 fig2.svg]]

Generally allows us to relate the magnitude of $\bar{h}$ to $\bar{r}$ and $\bar{v}$

$$
\lVert\bar{a}\times\bar{b}\rVert = \lVert\bar{a}\rVert\,\lVert\bar{b}\rVert\,\sin\theta_{ab}
$$

$$
h = \lVert\bar{r}\times\bar{v}\rVert = rv\sin\phi = rv\cos\gamma
$$

### Review on Kinematics

$$
\begin{array}{ll}
\text{Translational:} & \text{rotational:}\\[2pt]
v = v_0 + at & \omega = \omega_0 + \alpha t\\
x = x_0 + vt + \tfrac{1}{2}at^2 & \theta = \theta_0 + \omega t + \tfrac{1}{2}\alpha t^2\\
v^2 = v_0^{\,2} + 2a(x-x_0) & \omega^2 = \omega_0^{\,2} + 2\alpha(\theta - \theta_0)\\
x = x_0 + \tfrac{1}{2}(v+v_0)t & \theta = \theta_0 + \tfrac{1}{2}(\omega+\omega_0)t
\end{array}
$$

$$
\begin{array}{ll}
\bar{r} = x\hat{\imath} + y\hat{\jmath} + z\hat{k} & \bar{r} = r\,\hat{e}_r\\
\bar{v} = \bar{r} = \dot{x}\hat{\imath} + \dot{y}\hat{\jmath} + \dot{z}\hat{k} & \bar{\omega} = \dot{\bar{r}} = \dot{r}\,\hat{e}_r + r\dot{\theta}\,\hat{e}_\theta\\
\bar{a} = \dot{\bar{v}} = \ddot{\bar{r}} = \ddot{x}\hat{\imath} + \ddot{y}\hat{\jmath} + \ddot{z}\hat{k} & \bar{\alpha} = \dot{\bar{\omega}} = \ddot{\bar{r}} = \left[\ddot{r} - r\dot{\theta}^2\right]\hat{e}_r + \left[2\dot{r}\dot{\theta} - r\ddot{\theta}\right]\hat{e}_\theta
\end{array}
$$

# 2026-08-31

*Source: [[08-31-2026 - om rough notes.pdf]] · Refined: [[2026-08-31 refined notes]]*

Generally allows us to relate the magnitude of $\bar{h}$ to $\bar{r}$ and $\bar{v}$

$$
\left\| \bar{a}\times\bar{b} \right\| = \left\| \bar{a} \right\| \left\| \bar{b} \right\| \sin\theta_{ab}
$$

$$
h = \left\| \bar{r}\times\bar{v} \right\| = rv\sin\phi = rv\cos\gamma
$$

Specific angular momentum is conserved…

$$
\frac{d\bar{h}}{dt} = 0
$$

$$
= \frac{d}{dt}\left(\bar{r}\times\bar{v}\right) = \frac{d}{dt}\left(\bar{r}\times\dot{\bar{r}}\right) = \underbrace{\dot{\bar{r}}\times\dot{\bar{r}}}_{\textcolor{red}{\bar{0}}} + \bar{r}\times\ddot{\bar{r}} = \underbrace{\bar{r}\times\left(-\frac{\mu}{r^{3}}\right)\bar{r}}_{\textcolor{red}{\text{also }\bar{0}}}
$$

Thus… $\dfrac{d\bar{h}}{dt} = 0$ so angular momentum is conserved.

### Trajectory equation

$$
r = \frac{p}{1+e\cos\theta}
$$

Our objective is to solve the two-body EOM.

$$
\ddot{\bar{r}} = -\frac{\mu}{r^3}\bar{r} \qquad \text{or} \qquad \ddot{\bar{r}} = -\frac{\mu}{r^2}\hat{r}\ , \qquad \hat{r} = \frac{\bar{r}}{r} \qquad r = \left\|\bar{r}\right\|
$$

Using our knowledge that $\bar{h}$ is constant,

Therefore, take the cross product of the EOM with $\bar{h}$

$$
\ddot{\bar{r}}\times\bar{h} = -\frac{\mu}{r^3}\bar{r}\times\bar{h} = -\frac{\mu}{r^3}\bar{r}\times\left(\bar{r}\times\dot{\bar{r}}\right)
$$

recall: $\bar{h}$ is constant and $\bar{A}\times\left(\bar{B}\times\bar{C}\right) = \bar{B}\left(\bar{A}\cdot\bar{C}\right) - \bar{C}\left(\bar{A}\cdot\bar{B}\right)$

> [!aside]
> $h$ is constant

$$
\frac{d}{dt}\left(\dot{\bar{r}}\times\bar{h}\right) = -\frac{\mu}{r^3}\left[\ \underbrace{\left(\bar{r}\cdot\dot{\bar{r}}\right)}_{\textcolor{red}{\downarrow}}\bar{r} \ -\ \underbrace{\left(\bar{r}\cdot\bar{r}\right)}_{\textcolor{red}{r^2}}\dot{\bar{r}}\ \right]
$$

$$
\textcolor{red}{r = \left\|r\right\|}
$$

$$
\textcolor{red}{\dot{r} = \frac{d}{dt}\left\|\bar{r}\right\| = \frac{d}{dt}\left[\bar{r}\cdot\bar{r}\right]^{1/2} = \frac{1}{2}\left(\bar{r}\cdot\bar{r}\right)^{-1/2}\frac{d}{dt}\left(\bar{r}\cdot\bar{r}\right)}
$$

$$
\textcolor{red}{= \frac{1}{2}\left(\bar{r}\cdot\hat{r}\right)^{-1/2}\left(\dot{\bar{r}}\cdot\bar{r} + \bar{r}\cdot\dot{\bar{r}}\right)}
$$

$$
\textcolor{red}{= \frac{1}{2}\left(\frac{1}{r}\right)2\,\bar{r}\cdot\dot{\bar{r}} = \frac{1}{r}\left(\hat{r}\cdot\dot{\bar{r}}\right)}
$$

$$
\textcolor{red}{\dot{r} \neq v}
$$

$$
\textcolor{red}{\dot{r} = \frac{1}{r}\left(\bar{r}\cdot\dot{\bar{r}}\right) \ \Longrightarrow\ \underline{\underline{r\dot{r} = \bar{r}\cdot\dot{\bar{r}}}}}
$$

![[2026-08-31 fig1.svg]]

$$
\dot{r} = \hat{r}\cdot\dot{\bar{r}}
$$

$$
\dot{r} = \frac{\bar{r}\cdot\dot{\bar{r}}}{r}
$$

$$
\frac{d}{dt}\left(\dot{\bar{r}}\times\bar{h}\right) = \frac{-\mu}{r^3}\left(r\dot{r}\,\bar{r} - r^2\dot{\bar{r}}\right) = -\mu\left(\frac{\dot{r}}{r^2}\bar{r} - \frac{1}{r}\dot{\bar{r}}\right)
$$

Let's try to make some geometric sense of this…

$$
\frac{d}{dt}\left(\hat{r}\right) = \frac{d}{dt}\left(\frac{\bar{r}}{r}\right) = \frac{d}{dt}\left(\bar{r}\cdot\bar{r}\right)^{-1/2}\bar{r}
$$

$$
= -\frac{1}{2}\underbrace{\left(\bar{r}\cdot\bar{r}\right)^{-3/2}}_{\textcolor{red}{1/r^{3}}}\underbrace{\underbrace{\left(\dot{\bar{r}}\cdot\bar{r} + \bar{r}\cdot\dot{\bar{r}}\right)}_{\textcolor{red}{\left(2\bar{r}\cdot\dot{\bar{r}}\right)}}}_{\textcolor{red}{r\dot{r}}}\bar{r} \ +\ \underbrace{\left(\bar{r}\cdot\bar{r}\right)^{-1/2}}_{\textcolor{red}{1/r}}\dot{\bar{r}}
$$

$$
= -\frac{\dot{r}}{r^2}\bar{r} + \frac{1}{r}\dot{\bar{r}}
$$

Substituting…

$$
\frac{d}{dt}\left(\dot{\bar{r}}\times\bar{h}\right) = \mu\frac{d}{dt}\left(\frac{\bar{r}}{r}\right)
$$

Integrate both sides…

$$
\dot{\bar{r}}\times\bar{h} = \mu\frac{\bar{r}}{r} + \bar{B}
$$

<span style="color:red">← B̄ is a constant of integration</span>

Take the dot product from the left with $\bar{r}$

$$
\bar{r}\cdot\left(\dot{\bar{r}}\times\bar{h}\right) = \frac{\mu}{r}\underbrace{\bar{r}\cdot\bar{r}}_{\textcolor{red}{r^2}} + \bar{r}\cdot\bar{B}
$$

recall $\bar{A}\cdot\left(\bar{B}\times\bar{C}\right) = \left(\bar{A}\times\bar{B}\right)\cdot\bar{C}$

$$
\underbrace{\underbrace{\left(\bar{r}\times\dot{\bar{r}}\right)}_{\textcolor{red}{\bar{h}}}\cdot\bar{h}}_{\textcolor{red}{h^{2}}} = \frac{\mu}{r}r^{2} + \bar{r}\cdot\bar{B}
$$

$$
\textcolor{red}{\bar{r}\cdot\bar{B}}
$$

![[2026-08-31 fig2.svg]]

$$
\textcolor{red}{rB\cos\theta}
$$

$$
h^{2} = \mu r + rB\cos\theta
$$

$$
h^{2} = r\left(\mu + B\cos\theta\right)
$$

$$
\frac{h^{2}}{\mu} = r\left(1 + \frac{B}{\mu}\cos\theta\right)
$$

$$
r = \frac{\dfrac{h^{2}}{\mu}}{1 + \dfrac{B}{\mu}\cos\theta}
$$

← Two body trajectory equation in polar coordinates.

Recall from geometry that the general equation of a cone section in polar coordinates…

$$
r = \frac{p}{1+e\cos\theta}
$$

where $\theta$ is defined as the angle between $\bar{r}$ and the point on the ellipse closest to the focus at the origin.

$p$ is the semi-latus rectum (semi-parameter)
$e$ is the eccentricity

The trajectory equation from before is clearly the same form…

$$
\boxed{p = \frac{h^{2}}{\mu}} \qquad e = \frac{B}{\mu} \ \Rightarrow\ \text{define a constant vector}
$$

$$
\bar{e} = \frac{1}{\mu}\bar{B} \qquad \left(\text{eccentricity vector}\right)
$$

$$
\bar{e} = \frac{1}{\mu}\left(\dot{\bar{r}}\times\bar{h} - \mu\frac{\bar{r}}{r}\right) \ \to\ \text{constant}
$$

Thus…

$$
r = \frac{p}{1+e\cos\theta}
$$

orbits for two-body problem are conic sections

There are four types of (non-degenerate) conic sections

$$
\begin{array}{ll}
e = 0 & \text{circle}\\
0 < e < 1 & \text{ellipse}\\
e = 1 & \text{parabola}\\
e > 1 & \text{hyperbola}
\end{array}
$$

![[2026-08-31 fig3.svg]]

### Conic Sections

A conic section or conic is the curve formed by the intersection of a plane with a cone. We assume a right-circular cone…

![[2026-08-31 fig4.svg]]

You can also write a conic as the solution to the quadratic equation in two variables…

$$
Ax^{2} + Bxy + Cy^{2} + Dx + Ey + F = 0
$$

$$
\frac{\left(x-x_c\right)^{2}}{a^{2}} + \frac{\left(y-y_c\right)^{2}}{b^{2}} = 0
$$

Note: Planes that pass through the vertex of the cone form the degenerate conics, which do occasionally occur.

In polar coordinates, we have $r = \dfrac{p}{1+e\cos\theta}$

↳ which is related to Cartesian coordinates $\bar{r} = hy$

$$
r^{2} = x^{2}+y^{2} \qquad x = r\cos\theta \qquad y = r\sin\theta \qquad \left(\text{in perifocal form}\right)
$$

There are a few key geometric relations you should know…

#### Circle

$e = 0$

![[2026-08-31 fig5.svg]]

$$
e = 0 \qquad r = a = p
$$

$a$ = semi-major axis
$b$ = semi-minor axis

#### ellipse

$0 < e < 1$

![[2026-08-31 fig6.svg]]

$$
e = \frac{c}{a}
$$

# 2026-09-14

*Source: [[09-14-2026 - om rough notes.pdf]] · Refined: [[2026-09-14 refined notes]]*

### ellipse

$0 < e < 1$

![[2026-09-14 fig1.svg]]

$$
e = \frac{c}{a}
$$

### Parabola

![[2026-09-14 fig2.svg]]

$$
a = \infty
$$

### Hyperbola

![[2026-09-14 fig3.svg]]

Now let's look at the ellipse again

![[2026-09-14 fig4.svg]]

$$
c + r_p = a
$$

$$
ea + r_p = a \ \Rightarrow\ \boxed{\begin{aligned} r_p &= a\left(1-e\right)\\ r_a &= a\left(1+e\right)\end{aligned}}
$$

Also…

$$
r_a + r_p = 2a \qquad r_a - r_p = 2c \qquad e = \frac{c}{a} = \frac{2c}{2a} = \boxed{\frac{r_a - r_p}{r_a + r_p} = e}
$$

and…

$$
r = \frac{p}{1+e\cos\theta} \qquad \begin{array}{l}\text{periapsis } \theta = 0^{\circ}\\ \text{apoapsis } \theta = 180^{\circ}\end{array} \ \Rightarrow\ \boxed{r_p = \frac{p}{1+e}} \qquad \boxed{r_a = \frac{p}{1-e}}
$$

Finally…

$$
r_p = \frac{p}{1+e} = a\left(1-e\right) \ \rightarrow\ p = a\left(1-e\right)\left(1+e\right)
$$

$$
\boxed{p = a\left(1-e^2\right)}
$$

We can also relate specific energy to the semi-major axis:

$$
\textcolor{red}{h = r_p v_p \cos\gamma}
$$

At periapsis…

$$
\varepsilon = \frac{v_p^2}{2} - \frac{\mu}{r_p} = \frac{v_p^2 r_p^2}{2r_p^2} - \frac{2\mu r_p}{2r_p^2} = \frac{v_p^2 r_p^2 - 2\mu r_p}{2r_p^2} = \frac{h^2 - 2\mu r_p}{2r_p^2}
$$

$$
p = \frac{h^2}{\mu} \ \rightarrow\ h^2 = p\mu
$$

$$
\varepsilon = \frac{\mu p - 2\mu r_p}{2r_p^2} = \mu\left(\frac{p - 2r_p}{2r_p^2}\right) \qquad p = r_p + er_p
$$

$$
= \mu\left(\frac{r_p + er_p - 2r_p}{2r_p^2}\right) = \mu\left(\frac{r_p\left(e-1\right)}{2r_p^2}\right)
$$

$$
\varepsilon = \mu\left(\frac{e-1}{2r_p}\right) = -\mu\left(\frac{1-e}{2r_p}\right)
$$

recall that $r_p = a\left(1-e\right)$ → substitute

$$
\varepsilon = -\mu\left(\frac{\textcolor{red}{\cancel{\textcolor{black}{1-e}}}}{2a\left(\textcolor{red}{\cancel{\textcolor{black}{1-e}}}\right)}\right) = \frac{-\mu}{2a} \qquad \text{Thus,} \qquad \boxed{\varepsilon = \frac{-\mu}{2a}}
$$

lets take a look at the specific angular momentum.

$$
h = rv\cos\left(\gamma\right)
$$

Then, $h = r\,r\dot{\theta} = r^2\dfrac{d\theta}{dt}$

![[2026-09-14 fig5.svg]]

$$
v\cos\gamma = r\dot{\theta}
$$

$$
dA = \frac{1}{2}r\,r\,d\theta
$$

$$
2dA = r^2\,d\theta
$$

$$
h = 2\frac{dA}{dt}
$$

$$
dt = \frac{2}{h}dA \quad \longleftarrow \text{Kepler's Second Law}
$$

integrate…

$$
\int dt = \int \frac{2}{h}\,dA
$$

$$
P = \frac{2}{h}A \qquad \text{Area of an ellipse: } A = \pi ab
$$

<span style="color:red">↑ Period</span>

$$
b = \sqrt{a^2 - c^2}
$$

$$
c = ae
$$

$$
b = \sqrt{a^2 - a^2e^2}
$$

$$
b = \sqrt{a^2\left(1-e^2\right)}
$$

$$
b = \sqrt{ap}
$$

Thus…

$$
P = \frac{2\pi a\sqrt{ap}}{h}
$$

$$
P = \frac{2\pi a^{3/2}\sqrt{p}}{h} \qquad h = \sqrt{\mu p} \qquad \frac{\sqrt{p}}{h} = \frac{1}{\sqrt{\mu}}
$$

$$
\boxed{P = 2\pi\sqrt{\frac{a^3}{\mu}}} \qquad \text{Period of orbit — Kepler's third Law}
$$

Note: Proof could show up on a test!

### Velocity for a circular orbit

$$
e = 0 \qquad r = p = a
$$

$$
\varepsilon = \frac{v^2}{2} - \frac{\mu}{r} = -\frac{\mu}{2a} \ \rightarrow\ \frac{v^2}{2} - \frac{\mu}{a} = -\frac{\mu}{2a} \ \rightarrow\ \frac{v^2}{2} = \frac{2\mu}{2a} - \frac{\mu}{2a}
$$

$$
\text{Thus…} \quad \boxed{v_c = \sqrt{\frac{\mu}{a}} = \sqrt{\frac{\mu}{r}}}
$$

**Example:** The ISS is in a ~410 km circular orbit about earth. what is the orbital speed, specific energy, period, and spec. ang. mom.

A circular orbit $\quad e = 0 \quad r_c = a = p = \text{const.}$

$$
r_c = \underbrace{6378\ \text{km}}_{r_{\text{earth}}} + 410\ \text{km} = 6788\ \text{km} \qquad \mu = 3.986\times10^{5}\ \tfrac{\text{km}^3}{\text{s}^2}
$$

Speed: $\quad v_c = \sqrt{\dfrac{\mu}{r}} = 7.663\ \tfrac{\text{km}}{\text{s}}$

Specific energy: $\quad \varepsilon = -\dfrac{\mu}{2r_c} = -29.36\ \tfrac{\text{km}^2}{\text{s}^2}$

Period: $\quad P = 2\pi\sqrt{\dfrac{a^3}{\mu}} = 5{,}566\ \text{sec}$ or $92.76\ \text{min}$

Specific ang. mom. $\quad h = rv\cos\gamma = r_c v_c = 5.2\times10^{4}\ \tfrac{\text{km}^2}{\text{s}}$

---

**Example:** on march 10th, 2006 the mars reconnassance orbiter (MRO) performed a propulsive manuever to insert into a highly ellyptical orbit around mars. This was the beginning of a period of aerobraking. This initial orbit had an appoapsis of 45,000 km and periopsis at 450 km.
what is the orbit semi-major axis, ecc, period, and speed…

![[2026-09-14 fig6.svg]]

Compute radii:

$$
r_a = 3{,}389\ \text{km} + 45{,}000 = 48{,}389\ \text{km}
$$

$$
r_p = 3{,}389\ \text{km} + 450 = 3{,}819\ \text{km}
$$

Semi-major: $\quad a = \dfrac{r_a + r_p}{2} = 26{,}104\ \text{km}$

eccentricity: $\quad e = \dfrac{r_a - r_p}{r_a + r_p} = 0.85$

Period: $\quad P = 2\pi\sqrt{\dfrac{a^3}{\mu}} = 1.277\times10^{5}\ \text{sec} = 35.48\ \text{hr}$

Speed at periapsis: $\quad$ Method #1: $\ \varepsilon = -\dfrac{\mu}{2a} = \dfrac{v_p^2}{2} - \dfrac{\mu}{r_p} \ \rightarrow\ v_p = 4.57\ \tfrac{\text{km}}{\text{s}}$

Method #2:

$$
p = r_p\left(1+e\right) \qquad h = \sqrt{\mu p} = v_p r_p \qquad v_p = \sqrt{\frac{\mu\left(1+e\right)}{r_p}} = 4.57\ \tfrac{\text{km}}{\text{s}}
$$

---

We have just considered examples of circular and elliptical orbits.

- If we imagine an elliptical orbit which apoasis is stretched further until reaching infinity

$$
\varepsilon = -\frac{\mu}{2a} = -\frac{\mu}{2\infty} = 0
$$

more over…

$$
\varepsilon = \frac{v^2}{2} - \frac{\mu}{r} = 0
$$

as $r \rightarrow \infty$ … $\varepsilon = \dfrac{v^2}{2} \rightarrow 0$ thus, $v \rightarrow 0$

$v = 0$ @ $r_\infty$ for a parabolic orbit

$$
\frac{v^2}{2} - \frac{\mu}{r} = 0 \ \rightarrow\ \frac{v^2}{2} = \frac{\mu}{r}
$$

$$
\boxed{v_{esc} = \sqrt{\frac{2\mu}{r}}} \ \rightarrow\ \text{escape velocity}
$$

If $v < v_{esc} \rightarrow \varepsilon < 0 \rightarrow$ closed orbit
$v > v_{esc} \rightarrow \varepsilon > 0 \rightarrow$ open orbit

✱Note… We rarely encounter purely parabolic orbits

If we reach $r_\infty$ with some velocity, then we must be in a hyperbolic orbit…

![[2026-09-14 fig7.svg]]

$$
\sin\left(\frac{\delta}{2}\right) = \frac{a}{c} \qquad e = \sqrt{1 + \frac{b^2}{a^2}}
$$

$$
a^2e^2 = a^2 + b^2 = c^2
$$

Thus, $c = ae$

and $\ \sin\left(\dfrac{\delta}{2}\right) = \dfrac{a}{ae} = \dfrac{1}{e}$

Consider the speed for away from the central body

$$
\varepsilon = \frac{v^2}{2} - \frac{\mu}{r} = \frac{v_\infty^2}{2} - \overset{\textcolor{red}{0}}{\textcolor{red}{\cancel{\textcolor{black}{\frac{\mu}{\infty}}}}} = \frac{v_\infty^2}{2} \ \Rightarrow\ \varepsilon = \frac{v_\infty^2}{2} > 0
$$

![[2026-09-14 fig8.svg]]

$$
\Delta = \text{miss distance}
$$

$$
\bar{h} = \bar{r}\times\bar{v} = v_\infty \Delta\,\hat{h}
$$

$$
h = v_\infty \Delta
$$

**Example:** Consider a spacecraft performing a flyby of venus, on approach it has a hyperbolic excess speed of $v_\infty = 3.5\ \tfrac{\text{km}}{\text{s}}$ and a miss distance of $\Delta = 30{,}000$ km.

Find specific energy, specific angular momentum, periopsis radius, and turn angle.

![[2026-09-14 fig9.svg]]

$\varepsilon = \dfrac{v_\infty^2}{2} =$ <mark style="background:#ffec99">6.125 km²/s²</mark>

$h = v_\infty\Delta =$ <mark style="background:#ffec99">105,000 km²/s</mark>

$\mu = 3.257\times10^{5}\ \tfrac{\text{km}^3}{\text{s}^2}$

$\varepsilon = -\dfrac{\mu}{2a} \ \rightarrow\ a = -\dfrac{\mu}{2\varepsilon} = -2.66\times10^{4}\ \text{km}$

$$
p = \frac{h^2}{\mu} = a\left(1-e^2\right) = 3.385\times10^{4}\ \text{km}
$$

$$
\downarrow
$$

$$
e = \sqrt{1 - \frac{p}{a}} \ \rightarrow\ e = 1.508
$$

$r_p = a\left(1-e\right) =$ <mark style="background:#ffec99">13,500 km</mark>

$\sin\left(\dfrac{\delta}{2}\right) = \dfrac{1}{e} \ \rightarrow\ \delta = 2\sin^{-1}\left(\dfrac{1}{e}\right) =$ <mark style="background:#ffec99">83 deg</mark>

### Orbital elements…

Two body orbits follow the path of a conic section.
This is a planar trajectory through space

We can define the shape and orientation of a two-body conic using the orbital elements

6 classical orbital elements that describe the shape and orientation of an orbit relative to a convenient refrence frame

- Let $\langle \hat{\imath}, \hat{\jmath}, \hat{k} \rangle$ be the basis for this inertial frame.

$a$: semi-major axis (size of orbit)

$e$: eccentricity (shape)

$i$: inclination — angle between $\hat{k}$ and the orbit's $\bar{h}$.

$\Omega$: right ascention of the ascending Node (RAAN) — angle î–ĵ plane between $\hat{\imath}$ and where the orbit passes from negative to positive z-values.

$\omega$: argument of periopsis — angle in the plane of the orbit between the ascending node and the periopsis (Measured in the direction of orbit)

$T$: time of periopsis passage (Also called true anomoly at epoch)

### Reference Frames

The most important inertial frame for astrodynamics is:

ICRF (Inertial Celestial Refrence Frame)

The international celestial refrence system is ICRS

✱ we define ICRF from ICRS

The origin is at the Solar system's barycenter (SSB) and its axes are fixed relative to distant objects (quasars)

↳ refrence sources are the objects in space

ICRF (Realization) of ICRS (specification)

The alignment of ICRS axes was chosen to be such that:

"The principle plane should be as near as possible to the mean equator at J200.0 and the origin in this principle plane be as near to dynamical equinox at J200"

↓
z-axis (defines the principle plane): perpendicular to Earth's equatorial plane

x-axis: ascending node of the eclyptic plane at equatorial plane

y-axis: Complete R.H.S

While the axis are tied to distant sources, the initial alignment was selected based on the following dynamical frame at J2000 (No longer perfectly aligned)

Important: Since both planes (equatorial and ellyptical) are moving, you must specify an epoch at which the frame was generated

---

ICRF specifies the "usual" direction of the coordinate axes for inertial frames used in spacecraft and astronomy

we say things like Earth-Centered Inertial (ECI) … etc

↳ We usually mean that the ICRF axes are moved of the specified central body.

The other common frame is Earth-Centered-Earth-Fixed (ECEF), with origin at center of earth and coordinate axis rigidly Fixed.

![[2026-09-14 fig10.svg]]

$$
\text{ERA} = \text{GMST} + \varepsilon_{\text{prec}} \quad \longleftarrow \text{precession of equinoxes}
$$

↑ Greenwich mean Sideral time (Angle) <span style="color:red">(15 degrees per hour)</span>

### Solar and Sideral time

Solar time: based on the time for the sun to return to a refrence meridian

↓ in mean solar time: 1 day = 24 hrs = <u>86,400 s</u>

length of an SI second is 9,192,631,700 periods of radiation of Cesium-133.

↓ Selected for 86,400 sec day in the year 1900.

### Sideral time:

based on time to return equinox to refrence meridian

### Atomic time and civil time

int. Atomic time (TAI): Continuous time scale based on the SI Second

Civil time (UTC): Adjustment of TAI by an integer number of leap seconds to keep UTC with 0.9 sec of UT1 (based on ERA)

### Canonical units

Canonical units normalize "regular units" (eg. km, km/s) to quantities that are of a similar magnitude and sometimes lead to better numerical performance when working in limited precision.

### Procedure:

1. Pick a refrence distance: distance unit (DU)
   a. earth orbit $\ 1\text{DU} = R_e = 6378$ km
   b. Sun orbit $\ 1\text{DU} = 1\text{AU} = 1.496\times10^{8}$ km
2. Define $\mu = \dfrac{\text{DU}^3}{\text{TU}^2}$ ← This sets TU
3. Compute TU → $1\text{TU} = \sqrt{\dfrac{1\text{DU}^3}{\mu}}$ $\quad$ eg. earth: TU = 807 sec

### The Perifocal Frame

The perifocal frame is one of the most common frames we will use this semester.

↳ Origin is at the focus (location of central body), with x-axis pointing towards the periopsis.

Recall from before:

![[2026-09-14 fig11.svg]]

$$
\bar{r}\cdot\bar{B} = rB\cos\theta \qquad \bar{B} = \dot{\bar{r}}\times\bar{h} - \mu\frac{\bar{r}}{r}
$$

then we said $e = \dfrac{B}{\mu}$ →

$$
\bar{e} = \frac{1}{\mu}\bar{B} = \frac{1}{\mu}\left(\dot{\bar{r}}\times\bar{h} - \mu\frac{\bar{r}}{r}\right)
$$

![[2026-09-14 fig12.svg]]

$$
\bar{r}\cdot\bar{e} = re\cos\theta
$$

and we observed that periopsis occurs at $\theta = 0^{\circ}$

<span style="color:red">✱IMPORTANT: STUDY THIS</span>

therefore, $\bar{e}$ points from the focus towards periopsis and is the x-axis.

Define $\hat{p}$ as the unit vector in the perifocal frame in the x-direction

$$
\hat{p} = \frac{\bar{e}}{\left\|\bar{e}\right\|} = \frac{\bar{e}}{e}
$$

Define $\hat{w}$ as normal to the orbit plane, positive in the direction of the specific angular momentum.

$$
\hat{w} = \frac{\bar{h}}{\left\|\bar{h}\right\|} = \frac{\bar{h}}{h}
$$

let $\hat{q}$ complete the right hand system (RHS)

$$
\hat{q} = \hat{w}\times\hat{p}
$$

![[2026-09-14 fig13.svg]]

$$
\bar{r} = x\hat{p} + y\hat{q} \qquad x = r\cos\theta\ ,\ y = r\sin\theta\ ,\ z = 0
$$

$$
R_I^P = \left[\hat{p}, \hat{q}, \hat{w}\right] \ \rightarrow\ \text{from } P \text{ to } I
$$

$$
R_P^I = \begin{bmatrix}\hat{p}^T\\ \hat{q}^T\\ \hat{w}^T\end{bmatrix} \ \rightarrow\ \text{from } I \text{ to } P
$$
