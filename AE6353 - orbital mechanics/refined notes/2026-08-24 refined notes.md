---
note_type: refined-lecture
course: AE6353
lecture_date: 2026-08-24
source_pdf: '[[8-24-2026 rough notes.pdf]]'
tags:
- gt
- notes/refined
permalink: brain/ae6353-orbital-mechanics/refined-notes/2026-08-24-refined
---

# AE6353 — Lecture 2026-08-24

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