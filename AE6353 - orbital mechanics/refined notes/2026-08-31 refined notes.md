---
note_type: refined-lecture
course: AE6353
lecture_date: 2026-08-31
source_pdf: '[[08-31-2026 - om rough notes.pdf]]'
tags:
- gt
- notes/refined
permalink: brain/ae6353-orbital-mechanics/refined-notes/2026-08-31-refined-notes
---

# AE6353 — Lecture 2026-08-31

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
