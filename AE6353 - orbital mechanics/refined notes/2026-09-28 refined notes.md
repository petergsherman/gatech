---
note_type: refined-lecture
course: AE6353
lecture_date: 2026-09-28
source_pdf: '[[9-28-2026 - om rough notes.pdf]]'
tags:
- gt
- notes/refined
permalink: brain/ae6353-orbital-mechanics/refined-notes/2026-09-28-refined-notes
---

# AE6353 — Lecture 2026-09-28

Recall from before:

$$
R_I^P = \left[\hat{p}, \hat{q}, \hat{w}\right] \ \rightarrow\ \text{from } P \text{ to } I
$$

$$
R_P^I = \begin{bmatrix}\hat{p}^T\\ \hat{q}^T\\ \hat{w}^T\end{bmatrix} \ \rightarrow\ \text{from } I \text{ to } P
$$

We can also build perifocal frame from three of the classical orbital elements: $i,\ \Omega,\ \omega$

This involves a 3-1-3 Euler angle sequence

$$
R_P^I = R_3(\omega)\,R_1(i)\,R_3(\Omega)
$$

or

$$
R_I^P = \left(R_P^I\right)^T = R_3^T(\Omega)\,R_1^T(i)\,R_3^T(\omega) = R_3(-\Omega)\,R_1(-i)\,R_3(-\omega)
$$

In the perifocal frame, the position is:

$$
\bar{r} = r\cos\theta\,\hat{p} + r\sin\theta\,\hat{q}
$$

such that the velocity is

$$
\bar{v} = \left[\dot{r}\cos\theta - r\dot\theta\sin\theta\right]\hat{p} + \left[\dot{r}\sin\theta + r\dot\theta\cos\theta\right]\hat{q}
$$

Look at $\dot r$

$$
r = \frac{p}{1+e\cos\theta} = p\left(1+e\cos\theta\right)^{-1}
$$

$$
\dot r = -p\left(1+e\cos\theta\right)^{-2}\left(-e\sin\theta\right)\left(\dot\theta\right)
$$

$$
\dot r = \frac{p}{\left(1+e\cos\theta\right)\left(1+e\cos\theta\right)}\cdot e\sin\theta\left(\frac{h}{r^2}\right)
$$

> [!aside]
> Aside to get $\dot\theta$
>
> $$h = rv\cos\gamma$$
>
> $$h = rv_\perp = r\left(r\dot\theta\right)$$
>
> $$\dot\theta = \frac{h}{r^2}$$

$$
\dot r = r\left(\frac{r}{p}\right)e\sin\theta\left(\frac{h}{r^2}\right)
$$

$$
\dot r = \frac{eh}{p}\sin\theta \qquad \text{recall, } p = \frac{h^2}{\mu}
$$

$$
\boxed{\dot r = \frac{e\mu}{h}\sin\theta}
$$

look at $r\dot\theta$ $\rightarrow$ $r\dot\theta = \dfrac{h}{r}$ and $r = \dfrac{h^2/\mu}{1+e\cos\theta}$ $\rightarrow$ $\dfrac{1}{r} = \dfrac{\mu}{h^2}\left(1+e\cos\theta\right)$

Thus $\quad r\dot\theta = \dfrac{\mu}{h}\left(1+e\cos\theta\right)$

Substitute back in...

$$
\hat p:\quad \dot r\cos\theta - r\dot\theta\sin\theta = \left(\frac{e\mu}{h}\sin\theta\right)\left(\cos\theta\right) - \left(\frac{\mu}{h}\right)\left(1+e\cos\theta\right)\left(\sin\theta\right) = -\frac{\mu}{h}\sin\theta\ \hat p
$$

$$
\hat q:\quad \dot r\sin\theta + r\dot\theta\cos\theta = \frac{e\mu}{h}\sin^2\theta + \left(\frac{\mu}{h}\right)\left(1+e\cos\theta\right)\cos\theta = \frac{\mu}{h}\left(e+\cos\theta\right)\ \hat q
$$

Thus,

$$
\boxed{\bar v = \dot{\bar r} = \left(-\frac{\mu}{h}\sin\theta\right)\hat p + \left(\frac{\mu}{h}\left(e+\cos\theta\right)\right)\hat q} \qquad \text{equation of a circle}
$$

### The Orbital Hodograph

The hodograph is the locus of points (the curve) traced out by the tip of the vector while keeping the tail fixed at the origin.

The orbital Hodograph is always a perfect circle for all types of two-body orbits: Circular, elliptical, hyperbolic, etc.

To see this more clearly

$$
\bar v = \left(-\frac{\mu}{h}\sin\theta\right)\hat p + \left[\frac{\mu}{h}\left(e+\cos\theta\right)\right]\hat q
$$

$$
\bar v_p = \begin{bmatrix}0\\ \dfrac{\mu}{h}e\\ 0\end{bmatrix} + \frac{\mu}{h}\begin{bmatrix}-\sin\theta\\ \cos\theta\\ 0\end{bmatrix}
$$

$\underset{\textcolor{purple}{\uparrow}}{\text{Constant offset}}\qquad \underset{\textcolor{purple}{\uparrow}}{\text{circle of radius }\mu/h}$

![[2026-09-28 fig1.svg]]

$$
R = \frac{\mu}{h}\ ,\qquad \bar c_h = \frac{\mu}{h}e\,\hat q
$$

$$
\tan\left(\beta\right) = \frac{\dfrac{\mu}{h}\sin\theta}{\dfrac{\mu}{h}\left(e+\cos\theta\right)}
$$

$$
\boxed{\beta = \frac{\sin\theta}{e+\cos\theta}}
$$

<span style="color:#1a73e8">$\theta$: true anomaly</span> $\qquad$ <span style="color:red">$\beta$: heading angle</span>

### From the Hodograph back to the orbit

We can always go from the orbital Hodograph to the orbit

$$
R\ \text{and}\ \bar c_h \ \longrightarrow\ \theta,\ \gamma,\ \dots\ \text{etc}
$$

Recall $\bar e = e\hat p$ and $\hat q\times\hat w = \hat p$

$$
\frac{\bar c_h}{R} = \frac{\dfrac{\mu}{h}e\hat q}{\dfrac{\mu}{h}} = e\hat q \qquad \bar e = e\hat p = e\hat q\times\hat w
$$

$$
\boxed{\bar e = \frac{1}{R}\bar c_h\times\hat w}
$$

Now, consider the geometry of the hodograph

![[2026-09-28 fig2.svg]]

Defining $\bar s$ to be the vector from the hodograph center to the tip of the velocity vector

$$
\bar v = \bar c_h + \bar s \qquad \bar s = \bar v - \bar c_h
$$

What is the projection of $\bar s$ onto $\hat r$?

$$
\bar r\cdot\bar s = \bar r\cdot\left(\bar v-\bar c_h\right) = \underbrace{\bar r\cdot\bar v}_{\textcolor{red}{r\dot r}} - \bar r\cdot\bar c_h
$$

$$
\bar r\cdot\bar s = r\dot r - \bar r\cdot\left(\frac{\mu}{h}e\hat q\right) = r\dot r - \frac{\mu}{h}e\left(\bar r\cdot\hat q\right) \qquad \textcolor{red}{\bar r\cdot\hat q = r\sin\theta}
$$

$$
\bar r\cdot\bar s = r\dot r - \frac{\mu}{h}e\left(r\sin\theta\right)
$$

$$
= r\left(\underbrace{\dot r - \frac{\mu}{h}e\sin\theta}_{\textcolor{purple}{=\ 0,\ \text{since }\dot r=\frac{e\mu}{h}\sin\theta}}\right)
$$

Thus, $\bar r\cdot\bar s = 0$ (orthogonal)

So, $\bar s$ is the local horizontal

So, the angle between $\bar v$ and $\bar s$ is $\gamma$ (flight path angle)

Recall again

$$
R = \frac{\mu}{h}\ ,\qquad \bar c_h = \frac{\mu}{h}e\hat q = Re\hat q
$$

We can tell the type of orbit by looking at the hodograph.

### Spacecraft Position as a function of time

Kepler's eq: Relates time and angular displacement around an orbit.

Kepler's problem: Task of finding the location of a body in orbit after a certain amount of time

We can develop these ideas geometrically: Begin with Kepler's $2^{\text{nd}}$ Law.

![[2026-09-28 fig3.svg]]

$$
\frac{t_0-t}{P} = \frac{A}{\pi a b} \qquad\qquad \frac{t_0-t}{A} = \frac{P}{\pi a b}
$$

![[2026-09-28 fig4.svg]]

$E$: eccentric anomaly

$$
A_2 = \frac{ab}{2}\left(e-\cos\left(\varepsilon\right)\right)\sin\left(\varepsilon\right) \qquad\qquad A_{PCB} = \frac{ab}{2}\left(\varepsilon-\cos\left(\varepsilon\right)\sin\left(\varepsilon\right)\right)
$$

$$
A_1 = A_{PCB}-A_2 = \frac{ab}{2}\left(\varepsilon-e\sin\varepsilon\right)
$$

Plug back in $\quad \dfrac{t_0-t}{A} = \dfrac{P}{\pi ab}$

$$
\frac{2\left(t-t_0\right)}{ab\left(\varepsilon-e\sin\varepsilon\right)} = \frac{P}{\pi ab}
$$

$$
\frac{2\pi}{P}\left(t-t_0\right) = \varepsilon - e\sin\left(\varepsilon\right)
$$

Apply Kepler's 3rd Law $\ P = 2\pi\sqrt{\dfrac{a^3}{\mu}}$

$$
\underbrace{\sqrt{\frac{\mu}{a^3}}\left(t-t_0\right)}_{\textcolor{red}{\text{mean anomaly}}} = E-e\sin\left(E\right)
$$

$$
\boxed{M = E-e\sin\left(E\right)} \qquad \text{Kepler's eq.}
$$

We recall the constant $\sqrt{\dfrac{\mu}{a^3}} = $ mean motion

$$
\boxed{n = \sqrt{\frac{\mu}{a^3}} \qquad M = n\left(t-t_0\right)}
$$

For this equation to be of much use, we need to relate true anomaly, $\theta$, to eccentric anomaly, $E$.

$$
\sin\theta = \frac{\sqrt{1-e^2}\sin\left(E\right)}{1-e\cos\left(E\right)} \qquad\qquad \cos\left(\theta\right) = \frac{\cos\left(E\right)-e}{1-e\cos\left(E\right)}
$$

$$
\sin\left(E\right) = \frac{\sqrt{1-e^2}\sin\left(\theta\right)}{1+e\cos\left(\theta\right)} \qquad\qquad \cos\left(E\right) = \frac{\cos\left(\theta\right)+e}{1+e\cos\theta}
$$

$$
\tan\left(\frac{E}{2}\right) = \sqrt{\frac{1-e}{1+e}}\tan\left(\frac{\theta}{2}\right)
$$

The direct application of Kepler's equation allows us to find the time required to travel between two points on orbit.

![[2026-09-28 fig5.svg]]

$$
M = E-e\sin\left(E\right)
$$

$$
M = n\left(t-t_0\right) = E-e\sin\left(E\right)
$$

$$
n\left(t_2-t_1\right) = \left(E_2-e\sin\left(E_2\right)\right)-\left(E_1-e\sin\left(E_1\right)\right)
$$

if we go through periapsis $k$ times...

![[2026-09-28 fig6.svg]]

$$
n\left(t_2-t_1\right) = 2\pi k + \left(E_2-e\sin\left(E_2\right)\right)-\left(E_1-e\sin\left(E_1\right)\right)
$$

$$
n = \sqrt{\frac{\mu}{a^3}}
$$

$$
\left(t_2-t_1\right) = \sqrt{\frac{a^3}{\mu}}\left(2\pi k + \left(E_2-e\sin E_2\right)-\left(E_1-e\sin E_1\right)\right)
$$

**Example:** Consider a spacecraft of altitude of 410 km at $r_p$ and $e=0.3$. How long from $15^\circ$ to $130^\circ$? $\Delta t$?

![[2026-09-28 fig7.svg]]

$$
\cos\left(E_1\right) = \frac{e+\cos\theta}{1+e\cos\theta}
$$

$$
E_1 = 0.1926\ \text{rad} \qquad E_2 = 2.0094\ \text{rad}
$$

$$
r_p = h + r_e = 6378\ \text{km}+410\ \text{km} = 6788\ \text{km}
$$

$$
r_p = a\left(1-e\right)\ \rightarrow\ a = 9697.1\ \text{km}
$$

$$
t_2-t_1 = \sqrt{\frac{a^3}{\mu}}\left[\left(E_2-e\sin E_2\right)-\left(E_1-e\sin E_1\right)\right]
$$

$$
\boxed{\Delta t = 2424\ \text{sec or } 40.4\ \text{min}}
$$

### Kepler's problem

Kepler's problem is the task of finding the location of a body in orbit after time has passed

(solve Kepler's eq) $\quad M = n\left(t-t_0\right) = E-e\sin\left(E\right)$

This is a transcendental function (Non-algebraic)

So, in general we must use a numerical Method.

The most common solution uses a Newton-Raphson iteration scheme.

Therefore, lets rewrite Kepler's eq...

$$
F\left(E\right) = E-e\sin\left(E\right)-M = 0
$$

Assume we have a good initial guess of $E$

$$
E = E_n+\delta_n\ ,\ \text{where } \delta_n \text{ is small}
$$

We can take a taylor series expansion...

$$
F\left(E\right) = F\left(E_n+\delta_n\right) = F\left(E_n\right) + F'\left(E_n\right)\delta_n + \underbrace{\tfrac{1}{2}F''\left(E_n\right)\delta_n^2\ \dots}_{\textcolor{red}{\text{ignore}}}
$$

The only first order term is $\delta_n$

$$
0 = F\left(E\right) \approx F\left(E_n\right) + F'\left(E_n\right)\delta_n
$$

$$
F'\left(E_n\right)\delta_n = -F\left(E_n\right)
$$

$$
\delta_n = -\frac{F\left(E_n\right)}{F'\left(E_n\right)} \qquad \begin{aligned}F\left(E_n\right) &= E_n-e\sin\left(E_n\right)-M\\ F'\left(E_n\right) &= 1-e\cos\left(E_n\right)\end{aligned}
$$

$$
\delta_n = -\frac{E_n-e\sin\left(E_n\right)-M}{1-e\cos\left(E_n\right)} = \frac{M-E_n+e\sin\left(E_n\right)}{1-e\cos\left(E_n\right)}
$$

Thus, $E_{n+1} = E_n+\delta_n$

The trick is to find a good initial guess for $E_0$

for a circular orbit ($e=0$) $\rightarrow$ $M=E$

Assume we've already reduced mean anomaly to $-2\pi<M<2\pi$

A good initial guess of $E_0$ is

$$
E_0 = \begin{cases}M-e\ , & -\pi<M<0\ \text{or}\ M>\pi\\ M+e\ , & \text{otherwise}\end{cases}
$$

![[2026-09-28 fig8.svg]]

If the orbit is not an ellipse, we must use alternate formulations of Kepler's eq.

$$
t-t_0 = \frac{1}{2\sqrt\mu}\left[pD + \frac{1}{3}D^3\right] \qquad D = \sqrt p\,\tan\left(\frac{\theta}{2}\right)
$$

<span style="color:red">↑ Barker's eq. only for $e=1$</span>

**Hyperbolic.**

$$
t-t_0 = \sqrt{\frac{\left(-a\right)^3}{\mu}}\left(e\sinh\left(F\right)-F\right) \qquad \cosh\left(F\right) = \frac{e+\cos\theta}{1+e\cos\theta}
$$

Be careful, if numerically $e\rightarrow 1$

All of this may be avoided using Universal variables...

$\hookrightarrow$ we get a lot less intuitive insight.

### Universal variables

Recall $\ \varepsilon = \dfrac{v^2}{2}-\dfrac{\mu}{r} = -\dfrac{\mu}{2a}$

Some algebra will yield

$$
\dot r^2 = -\frac{\mu p}{r^2}+\frac{2\mu}{r}-\frac{\mu}{a}
$$

We'll now introduce a change of variables as a Sundman transformation.

$$
\frac{d\chi}{dt} = \frac{\sqrt\mu}{r} \ \rightarrow\ \chi \text{ is a new variable.}
$$

$$
\dot r^2 = \left(\frac{dr}{d\chi}\frac{d\chi}{dt}\right)^2 = \left(\frac{dr}{d\chi}\right)^2\frac{\mu}{r^2} = -\frac{\mu p}{r^2}+\frac{2\mu}{r}-\frac{\mu}{a}
$$

$$
\left(\frac{dr}{d\chi}\right)^2 = -p+2r-\frac{r^2}{a}
$$

$$
d\chi = \frac{dr}{\sqrt{-p+2r-\dfrac{r^2}{a}}}
$$

$\downarrow$ integrate

$$
\chi+C_0 = \sqrt a\,\sin^{-1}\left(\frac{r/a-1}{\sqrt{1-p/a}}\right) \ \longrightarrow\ p=a\left(1-e^2\right) \ \longrightarrow\ e=\sqrt{1-\frac{p}{a}}
$$

$$
r = a\left[1+e\sin\left(\frac{\chi+C_0}{\sqrt a}\right)\right]
$$

So, what is the meaning of $\chi$?

$$
r = a\left(1-e\cos\left(E\right)\right) \ \Rightarrow\ \sin\left(\frac{\chi+C_0}{\sqrt a}\right) = -\cos\left(E\right)
$$

> [!aside]
> $\sin\left(\alpha\right) = \cos\left(\frac{\pi}{2}\pm\alpha\right)$

$$
\sin\left(\frac{\chi+C_0}{\sqrt a}\right) = -\cos\left(\frac{\pi}{2}+\frac{\chi+C_0}{\sqrt a}\right) = -\cos\left(E\right)
$$

Thus, $\quad E = \dfrac{\pi}{2}+\dfrac{\chi+C_0}{\sqrt a}$

Let $\chi=0$ at $t_1 \ \rightarrow\ E_1 = \dfrac{\pi}{2}+\dfrac{C_0}{\sqrt a}$

Then, $\quad E = \dfrac{\chi}{\sqrt a}+E_1$

$$
\boxed{\chi = \sqrt a\left(E-E_1\right) \ \rightarrow\ \chi = \sqrt a\left(\Delta E\right)}
$$

Back to the main story...

Substitute into the def of $\dot\chi$

$$
\frac{d\chi}{dt} = \frac{\sqrt\mu}{r} \ \Rightarrow\ \sqrt\mu\,dt = r\,d\chi
$$

$$
\sqrt\mu\,dt = a\left[1+e\sin\left(\frac{\chi+C_0}{\sqrt a}\right)\right]d\chi
$$

Integrate... $\chi=0$ at $t_1$

$$
\Delta t\sqrt\mu = a\chi - ae\sqrt a\left(\cos\left(\frac{\chi+C_0}{\sqrt a}\right) - \cos\left(\frac{C_0}{\sqrt a}\right)\right)
$$

$$
\sqrt\mu\,\Delta t = a\left(\chi-\sqrt a\sin\left(\frac{\chi}{\sqrt a}\right)\right) + \frac{\bar r_1\cdot\bar v_1}{\sqrt\mu}a\left(1-\cos\left(\frac{\chi}{\sqrt a}\right)\right) + r_1\sqrt a\sin\left(\frac{\chi}{\sqrt a}\right)
$$

Apply to $r$...

$$
r = a + a\left[\frac{\bar r_1\cdot\bar v_1}{\sqrt{\mu a}}\sin\left(\frac{\chi}{\sqrt a}\right) + \left(\frac{r_1}{a}-1\right)\cos\left(\frac{\chi}{\sqrt a}\right)\right]
$$

Still have some problems when $a\rightarrow\infty$ or $a<0$

Define another new variable.

$$
z = \frac{\chi^2}{a} \ \rightarrow\ a = \frac{\chi^2}{z}
$$

> [!aside]
> $z = \dfrac{1}{a}\left(\sqrt a\,\Delta E\right)^2 = \left(\Delta E\right)^2$

such that

$$
\sqrt\mu\,\Delta t = \left[\frac{\sqrt z-\sin\sqrt z}{\sqrt{z^3}}\right]\chi^3 + \frac{\bar r_1\cdot\bar v_1}{\sqrt\mu}\chi^2\left[\frac{1-\cos\sqrt z}{z}\right] + \frac{r_1\chi\sin\left(\sqrt z\right)}{\sqrt z}
$$

$$
r = \frac{\chi^2}{z} + \frac{\bar r_1\cdot\bar v_1}{\sqrt\mu}\cdot\frac{\chi}{\sqrt z}\sin\left(\sqrt z\right) + r_1\cos\left(\sqrt z\right) - \frac{\chi^2}{z}\cos\sqrt z
$$

observe...

$$
C\left(z\right) = \frac{1-\cos\left(\sqrt z\right)}{z} = \frac{1-\cosh\left(\sqrt{-z}\right)}{-z} = \frac{1}{2!}-\frac{z}{4!}+\frac{z^2}{6!}-\frac{z^3}{8!}\dots = \sum_{k=0}^{\infty}\frac{\left(-z\right)^k}{\left(2k+2\right)!}
$$

$$
S\left(z\right) = \frac{\sqrt z-\sin\left(\sqrt z\right)}{\sqrt{z^3}} = \frac{\sinh\left(\sqrt{-z}\right)-\sqrt{-z}}{\sqrt{\left(-z\right)^3}} = \sum_{k=0}^{\infty}\frac{\left(-z\right)^k}{\left(2k+3\right)!}
$$

and Finally

$$
\boxed{\sqrt\mu\,\Delta t = \chi^3S + \frac{\bar r_1\cdot\bar v_1}{\sqrt\mu}\chi^2C + r_1\chi\left(1-zS\right)}
$$

$$
\boxed{r = \sqrt\mu\,\frac{dt}{d\chi} = \chi^2C + \frac{\bar r_1\cdot\bar v_1}{\sqrt\mu}\chi\left(1-zS\right) + r_1\left(1-zC\right)}
$$

at $\bar r_1,\bar v_1 \ \rightarrow\ \chi=0$ at $t_1$

Thus, the Kepler problem has $\Delta t=t_2-t_1$, and we know $t_2$

Use Newton-Raphson to update $\chi$

$$
\chi_{n+1} = \chi_n + \frac{\Delta t-\Delta t_n}{\left.\dfrac{dt}{d\chi}\right|_{\chi=\chi_n}}
$$

the only missing part is a good initial guess for $\chi$

for elliptical orbits: $\quad \sqrt{\dfrac{\mu}{a}}\left(t_2-t_1\right) = \chi$

in BMWS eq. 4-76 for hyperbolas

This all quickly converges, $t$ vs. $\chi$ curve is well-behaved.

Recall $\dfrac{dt}{d\chi} = \dfrac{r}{\sqrt\mu}$ $\leftarrow$ maximum at apoapsis, minimum at periapsis

![[2026-09-28 fig9.svg]]

![[2026-09-28 fig10.svg]]

**End of Material for Test 1**

### The Lagrange Coefficients ($f$ and $g$ functions)

Orbits are planar, and spanned by $\bar r$ and $\bar v$ at any given time

Thus, the position and velocity at any later time may be written as a linear combination of position and velocity at a reference time.

$$
\bar r = f\bar r_0+g\bar v_0
$$

$$
\bar v = \dot f\bar r_0+\dot g\bar v_0
$$

We can write position and Velocity in the perifocal frame

$$
\bar r = x\hat p+y\hat q \qquad \bar v = \dot{\bar r} = \dot x\hat p+\dot y\hat q
$$

$$
\bar h = \bar r\times\bar v = \left(x\hat p+y\hat q\right)\times\left(\dot x\hat p+\dot y\hat q\right) = \left(x\dot y-\dot x y\right)\hat w
$$

Let us now solve for $\hat p$ and $\hat q$ in the terms of $\bar r$ and $\bar v$ at the same reference time $t_0$

$$
\bar r_0 = x_0\hat p+y_0\hat q \ \rightarrow\ \hat q = \frac{1}{y_0}\bar r_0-\frac{x_0}{y_0}\hat p
$$

$$
\bar v_0 = \dot x_0\hat p+\dot y_0\hat q = \dot x_0\hat p+\dot y_0\left(\frac{1}{y_0}\bar r_0-\frac{x_0}{y_0}\hat p\right) = \left(\frac{\dot x_0y_0-\dot y_0x_0}{y_0}\right)\hat p+\frac{\dot y_0}{y_0}\bar r_0
$$

$$
\textcolor{red}{\dot x_0y_0-\dot y_0x_0 = -h}
$$

$$
\bar v_0 = -\frac{h}{y_0}\hat p+\frac{\dot y_0}{y_0}\bar r_0
$$

$$
\Rightarrow\ \frac{h}{y_0}\hat p = \frac{\dot y_0}{y_0}\bar r_0-\bar v_0 \ \Rightarrow\ \hat p = \frac{\dot y_0}{h}\bar r_0-\frac{y_0}{h}\bar v_0
$$

and

$$
\hat q = \frac{1}{y_0}\bar r_0-\frac{x_0}{y_0}\hat p = \frac{1}{y_0}\bar r_0-\frac{x_0}{y_0}\left(\frac{\dot y_0}{h}\bar r_0-\frac{y_0}{h}\bar v_0\right)
$$

Simplify to...

$$
\hat q = \frac{h-x_0\dot y_0}{y_0h}\bar r_0+\frac{x_0}{h}\bar v_0
$$

$$
\hat q = \frac{-\textcolor{red}{\cancel{\textcolor{black}{y_0}}}\dot x_0}{\textcolor{red}{\cancel{\textcolor{black}{y_0}}}h}\bar r_0+\frac{x_0}{h}\bar v_0 \ \rightarrow\ \hat q = -\frac{\dot x_0}{h}\bar r_0+\frac{x_0}{h}\bar v_0
$$

$$
\bar r = x\left(\frac{\dot y_0}{h}\bar r_0-\frac{y_0}{h}\bar v_0\right) - y\left(-\frac{\dot x_0}{h}\bar r_0+\frac{x_0}{h}\bar v_0\right)
$$

$$
\bar r = \left(\frac{x\dot y_0-y\dot x_0}{h}\right)\bar r_0+\left(\frac{-xy_0+yx_0}{h}\right)\bar v_0
$$

$$
\bar v = \left(\frac{\dot x\dot y_0-\dot y\dot x_0}{h}\right)\bar r_0+\left(\frac{-\dot xy_0+\dot yx_0}{h}\right)\bar v_0
$$

$$
\boxed{\begin{aligned}\bar r &= f\bar r_0+g\bar v_0\\ \bar v &= \dot f\bar r_0+\dot g\bar v_0\end{aligned}} \qquad \text{where} \qquad \begin{aligned}f &= \frac{x\dot y_0-y\dot x_0}{h} & g &= \frac{-xy_0+yx_0}{h}\\ \dot f &= \frac{\dot x\dot y_0-\dot y\dot x_0}{h} & \dot g &= \frac{-\dot xy_0+\dot yx_0}{h}\end{aligned}
$$

recall that $\bar h = \bar r\times\bar v$

$$
\bar h = \left(f\bar r_0+g\bar v_0\right)\times\left(\dot f\bar r_0+\dot g\bar v_0\right) = f\dot g\left(\bar r_0\times\bar v_0\right) + g\dot f\left(\bar v_0\times\bar r_0\right)
$$

$$
\bar h = \left(f\dot g-g\dot f\right)\left(\bar r_0\times\bar v_0\right) \qquad \bar h = \left(f\dot g-g\dot f\right)\bar h_0
$$

Thus, $\boxed{f\dot g-g\dot f = 1}$, thus $f,g,\dot f,\dot g$ are not independent

We can write $f,g,\dot f,\dot g$ in terms of $\Delta\theta,\ \Delta E,\ \chi$

$$
f = 1-\frac{a}{r_0}\left(1-\cos\left(\Delta E\right)\right) \qquad\qquad \dot f = -\sqrt\mu\,a\,\sin\left(\Delta E\right)
$$

$$
g = \Delta t-\sqrt{\frac{a^3}{\mu}}\left(\Delta E-\sin\left(\Delta E\right)\right) \qquad\qquad \dot g = 1-\frac{a}{r}\left(1-\cos\left(\Delta E\right)\right)
$$

$$
f = 1-\frac{\chi^2}{r_0}C \qquad\qquad \dot f = \frac{\sqrt\mu}{rr_0}\chi\left(zS-1\right)
$$

$$
g = \Delta t-\frac{\chi^3}{\sqrt\mu}S \qquad\qquad \dot g = 1-\frac{\chi^2}{r}C
$$

These let you propagate $\bar r_0$ and $\bar v_0$ directly.

### Lambert's problem (Gauss's problem)

Given two position vectors ($\bar r_1$ and $\bar r_2$) and the elapsed time, $\Delta t$, find the orbit that matches the boundary conditions.

If $\bar r_1=\bar r\left(t_1\right)$ and $\bar r_2=\bar r\left(t_1+\Delta t\right)$ are not colinear, they define a plane.

Let $\Delta\theta = \theta_2-\theta_1$ be the difference in true anomaly between $\bar r_1$ and $\bar r_2$

$$
\cos\left(\Delta\theta\right) = \frac{\bar r_1\cdot\bar r_2}{\left|\bar r_1\right|\left|\bar r_2\right|}
$$

<span style="color:red">↑ quadrant ambiguous</span>

for any pair $\bar r_1$ and $\bar r_2$, two possible solutions

1) short way $\quad 0<\Delta\theta<\pi$
2) long way $\quad \pi<\Delta\theta<2\pi$

Also need specified direction of motion.