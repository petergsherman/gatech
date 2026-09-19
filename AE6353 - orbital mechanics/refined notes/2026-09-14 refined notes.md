---
note_type: refined-lecture
course: AE6353
lecture_date: 2026-09-14
source_pdf: '[[09-14-2026 - om rough notes.pdf]]'
tags:
- gt
- notes/refined
permalink: brain/ae6353-orbital-mechanics/refined-notes/2026-09-14-refined-notes
---

# AE6353 — Lecture 2026-09-14

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