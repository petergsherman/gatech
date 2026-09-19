---
note_type: refined-lecture
course: AE6353
lecture_date: 2026-08-26
source_pdf: '[[08-26-2026 - OM rough notes.pdf]]'
tags:
- gt
- notes/refined
permalink: brain/ae6353-orbital-mechanics/refined-notes/2026-08-26-refined-notes
---

# AE6353 — Lecture 2026-08-26

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
