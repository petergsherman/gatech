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

## Cross-check findings

An independent verification pass compared this transcription line-by-line against the PDF at high zoom.

1. **Prose vs. equation mismatch (source, flagged):** the written law of gravitation says "inversly to the distance"; the equation correctly uses $r^2$ (inverse *square*).
2. **Summation index (source, flagged):** the N-body force sum's lower limit is written $i=1,\ j\neq i$; the running index should be $j$. The upper limit is a small letter most resembling a lowercase $r$; $N$ is the sensible reading.
3. **Subscript pen slip (source, flagged):** the combined torque fraction's denominator reads $r_{13}^{\,3}$; with only two bodies it should be $r_{12}^{\,3}$.
4. **Grammar slip (source, flagged):** "conservation to the system's linear momentum" — likely "conservation of."
5. **Transcription fixes applied after cross-check:** restored the blue underline on "Newton's Second Law"; restored the red $0$ on the canceled $\dot{m}\bar{v}$ term; narrowed the green ink annotation to just $(-)$, moving its explanation to purple.
6. **Normalization note:** vector overbars are written inconsistently in the handwriting (e.g. $F_i$ on the left side of the N-body sum has no bar); bars were normalized throughout since the meaning is unambiguous.
7. Everything else — every equation, colored annotation, highlight, strike-out, aside, and page-continuation merge — verified as matching the handwriting.

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

## Cross-check findings

An independent verification pass compared this transcription line-by-line against the PDF at high zoom.

1. **Missing overdot (source, flagged):** the first equation's added term is inked $\sum m_i(\bar{v}_i\times\bar{r}_i)$ with no overdot on $\bar{r}_i$; for the product-rule identity to close (and for the term to vanish, $\bar{v}\times\bar{v}=0$) it should be $\bar{v}_i\times\dot{\bar{r}}_i$. Transcribed as written.
2. **Bars dropped in work integral (source, flagged):** the $\Delta PE$ line is inked $\int F\,dr$ — no vector bars, no dot product; the line integral $\int\bar{F}\cdot d\bar{r}$ is meant. Transcribed as written.
3. **Missing double dot (source, flagged):** on the "Typically $m_1\gg m_2$" line the left side is inked $\bar{r}_{12}$ with no dots; the acceleration $\ddot{\bar{r}}_{12}$ is meant (compare the boxed equation of motion that follows). Transcribed as written.
4. **Symbol habit-slip in polar kinematics (source, flagged):** the polar column is inked $\bar{\omega}=\dot{\bar{r}}=\dot{r}\hat{e}_r+r\dot{\theta}\hat{e}_\theta$ and $\bar{\alpha}=\dot{\bar{\omega}}=\ddot{\bar{r}}=\ldots$, using the rotational symbols $\bar{\omega},\bar{\alpha}$ where the translational $\bar{v},\bar{a}$ are meant (carried over from the rotational column above). Transcribed as written.
5. **Sign error in polar acceleration (source, flagged):** the $\hat{e}_\theta$ component is inked $\left[2\dot{r}\dot{\theta}-r\ddot{\theta}\right]$; correct polar kinematics gives $+r\ddot{\theta}$. Transcribed with the minus as written.
6. **Missing overdot (source, flagged):** the Cartesian column's second line is inked $\bar{v}=\bar{r}=\dot{x}\hat{\imath}+\ldots$ — the middle $\bar{r}$ lacks its overdot. Transcribed as written.
7. **Label slip (source, flagged):** the 10-constants summary labels the $\bar{C}_3$ line "Total momentum," though it is the *angular*-momentum constant (the same result is correctly called "Total angular momentum is conserved" earlier). Transcribed as written.
8. **Ambiguity note:** in the N-body potential aside, a faint stroke above the denominator's $r_{ij}$ may be a bar; the scalar separation $r_{ij}$ is the only sensible reading and was used (~70% the stroke is a stray bar).
9. **Preserved as written:** "$W$ is independent on the path taken" (grammar); $x=x_0+vt+\tfrac12 at^2$ and $\theta=\theta_0+\omega t+\tfrac12\alpha t^2$ use $v,\omega$ where $v_0,\omega_0$ is standard; lowercase $6n$ in "For $N=2$: $6n=12>10$."
10. **Transcription fixes applied after cross-check:** removed AI-added bars/dot from the work integral; restored the subscript on the final $\ddot{\bar{r}}_i$ of the product-rule expansion; removed an added dot between $\frac{d\bar{r}_i}{dt}$ and $\frac{\partial V}{\partial\bar{r}_i}$ and restored the black $\uparrow$ under the braced sum; restored $\bar{\omega},\bar{\alpha}$, the minus in $\left[2\dot{r}\dot{\theta}-r\ddot{\theta}\right]$, and the undotted $\bar{r}$'s exactly as inked; lowercased the red "potential" label; in fig2 recolored the angle arcs blue, made both reference lines dotted, and capitalized "Zenith" to match the blue ink.
11. Diagrams otherwise verified against the sketches — fig1 (two-body vector triangle) matches throughout; fig2's labels, colors, arrow directions, and the $\gamma$/$\phi$ placement (flight path angle off the local horizontal, zenith angle off the local vertical) are confirmed.
12. Everything else — every equation, red cancellation, boxed result, colored annotation, aside, and page-continuation merge — verified as matching the handwriting.

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

## Cross-check findings

An independent verification pass re-rendered the PDF at high zoom and compared the transcription equation-by-equation, including a per-page colour census of the ink.

1. **Hat where a bar is meant (source, flagged):** the third red line of the $\dot{r}$ derivation is inked $\tfrac{1}{2}\left(\bar{r}\cdot\hat{r}\right)^{-1/2}\left(\dot{\bar{r}}\cdot\bar{r}+\bar{r}\cdot\dot{\bar{r}}\right)$ — the second $r$ carries an unmistakable peaked caret while the first carries a flat bar. As written $\left(\bar{r}\cdot\hat{r}\right)^{-1/2}=r^{-1/2}$, not $1/r$, so the step does not close. Transcribed as inked.
2. **Hat where a bar is meant (source, flagged):** the fourth red line ends $=\tfrac{1}{r}\left(\hat{r}\cdot\dot{\bar{r}}\right)$, again a caret set against the flat bar on the $\bar{r}$ earlier in the same line. Since $\hat{r}\cdot\dot{\bar{r}}=\dot{r}$, the line as written asserts $\dot{r}=\dot{r}/r$. The very next red line and the black $\dot{r}=\left(\bar{r}\cdot\dot{\bar{r}}\right)/r$ both use genuine bars, so these two are pen slips. Transcribed as inked.
3. **Missing bar in a norm (source, flagged):** the red block opens $r=\left\|r\right\|$ with no accent inside the norm; $r=\left\|\bar{r}\right\|$ is meant, and the same statement at the end of the EOM line on the first page does carry the bar. Transcribed as inked.
4. **Conic in Cartesian form set to zero (source, flagged):** $\dfrac{\left(x-x_c\right)^2}{a^2}+\dfrac{\left(y-y_c\right)^2}{b^2}=0$ — the glyph is a closed oval identical to the $0$ in $\ldots+F=0$ on the line above, whereas the writer's $1$ is a bare slash. It should be $=1$; as written it admits only the degenerate point. Transcribed as inked.
5. **Cartesian relation reads "hy" (source, flagged):** "which is related to Cartesian coordinates $\bar{r} = hy$" is inked with a tall open-shouldered $h$ followed by a descending $y$. It is meaningless as written; $\bar{r}=\langle x,y\rangle$ is presumably intended. The only competing reading is that "$\bar{r}=$" is a false start and the sentence continued "…related to Cartesian coordinates **by**", but the shoulder never closes onto the stem the way the writer's $b$ does. Transcribed as inked, ~75% confidence in "hy".
6. **"cone section" (source, flagged):** the wrapped line on the fourth page plainly reads "the general equation of a **cone** section in polar coordinates"; the standard term is "conic section", which the writer uses correctly one page later. Transcribed as inked. In that same line the preposition reads about equally as "in" or "on"; "in" was used.
7. **Definition of $\theta$ (source, flagged):** "$\theta$ is defined as the angle between $\bar{r}$ and the point on the ellipse closest to the focus at the origin" — an angle is formed with the *direction* to that point, not with the point. Transcribed as inked.
8. **Ambiguity, resolved:** the exponent in the struck-through $\bar{r}\times\left(-\mu/r^{3}\right)\bar{r}$ was read against the writer's own $2$ (a flat-based z-form) and $3$ (a round-bowled form) elsewhere on the same page — it is a $3$, ~90%, consistent with the term multiplying $\bar{r}$ rather than $\hat{r}$.
9. **Ambiguity, resolved:** the first row of the four-way conic list is $e=0$, not $c=0$; the glyph carries the writer's characteristic mid-height entry tick, which his $c$ lacks (~85%).
10. **Ambiguity, flagged:** in the orbit sketch the blue label on the periapsis-pointing vector is inked with a rounded arch rather than the writer's usual straight bar, so it is drawn as $\hat{e}$ even though the surrounding text defines $\bar{e}=\tfrac{1}{\mu}\bar{B}$ as the eccentricity vector. Roughly 65% confidence in the hat.
11. **Transcription fixes applied after cross-check:** restored the two carets of findings 1 and 2, which the first draft had smoothed into bars; removed a purple gloss on the "$h$ is constant" margin note and a purple mark on the $r^{3}$ exponent — the PDF contains no purple ink anywhere, and both items are plain black. In the orbit sketch, deleted a spurious ring drawn around the green $\theta$ (the ink is a single barred-oval glyph) and relabelled the blue vector $\hat{e}$; in the ellipse sketch, recoloured $\theta$ black (it is black ink, not red), removed an added red angle arc that is not in the source, and lowercased the periapsis label to $p$; in the $\bar{r}$–$\bar{B}$ sketch, seated the angle arc on both shafts and moved the $\bar{r}$ label to mid-shaft.
12. **Diagrams verified:** the $\bar{r}$ / $\dot{\bar{r}}$ increment sketch, the double cone with its red circle-plane and blue ellipse-plane, and the circle with its brace and $d=2r=2a=2p$ all match the sketches in labels, colours, arrow directions and geometry. In the orbit sketch the true-anomaly arc runs from the $\hat{e}$ direction counter-clockwise to the radius vector, and the semi-latus-rectum vertical lands on the ellipse, as inked.
13. **Colour audit:** every red, blue and green item in this transcription corresponds to real coloured ink, and no coloured annotation in the PDF is missing from it.
14. Everything else — the cross-product magnitude identity, the whole $d\bar{h}/dt$ chain with its red cancellations, both EOM forms, the $\bar{A}\times\left(\bar{B}\times\bar{C}\right)$ expansion and its red underbraces, the full $d\hat{r}/dt$ derivation with its nested braces, the integration and dot-product steps, all four $h^2$ algebra lines, the eccentricity-vector definitions, and the conic-section text — verified as matching the handwriting.
