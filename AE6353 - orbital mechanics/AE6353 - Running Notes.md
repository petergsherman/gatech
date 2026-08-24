---
note_type: running-notes
course: AE6353
tags:
- gt
- notes/running
permalink: brain/ae6353-orbital-mechanics/ae6353-running-notes
---

# 2026-08-24

*Source: [[8-24-2026 rough.pdf]] · Refined: [[2026-08-24 refined]]*

## Page 1

order *Fundamentals of Astrodynamics* 2nd ed.

> [!note] AI
> "order" appears to be a to-do reminder to order the textbook (Bate, Mueller & White is the common "Fundamentals of Astrodynamics" 2nd ed.).

Comments: We look at the motion of bodies in space
→ Focus on translational motion (particles)
→ attitude dynamics is AE 6356

Almost everything we do has roots in the ==n-body problem==

### N-Body problem

- described by Newton in 1687
- much of what we need centers around a few key results:

1. **Newton's Second Law**: Time rate of change of linear momentum is proportional to the force applied

$$
\dot{\bar{p}} = \frac{d}{dt}(m\bar{v}) = \cancel{\dot{m}\bar{v}} + \underbrace{m\dot{\bar{v}}}_{m\bar{a}} \quad\Rightarrow\quad \dot{\bar{p}} = m\bar{a}
$$

[red annotation: the $\dot{m}\bar{v}$ term is struck out to $0$, "when $\dot{m}=0$"]

$$
\bar{F} = \dot{\bar{p}} = m\bar{a}
$$

★ ==Note: This law is only valid in an inertial frame==
→ ==Frame that is not rotating or accel[erat]ing== → (arrow continues to Page 2)

## Page 2

[margin note, left] Brush up on Kinematics and Reynolds transport

(continuation of inertial-frame arrow) A frame in which forces on particles cause no acceleration

2. **Newton's Law of Universal Gravitation**: The gravitational attraction force between two objects is proportional to their masses and inversely to the distance between them. **[possible source error]** — prose says "distance," while the equation below uses $r^2$ (inverse *square* of the distance)

$$
F = G\,\frac{m_1 m_2}{r^2} \qquad G = 6.674\times 10^{-11}\ \frac{\mathrm{N\,m^2}}{\mathrm{kg^2}}
$$

[Diagram: origin with position vectors $\bar{r}_1$ to mass $m_1$ and $\bar{r}_2$ to mass $m_2$; relative vector $\bar{r}_{12}$ drawn from $m_1$ to $m_2$]

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

[margin, blue] 6 second-order differential equations

[margin, red/green side example]
$\ddot{x} + x - 3 = 0$ — second order
$\dot{v} + x - 3 = 0$ — first order

12 degrees of freedom, so we need 12 constants of integration ↓

## Page 3

Generally: $6N$ DOFs for $N$-bodies

Let's generalize these laws for the N-body problem:

[Diagram: origin with position vectors $\bar{r}_1$, $\bar{r}_2$, $\bar{r}_k$ to masses $m_1$, $m_2$ (interior body), $m_k$; arrows between the bodies labeled $\bar{r}_{12}$, $\bar{F}_{1k}$, $\bar{F}_{2k}$]

[red] $\bar{r}_{12} = \bar{r}_2 - \bar{r}_1$, $\quad \bar{r}_{1k} = \bar{r}_k - \bar{r}_1$, $\quad \vdots$

For the $i^{\text{th}}$ body of the system:

$$
\bar{F}_i = G \sum_{\substack{i=1 \\ j \neq i}}^{N} \frac{m_i m_j}{r_{ij}^{\,3}}\,\bar{r}_{ij}, \quad \text{where} \quad \sum_{i=1}^{N} \bar{F}_i = 0
$$

**[possible source error]** — the summation's lower limit is written $i=1$; the running index of the sum should be $j$ (i.e. $\sum_{j=1,\, j\neq i}^{N}$), since $i$ is the fixed body. [unclear: upper limit written as a small letter, best interpretation $N$]

Is there enough info for a closed-form solution for $n \ge 2$?

Let's assume all particles have a constant mass, $\dot{m}_i = 0$.

We can apply Newton's second law:

$$
\sum \bar{F}_i = \sum m_i \ddot{\bar{r}}_i = 0
$$

↓ since $\frac{d}{dt} m = 0$

$$
\frac{d^2}{dt^2}\left(\sum m_i \bar{r}_i\right) = 0
$$

Let's define the center of mass as $\bar{r}_{cm} = \dfrac{\sum m_i \bar{r}_i}{\sum m_i}$ and $\sum m_i \neq 0$

## Page 4

$$
\frac{d^2}{dt^2}\left(\left(\sum m_i\right)\bar{r}_{cm}\right) = \sum m_i\,\frac{d^2}{dt^2}\,\bar{r}_{cm} = 0
$$

[red annotations: $\sum m_i$ → "not 0"; $\frac{d^2}{dt^2}\bar{r}_{cm}$ → "must be zero"]

$\ddot{\bar{r}} = 0$ → system COM cannot accelerate

$\dot{\bar{r}}_{cm} = \bar{c}_1$ → linear momentum of the system is conserved

$\bar{r}_{cm} = \bar{c}_1 t + \bar{c}_2$ → system COM can move with constant velocity

↓ Knowing $\bar{r}_{cm}(t_0)$ and $\dot{\bar{r}}_{cm}(t_0)$: you know 6 constants of integration ($\bar{c}_1$ and $\bar{c}_2$) associated with conservation to the system's linear momentum.

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
= \frac{G m_1 m_2}{r_{12}^{\,3}}\left(\bar{r}_1 \times \bar{r}_2 - \cancel{\bar{r}_1 \times \bar{r}_1}^{\,0} + \bar{r}_2 \times \bar{r}_1 - \cancel{\bar{r}_2 \times \bar{r}_2}^{\,0}\right)
$$

**[possible source error]** — the combined fraction's denominator subscript reads $r_{13}^{\,3}$ in the handwriting; with only two bodies ($n=2$) it should be $r_{12}^{\,3}$, likely a pen slip. (Combining the two fractions is valid since $r_{12} = r_{21}$.)

[green annotation: "$(-)$" linking $\bar{r}_1 \times \bar{r}_2$ and $\bar{r}_2 \times \bar{r}_1$ — they are negatives of each other]

$$
= \bar{0} \qquad \text{In general…} \quad \sum \bar{r}_i \times \bar{F}_i = \bar{0}
$$

## Cross-check findings

An independent verification pass compared this transcription equation-by-equation against the PDF.

1. **Page 2 — prose vs. equation mismatch (source, flagged):** the written statement of the law of gravitation says "inversely to the distance," but the equation correctly uses $r^2$. Should read "inversely to the *square* of the distance."
2. **Page 3 — summation index (source, flagged):** the N-body force sum is written with lower limit $i=1,\ j\neq i$; the running index should be $j$ (i.e. $\sum_{j=1,\,j\neq i}^{N}$), since $i$ is the fixed body. The upper limit is written ambiguously (small letter); $N$ is the sensible reading given the companion sum $\sum_{i=1}^{N}\bar{F}_i = 0$.
3. **Page 4 — subscript pen slip (source, flagged):** the combined-fraction denominator reads $r_{13}^{\,3}$; with only two bodies it should be $r_{12}^{\,3}$.
4. **Page 3 — diagram description (transcription, fixed):** an earlier draft implied an $\bar{F}_{12}$ label on the $m_1\!\to\!m_2$ arrow; the handwritten diagram labels that arrow only $\bar{r}_{12}$. Corrected.
5. All other equations, margin notes, colored annotations, strike-outs, and diagram labels on all four pages were verified as matching the handwriting.