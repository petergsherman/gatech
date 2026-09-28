---
note_type: study-guide
course: AE6353
tags:
- gt
- exam-prep
related:
- '[[AE6353 - Running Notes]]'
- '[[AE6353_Equation_Sheet_Test1.pdf]]'
permalink: brain/ae6353-orbital-mechanics/ae6353-test-1-study-guide
---

# AE6353 — Test 1 Study Guide (Orbital Mechanics)

> [!abstract] Scope
> Built from [[AE6353 - Running Notes]] (everything up through the **"End of Material for Test 1"** marker, i.e. through Kepler's equation / time-of-flight — *not* the Lagrange coefficients or Lambert's problem sections that follow it) and [[AE6353_Equation_Sheet_Test1.pdf]], plus the professor's verbal guidance on exam format. All new numeric examples below were computed and checked, not hand-waved.

## 0. Read this first — exam format & hard exclusions

The professor described four question types:

1. **Plug-and-chug calculations** — given some orbital data, compute $e$, $a$, $P$, $v$, $h$, etc.
2. **Identification** — name a symbol or quantity ("$a$ is the semi-major axis").
3. **"Given this, show that"** — a short derivation from a supplied starting equation to a target result. **The professor explicitly said none of these will be derivations that appear in your notes.** You will not be reproducing the eccentricity-vector derivation or the Kepler's-equation derivation verbatim — you'll be handed unfamiliar starting equations from the sheet and asked to combine them. This means the fastest path to points is fluency with the *moves* (§10), not memorized proofs.
4. Otherwise-fair game: anything on [[AE6353_Equation_Sheet_Test1.pdf]] and anything covered before the "End of Material" marker.

> [!danger] Explicitly excluded — do not spend study time here
> - **Nothing involving hyperbolic trig functions** ($\sinh$, $\cosh$, $\tanh$). This rules out the hyperbolic Kepler equation $t-t_0=\sqrt{(-a)^3/\mu}\,(e\sinh F - F)$ and the $z<0$ branch of the universal-variable $C(z)$, $S(z)$ functions.
> - **Nothing that requires an iterative/numerical method** (Newton–Raphson or similar). This rules out *solving* Kepler's equation for $E$ given $M$, and *solving* for the universal anomaly $\chi$ given $\Delta t$. You can still be asked to go the other direction (given $E$ or $\theta$, find $t$) — that's closed-form. See §9.
> - By extension: the hyperbolic branch of the universal-variable formulation, and the Lagrange $f,g$ coefficients / Lambert's problem (both are past the "End of Material" marker anyway).
> - Attitude dynamics, perturbations, anything not in the equation sheet or running notes through 2026-09-28.

---

## 1. The big picture: N-body → two-body

- Newton's 2nd law ($\bar F = m\bar a$, inertial frame only) + Newton's law of gravitation give the $N$-body force on body $i$:
$$
\bar F_i = G\sum_{\substack{j=1\\ j\neq i}}^{N}\frac{m_i m_j}{r_{ij}^{3}}\bar r_{ij}
$$
- No general closed-form solution exists for $N\geq 3$ (or really $N\geq 2$ in the sense that $6N$ EOM outnumber the available constants of motion), but conserved quantities constrain the motion:

| Conserved quantity | Result | # constants |
|---|---|---|
| Linear momentum | $\bar r_{cm}=\bar C_1 t+\bar C_2$ (COM moves at constant velocity) | 6 |
| Angular momentum | $\sum m_i\,\bar r_i\times\bar v_i=\bar C_3$ | 3 |
| Energy | $T+V=C_4$ | 1 |

10 total, vs. 12 needed for $N=2$ — this is *why* we drop to relative motion and only fully solve the restricted two-body problem.

- **Two-body assumptions:** (1) only two bodies, (2) gravity only, (3) spherical mass distributions, (4) $m_1\gg m_2$ so $Gm_1=\mu$.
- **The central result** (relative motion of $m_2$ about $m_1$):
$$
\boxed{\ddot{\bar r} = -\frac{\mu}{r^{3}}\bar r = -\frac{\mu}{r^{2}}\hat r}
$$
This single vector ODE is the parent of essentially everything else in §2–§9.

---

## 2. Annotated master equation sheet

Everything on [[AE6353_Equation_Sheet_Test1.pdf]], grouped by purpose with every symbol named. If a question type is "identify the equation / name the symbols," this section *is* the answer key.

### Gravitation & N-body
$$
F=\frac{Gm_1m_2}{r^2}\qquad F_i = G\sum_{\substack{j=1\\ j\neq i}}^{n}\frac{m_im_j}{r_{ij}^3}\bar r_{ij}
$$
$G$ = universal gravitational constant; $F_i$ = net force on body $i$ from all others.

### Energy (N-body and two-body)
$$
E=T+V\qquad T=\tfrac12\sum m_iv_i^2 \qquad V=-\tfrac12 G\sum_i\sum_{j\neq i}\frac{m_im_j}{r_{ij}}
$$
$T$ = kinetic energy, $V$ = potential energy (the $\tfrac12$ avoids double-counting each pair).

### Two-body equation of motion
$$
\ddot{\bar r}=-\frac{\mu}{r^3}\bar r
$$

### Specific energy & specific angular momentum
$$
\mathcal E=\frac{v^2}{2}-\frac{\mu}{r}\ \ (\text{vis-viva}) \qquad \bar h=\bar r\times\bar v \qquad h=rv\cos\gamma
$$
$\mathcal E$ = specific mechanical energy (energy per unit mass); $\bar h$ = specific angular momentum vector (normal to orbit plane); $\gamma$ = flight path angle (between $\bar v$ and local horizontal).

### Trajectory / conic shape
$$
r=\frac{p}{1+e\cos\theta}\qquad p=\frac{h^2}{\mu}\qquad \mu\bar e=\bar v\times\bar h-\frac{\mu}{r}\bar r
$$
$p$ = semi-latus rectum (semi-parameter); $e$ = eccentricity; $\theta$ = true anomaly (angle from periapsis); $\bar e$ = eccentricity vector, points toward periapsis, $\lVert\bar e\rVert=e$.

### Apsides & shape relations
$$
r_p=a(1-e)\qquad r_a=a(1+e)\qquad p=a(1-e^2)
$$
$$
e=\frac{c}{a}\qquad e=\frac{r_a-r_p}{r_a+r_p}
$$
$r_p,r_a$ = periapsis/apoapsis radii; $a$ = semi-major axis (size); $c$ = center-to-focus distance.

### Energy–semi-major-axis, period, characteristic speeds
$$
\mathcal E=-\frac{\mu}{2a}\qquad P=2\pi\sqrt{a^3/\mu}\qquad v_c=\sqrt{\mu/r}\qquad v_{esc}=\sqrt{2\mu/r}
$$
$P$ = orbital period (Kepler's 3rd law); $v_c$ = local circular speed; $v_{esc}$ = local escape speed.

### Perifocal-frame velocity & hodograph
$$
\bar v=\left(-\frac{\mu}{h}\sin\theta\right)\hat p+\left[\frac{\mu}{h}(e+\cos\theta)\right]\hat q
$$
$$
R=\mu/h\qquad \bar c_h=\frac{\mu e}{h}\hat q\qquad \tan\beta=\frac{\sin\theta}{e+\cos\theta}
$$
$\hat p,\hat q$ = perifocal basis vectors (toward periapsis, and 90° ahead in the orbit plane); $R$ = radius of the velocity hodograph circle; $\bar c_h$ = hodograph center offset; $\beta$ = heading angle on the hodograph.

### Anomalies & Kepler's equation (ellipse only — this is the safe, testable branch)
$$
M=n(t-t_0)=E-e\sin E
$$
$$
\sin\theta=\frac{\sqrt{1-e^2}\sin E}{1-e\cos E}\qquad \cos\theta=\frac{\cos E-e}{1-e\cos E}
$$
$$
\sin E=\frac{\sqrt{1-e^2}\sin\theta}{1+e\cos\theta}\qquad \cos E=\frac{\cos\theta+e}{1+e\cos\theta}
$$
$M$ = mean anomaly, $E$ = eccentric anomaly, $n=\sqrt{\mu/a^3}$ = mean motion, $t_0$ = time of periapsis passage.

> [!warning] Present on the sheet but off-limits for exam use
> - $t-t_0=\sqrt{(-a)^3/\mu}\,(e\sinh F-F)$ — hyperbolic Kepler's equation (has $\sinh$).
> - $C(z)=\dots=\dfrac{1-\cosh\sqrt{-z}}{-z}$, $S(z)=\dots=\dfrac{\sinh\sqrt{-z}-\sqrt{-z}}{\sqrt{(-z)^3}}$ for $z<0$ — hyperbolic branch of the universal variable functions.
> - Solving $\sqrt\mu\,\Delta t=\chi^3S+\dots$ for $\chi$, or $M=E-e\sin E$ for $E$ — both require Newton–Raphson.
> - Barker's equation $t-t_0=\frac{1}{2\sqrt\mu}(pD+\tfrac13 D^3)$, $D=\sqrt p\tan(\theta/2)$ (parabolic time of flight) uses no hyperbolic trig and isn't explicitly excluded, but it's a narrow, low-probability topic — know that it exists and what $D$ means; don't over-invest.

### Vector identities (memorize — these are the workhorses of every derivation)
$$
\bar a\times(\bar b\times\bar c)=(\bar a\cdot\bar c)\bar b-(\bar a\cdot\bar b)\bar c \qquad(\text{BAC--CAB})
$$
$$
\bar a\cdot(\bar b\times\bar c)=(\bar a\times\bar b)\cdot\bar c \qquad(\text{scalar triple product})
$$

---

## 3. Identification glossary

Use this as a flash-card table for "name this quantity" questions.

### Scalars & vectors

| Symbol                 | Name                                    | Definition / formula                                                        |
| ---------------------- | --------------------------------------- | --------------------------------------------------------------------------- |
| $\mu$                  | Gravitational parameter                 | $\mu=Gm_1$ (dominant body)                                                  |
| $r$, $\bar r$          | Position magnitude / vector             | $r=\lVert\bar r\rVert$                                                      |
| $v$, $\bar v$          | Speed / velocity vector                 | $v=\lVert\bar v\rVert$                                                      |
| $\bar h$, $h$          | Specific angular momentum (vector/mag.) | $\bar h=\bar r\times\bar v$, normal to orbit plane                          |
| $\mathcal E$           | Specific mechanical (vis-viva) energy   | $\mathcal E=v^2/2-\mu/r=-\mu/2a$                                            |
| $\bar e$, $e$          | Eccentricity vector / eccentricity      | Points toward periapsis; $\lVert\bar e\rVert=e$                             |
| $p$                    | Semi-latus rectum (semi-parameter)      | $p=h^2/\mu=a(1-e^2)$                                                        |
| $\theta$ (or $\nu$)    | True anomaly                            | Angle from periapsis to $\bar r$, measured at focus                         |
| $\gamma$               | Flight path angle                       | Angle between $\bar v$ and local horizontal                                 |
| $\beta$                | Heading angle (hodograph)               | Angle on the velocity hodograph                                             |
| $E$                    | Eccentric anomaly                       | Auxiliary angle on the circumscribed circle                                 |
| $M$                    | Mean anomaly                            | Fictitious uniformly-increasing angle, $M=n(t-t_0)$                         |
| $n$                    | Mean motion                             | $n=\sqrt{\mu/a^3}$                                                          |
| $T$ (or $t_0$)         | Time of periapsis passage               | Also called "true anomaly at epoch" quantity's time reference               |
| $a$                    | Semi-major axis                         | Size of the orbit                                                           |
| $b$                    | Semi-minor axis                         | $b=a\sqrt{1-e^2}=\sqrt{ap}$                                                 |
| $c$                    | Center-to-focus distance                | $c=ae$                                                                      |
| $r_p$, $r_a$           | Periapsis / apoapsis radius             | Closest / farthest point from focus                                         |
| $P$                    | Orbital period                          | $P=2\pi\sqrt{a^3/\mu}$                                                      |
| $v_c$                  | Circular (local) speed                  | $v_c=\sqrt{\mu/r}$                                                          |
| $v_{esc}$              | Escape speed                            | $v_{esc}=\sqrt{2\mu/r}$                                                     |
| $v_\infty$             | Hyperbolic excess speed                 | Speed remaining at $r\to\infty$; $\mathcal E=v_\infty^2/2$                  |
| $\Delta$               | Miss distance / aiming radius           | $h=v_\infty\Delta$                                                          |
| $\delta$               | Turn angle (hyperbolic flyby)           | $\sin(\delta/2)=1/e$                                                        |
| $\hat p,\hat q,\hat w$ | Perifocal basis vectors                 | $\hat p\to$ periapsis, $\hat w\parallel\bar h$, $\hat q=\hat w\times\hat p$ |
| $R$, $\bar c_h$        | Hodograph radius / center               | $R=\mu/h$, $\bar c_h=(\mu e/h)\hat q$                                       |

### The 6 classical orbital elements

| Element | Name | Describes |
|---|---|---|
| $a$ | Semi-major axis | Size |
| $e$ | Eccentricity | Shape |
| $i$ | Inclination | Tilt of orbit plane vs. equator ($\angle$ between $\hat k$ and $\bar h$) |
| $\Omega$ | Right ascension of the ascending node (RAAN) | Swivel of orbit plane about $\hat k$ |
| $\omega$ | Argument of periapsis | Orientation of the ellipse within its plane |
| $T$ (or $\theta_0$/$t_0$) | Time of periapsis passage | "Clock" position along the orbit |

### Reference frames & time

| Term | Meaning |
|---|---|
| ICRS | International Celestial Reference *System* — the specification/definition |
| ICRF | International Celestial Reference *Frame* — the physical realization of ICRS (origin at solar system barycenter, axes fixed to quasars) |
| ECI | Earth-Centered Inertial — ICRF axes translated to Earth's center |
| ECEF | Earth-Centered-Earth-Fixed — rotates with the Earth |
| GMST | Greenwich Mean Sidereal Time (an angle, $15°/\text{hr}$) |
| ERA | Earth Rotation Angle; $\text{ERA}=\text{GMST}+\varepsilon_{\text{prec}}$ |
| Solar day | 24 hr = 86,400 s, based on sun returning to a reference meridian |
| Sidereal day | Time for equinox to return to reference meridian (slightly shorter than solar day) |
| TAI | International Atomic Time — continuous, based on the SI second |
| UTC | Civil time — TAI adjusted by leap seconds to track UT1/ERA |
| DU, TU | Canonical distance/time units — normalize $\mu=\text{DU}^3/\text{TU}^2$ |

---

## 4. Conic sections & orbit geometry — comparison table

| | Circle | Ellipse | Parabola | Hyperbola |
|---|---|---|---|---|
| $e$ | $0$ | $0<e<1$ | $1$ | $e>1$ |
| $a$ | $r=$const $=p$ | finite, $>0$ | $\infty$ | finite, $<0$ (by convention) |
| $\mathcal E=-\mu/2a$ | $<0$ | $<0$ | $0$ | $>0$ |
| Orbit type | closed | closed | open (boundary case) | open |

Core relations (all elliptical/circular unless noted):
$$
r_p=a(1-e)\qquad r_a=a(1+e)\qquad r_a+r_p=2a\qquad r_a-r_p=2c
$$
$$
e=\frac{c}{a}=\frac{r_a-r_p}{r_a+r_p}\qquad p=a(1-e^2)\qquad r_p=\frac{p}{1+e}\qquad r_a=\frac{p}{1-e}
$$
$$
b=\sqrt{a^2-c^2}=a\sqrt{1-e^2}=\sqrt{ap}
$$
$$
\mathcal E=-\frac{\mu}{2a}\qquad P=2\pi\sqrt{\frac{a^3}{\mu}}\quad(\text{Kepler's 3rd law})
$$
$$
v_c=\sqrt{\mu/a}=\sqrt{\mu/r}\qquad v_{esc}=\sqrt{2\mu/r}
$$

**Hyperbolic flyby geometry** (no hyperbolic trig needed for these — plain arcsin):
$$
\sin\!\left(\frac{\delta}{2}\right)=\frac1e\qquad h=v_\infty\Delta\qquad \mathcal E=\frac{v_\infty^2}{2}
$$
Workflow: $v_\infty,\Delta\ \to\ \mathcal E,h\ \to\ a=-\mu/2\mathcal E\ \to\ p=h^2/\mu\ \to\ e=\sqrt{1-p/a}\ \to\ r_p=a(1-e)\ \to\ \delta=2\sin^{-1}(1/e)$.

> [!success]- Worked check (from your notes): Venus flyby, $v_\infty=3.5$ km/s, $\Delta=30{,}000$ km, $\mu=3.257\times10^5$ km³/s²
> $\mathcal E=6.125$ km²/s², $h=105{,}000$ km²/s, $a=-2.66\times10^4$ km, $p=3.385\times10^4$ km, $e=1.508$, $r_p=13{,}500$ km, $\delta=83°$.

---

## 5. The perifocal frame & rotation to/from inertial

**Perifocal (PQW) frame:** origin at focus, $\hat p$ toward periapsis, $\hat w\parallel\bar h$ (normal to orbit plane), $\hat q=\hat w\times\hat p$ completes the right-handed triad.

Position and velocity **in the perifocal frame**:
$$
\bar r = r\cos\theta\,\hat p+r\sin\theta\,\hat q,\qquad r=\frac{p}{1+e\cos\theta}
$$
$$
\boxed{\bar v=\left(-\frac{\mu}{h}\sin\theta\right)\hat p+\left[\frac{\mu}{h}(e+\cos\theta)\right]\hat q}
$$

**Rotation to inertial (IJK / ECI):** built from a 3-1-3 Euler sequence using $\Omega,i,\omega$. Direction matters — keep these straight:

$$
\underbrace{\bar r_{IJK}=R_3(-\Omega)\,R_1(-i)\,R_3(-\omega)\,\bar r_{PQW}}_{\text{perifocal}\ \to\ \text{inertial}}
$$
$$
\underbrace{\bar r_{PQW}=R_3(\omega)\,R_1(i)\,R_3(\Omega)\,\bar r_{IJK}}_{\text{inertial}\ \to\ \text{perifocal}}
$$

where $R_3$ is a rotation about the (current) $z$-axis and $R_1$ about the (current) $x$-axis. (Your notes call these $R_I^P$ and $R_P^I$ respectively — same content, just double-check which subscript/superscript your version of the notes uses before an exam that allows a formula sheet.)

> [!tip] Sanity check for identification questions
> $\Omega$ rotates about $\hat k$ (equatorial normal) to the ascending node; $i$ tips the plane about the new node axis; $\omega$ rotates within the orbit plane to periapsis. That ordering *is* the 3-1-3 sequence.

---

## 6. Converting between state vectors $(\bar r,\bar v)$ and orbital elements

This is core, testable material and was explicitly requested — drill both directions until they're automatic.

### 6a. Orbital elements → state vector $(\bar r,\bar v)$

Given $a,e,i,\Omega,\omega,\theta$ and $\mu$:

1. $p=a(1-e^2)$, $\quad h=\sqrt{\mu p}$
2. $r=\dfrac{p}{1+e\cos\theta}$
3. Perifocal components: $\bar r_{PQW}=r\cos\theta\,\hat p+r\sin\theta\,\hat q$
$$\bar v_{PQW}=\left(-\frac{\mu}{h}\sin\theta\right)\hat p+\left[\frac{\mu}{h}(e+\cos\theta)\right]\hat q$$
4. Rotate to inertial: $\bar r_{IJK}=R_3(-\Omega)R_1(-i)R_3(-\omega)\,\bar r_{PQW}$ (same rotation for $\bar v$).

> [!success]- Worked example: $a=8000$ km, $e=0.1$, $\theta=40°$, $\mu=398{,}600$ km³/s² (perifocal components only — the rotation is a mechanical step once you have $\Omega,i,\omega$)
> $p=a(1-e^2)=7920$ km
> $h=\sqrt{\mu p}=56{,}186.4$ km²/s
> $r=p/(1+e\cos\theta)=7356.5$ km
> $\bar r_{PQW}=(5635.4,\ 4728.6,\ 0)$ km
> $\mu/h=7.0937$ km/s
> $\bar v_{PQW}=(-4.560,\ 6.144,\ 0)$ km/s
> **Check:** vis-viva gives $v^2=\mu(2/r-1/a)=58.54\ \text{km}^2/\text{s}^2\Rightarrow v=7.651$ km/s, and $\sqrt{(-4.560)^2+6.144^2}=7.651$ km/s ✓ — this cross-check (vis-viva vs. perifocal components) is a good habit for any exam problem of this type.

### 6b. State vector → orbital elements ($\bar r,\bar v\to a,e,i,\Omega,\omega,\theta$)

Given $\bar r,\bar v,\mu$:

1. $r=\lVert\bar r\rVert$, $v=\lVert\bar v\rVert$
2. $\bar h=\bar r\times\bar v$, $\ h=\lVert\bar h\rVert$
3. $\mathcal E=\dfrac{v^2}{2}-\dfrac{\mu}{r}\ \Rightarrow\ a=-\dfrac{\mu}{2\mathcal E}$
4. $\bar e=\dfrac1\mu\left(\bar v\times\bar h-\mu\dfrac{\bar r}{r}\right)$, $\ e=\lVert\bar e\rVert$
5. **Node vector** $\bar n=\hat k\times\bar h$ (points to the ascending node)
6. $i=\cos^{-1}\!\left(\dfrac{h_z}{h}\right)$ — angle between $\hat k$ and $\bar h$
7. $\Omega=\cos^{-1}\!\left(\dfrac{n_x}{\lVert\bar n\rVert}\right)$; if $n_y<0$, use $\Omega=360°-\Omega$
8. $\omega=\cos^{-1}\!\left(\dfrac{\bar n\cdot\bar e}{\lVert\bar n\rVert e}\right)$; if $e_z<0$, use $\omega=360°-\omega$
9. $\theta=\cos^{-1}\!\left(\dfrac{\bar e\cdot\bar r}{e\,r}\right)$; if $\bar r\cdot\bar v<0$ (i.e. $\dot r<0$, moving *toward* periapsis), use $\theta=360°-\theta$

> [!tip] Why the quadrant checks?
> $\cos^{-1}$ only returns $[0°,180°]$, but these angles range over the full $360°$. Steps 7–9 are all the *same trick*: a dot product gives you $\lvert\cos(\text{angle})\rvert$ info only, so you need one more piece of sign information ($n_y$, $e_z$, or $\bar r\cdot\bar v$) to pick the correct half of the circle. This exact "half-plane ambiguity" is also why $\cos\left(\Delta\theta\right)=\bar r_1\cdot\bar r_2/(r_1r_2)$ needs a stated direction of motion in Lambert-type setups.

> [!success]- Worked example (classic textbook case): $\bar r=(6524.834,\ 6862.875,\ 6448.296)$ km, $\bar v=(4.901327,\ 5.533756,\ -1.976341)$ km/s, $\mu=398{,}600$ km³/s²
> $r=11{,}456.6$ km, $v=7.652$ km/s
> $\bar h=(\text{computed})$, $h=66{,}420.1$ km²/s, $\ p=h^2/\mu=11{,}067.8$ km
> $\mathcal E=-5.517$ km²/s² $\Rightarrow a=36{,}127.6$ km
> $e=0.8329$
> $i=87.87°$
> $\bar n=(-44{,}500.5,\ -49{,}246.7,\ 0)\Rightarrow \Omega=227.90°$ (since $n_y<0$)
> $\omega=53.39°$
> $\theta=92.34°$

**Practice — try it yourself, then check:**

> [!question]- Practice: elements → state vector. $a=10{,}000$ km, $e=0.25$, $\theta=120°$, $\mu=398{,}600$ km³/s². Find $\bar r_{PQW}$ and $\bar v_{PQW}$, and confirm with vis-viva.
> $p=9375$ km, $h=\sqrt{\mu p}=61{,}150.9$ km²/s, $r=p/(1+e\cos120°)=10{,}714.3$ km
> $\bar r_{PQW}=(-5357.1,\ 9279.9,\ 0)$ km
> $\mu/h=6.5183$ km/s $\Rightarrow \bar v_{PQW}=(-5.646,\ -3.259,\ 0)$ km/s
> Vis-viva: $v^2=\mu(2/r-1/a)=(6.517)^2$ ballpark → magnitudes agree with the perifocal components (recompute to confirm as practice).

---

## 7. The orbital hodograph — a distinctive Test-1 topic

The **hodograph** is the curve traced by the tip of $\bar v$ with its tail fixed at the origin. For *any* two-body orbit (circular, elliptical, or hyperbolic), the velocity hodograph is a **perfect circle**:
$$
\bar v_{PQW}=\underbrace{\begin{bmatrix}0\\ \mu e/h\\0\end{bmatrix}}_{\text{center }\bar c_h}+\frac{\mu}{h}\underbrace{\begin{bmatrix}-\sin\theta\\ \cos\theta\\0\end{bmatrix}}_{\text{radius }R=\mu/h}
$$
$$
R=\frac{\mu}{h}\qquad \bar c_h=\frac{\mu e}{h}\hat q\qquad \tan\beta=\frac{\sin\theta}{e+\cos\theta}
$$

Going the other way (hodograph → orbit): with $\bar s=\bar v-\bar c_h$ (vector from hodograph center to velocity tip), one can show $\bar r\cdot\bar s=0$, i.e. **$\bar s$ is always along the local horizontal**, and
$$
\boxed{\bar e=\frac1R\bar c_h\times\hat w}
$$
so if you're handed the hodograph ($R,\bar c_h$) you can recover $e$ and the orbit's orientation.

> [!tip] Reading the hodograph geometrically
> $e=\lVert\bar c_h\rVert/R$. A circular orbit ($e=0$) has the hodograph centered at the origin. An escape trajectory ($e\geq1$) has a hodograph circle that reaches or passes through the origin (since $v\to0$ is possible/impossible depending on whether the origin lies on/inside the circle) — a nice quick "identify the orbit type from a sketch" reasoning tool.

---

## 8. Kepler's equation & time-of-flight (elliptical, closed-form only)

**Definitions:** $E$ = eccentric anomaly, $M=n(t-t_0)$ = mean anomaly, $n=\sqrt{\mu/a^3}$ = mean motion.
$$
\boxed{M=E-e\sin E}\qquad(\text{Kepler's equation})
$$

> [!danger] The one-way street
> Kepler's equation is easy to evaluate **forward** ($E\to M\to t$) but has no closed-form inverse ($t\to M\to E$ requires Newton–Raphson). **The exam will not ask you to invert it.** Anything phrased as "given $\Delta\theta$, find $\Delta t$" is the *forward* direction and is fair game — see the procedure below.

### Procedure: given $\theta_1,\theta_2$ (i.e. $\Delta\theta$), find $\Delta t$ — fully closed form

1. Convert each true anomaly to eccentric anomaly using **both** sine and cosine forms (so you land in the right quadrant):
$$
\cos E=\frac{\cos\theta+e}{1+e\cos\theta}\qquad \sin E=\frac{\sqrt{1-e^2}\sin\theta}{1+e\cos\theta}\qquad E=\operatorname{atan2}(\sin E,\cos E)
$$
2. $M_1=E_1-e\sin E_1$, $\ M_2=E_2-e\sin E_2$
3. $n=\sqrt{\mu/a^3}$
4. $\Delta t=\dfrac{M_2-M_1}{n}$ — **add $2\pi$ to $\Delta M$ for each extra full revolution** if the spacecraft passes through periapsis between $\theta_1$ and $\theta_2$ (i.e. if the "raw" $M_2-M_1$ comes out negative, or the problem says it goes around $k$ extra times: $\Delta M=(M_2-M_1)+2\pi k$).

> [!success]- Worked check (from your notes): $r_p=6788$ km, $e=0.3$, $\theta:15°\to130°$
> $E_1=0.1926$ rad, $E_2=2.0094$ rad, $a=9697.1$ km $\Rightarrow \Delta t=2424$ s $=40.4$ min.

> [!success]- New practice A (worked): $a=10{,}000$ km, $e=0.2$, $\theta:30°\to200°$, $\mu=398{,}600$ km³/s²
> $E_1=24.68°=0.4308$ rad, $\ M_1=0.3473$ rad
> $E_2=204.37°=3.5670$ rad, $\ M_2=3.6495$ rad
> $n=6.313\times10^{-4}$ rad/s
> $\Delta t=(M_2-M_1)/n=5230.5\ \text{s}\approx 87.17\ \text{min}$

> [!question]- New practice B (try it yourself): $r_p=7000$ km, $e=0.5$, $\theta:0°\to90°$, $\mu=398{,}600$ km³/s². Find $\Delta t$.
> $a=r_p/(1-e)=14{,}000$ km. $E_1=0,\ M_1=0$. $E_2=60°=1.0472$ rad, $M_2=0.6142$ rad. $n=3.811\times10^{-4}$ rad/s. $\Delta t=1611.5\ \text{s}\approx 26.86$ min.

### Multiple-revolution bookkeeping

$$
n(t_2-t_1)=2\pi k+(E_2-e\sin E_2)-(E_1-e\sin E_1)
$$
Use this whenever the problem says "after 3 orbits" or the raw $\Delta M$ comes out negative when it physically shouldn't.

---

## 9. Derivation toolkit — because the exam derivations won't be the ones in your notes

The professor's promise that derivation questions are novel means memorizing the eccentricity-vector proof step-by-step is low-value. What *is* high-value: recognizing which of a handful of recurring moves turns the given equation into the target equation.

### The reusable moves

1. **$r\dot r=\bar r\cdot\bar v$.** Comes from differentiating $r=(\bar r\cdot\bar r)^{1/2}$. Appears constantly whenever a problem mixes $r,\dot r$ with $\bar r,\bar v$.
2. **Differentiating a unit vector:** $\dfrac{d}{dt}\hat r=-\dfrac{\dot r}{r^2}\bar r+\dfrac1r\dot{\bar r}$.
3. **Dot the EOM with $\bar v$** (or $\dot{\bar r}$) to generate energy-type (scalar, integrable) relations — this is how $\mathcal E=v^2/2-\mu/r$ falls out of $\ddot{\bar r}=-\mu\bar r/r^3$.
4. **Cross the EOM with $\bar h$** (a constant vector) to generate the eccentricity vector / trajectory equation — uses BAC–CAB: $\bar a\times(\bar b\times\bar c)=(\bar a\cdot\bar c)\bar b-(\bar a\cdot\bar b)\bar c$.
5. **Permute a triple product** with $\bar a\cdot(\bar b\times\bar c)=(\bar a\times\bar b)\cdot\bar c$ to relate a dot-of-cross expression to a scalar you already know (e.g. $(\bar r\times\dot{\bar r})\cdot\bar h=h^2$).
6. **Product rule on a cross product:** $\dfrac{d}{dt}(\bar a\times\bar b)=\dot{\bar a}\times\bar b+\bar a\times\dot{\bar b}$ — spot the term that vanishes (parallel vectors, e.g. $\dot{\bar r}\times\dot{\bar r}=0$), then integrate what's left to find a constant of motion.
7. **Evaluate at periapsis/apoapsis** ($\theta=0°/180°$, $\gamma=0$, $v\perp$ only) to collapse a general formula to a simple one, or vice versa — most "special case" derivations are just this.
8. **The $\mathcal E$–$a$ substitution is your best friend:** any time you have $v^2/2-\mu/r$ and also know $a$, substitute $\mathcal E=-\mu/2a$ to eliminate $\mathcal E$ and relate $v,r,a$ directly. This single substitution (vis-viva in "$v(r,a)$" form) underlies more exam-style manipulations than any other trick.
9. **$p=h^2/\mu=a(1-e^2)$** is the bridge between the "$h$-family" of equations (trajectory shape, hodograph) and the "$a,e$-family" (apsides, energy, period) — reach for it whenever a derivation needs to swap between those two descriptions.

### Demo: applying the toolkit (2 lines, not in your notes as a standalone result)

*Target:* show $v^2=\mu\left(\dfrac2r-\dfrac1a\right)$ starting only from $\mathcal E=v^2/2-\mu/r$ and $\mathcal E=-\mu/2a$ (move 8).
$$
\frac{v^2}{2}-\frac{\mu}{r}=-\frac{\mu}{2a}\ \Longrightarrow\ \boxed{v^2=\mu\left(\frac2r-\frac1a\right)}
$$
That's the whole derivation — and it's arguably the single most exam-useful identity in the course, since it lets you get speed at *any* radius from just $a$ (or $r_p,r_a$).

### New practice derivations (not worked in your notes — hints given, full solution collapsed)

> [!question]- 1. Escape speed from circular speed. Show $v_{esc}=\sqrt2\,v_c$.
> Both are evaluated at the same $r$: $v_c=\sqrt{\mu/r}$, $v_{esc}=\sqrt{2\mu/r}=\sqrt2\sqrt{\mu/r}=\sqrt2\,v_c$.

> [!question]- 2. Specific angular momentum in terms of $a,e$. Show $h=\sqrt{\mu a(1-e^2)}$.
> *Hint: combine $h^2=\mu p$ (move 9) with $p=a(1-e^2)$.*
> $h^2=\mu p=\mu a(1-e^2)\Rightarrow h=\sqrt{\mu a(1-e^2)}$.

> [!question]- 3. Show $r_p\,r_a=b^2$.
> *Hint: write both radii in terms of $a,e$ and recall $b^2=a^2(1-e^2)$.*
> $r_p r_a=a(1-e)\cdot a(1+e)=a^2(1-e^2)=b^2$.

> [!question]- 4. Show $v_p\,v_a=\mu/a$ (product of periapsis and apoapsis speeds).
> *Hint: at the apsides $\gamma=0$, so $h=rv$ exactly (move 7); use $h^2=\mu p$ and problem 3.*
> $v_p=h/r_p$, $v_a=h/r_a\Rightarrow v_pv_a=h^2/(r_pr_a)=\mu p/b^2$. Since $p=a(1-e^2)$ and $b^2=a^2(1-e^2)$: $v_pv_a=\mu a(1-e^2)/[a^2(1-e^2)]=\mu/a$.

> [!question]- 5. Show that at $\theta=90°$, $r=p=b^2/a$.
> *Hint: plug $\theta=90°$ into the trajectory equation; then use move 9 and $b^2=a^2(1-e^2)$.*
> $r(90°)=p/(1+e\cos90°)=p$. And $p=a(1-e^2)=a^2(1-e^2)/a=b^2/a$.

> [!question]- 6. Flight path angle from $\theta$ and $e$. Show $\tan\gamma=\dfrac{e\sin\theta}{1+e\cos\theta}$.
> *Hint: $\tan\gamma=\dot r/(r\dot\theta)$ — you already have both pieces from the perifocal-velocity derivation in your notes ($\dot r=\frac{e\mu}{h}\sin\theta$, $r\dot\theta=\frac{\mu}{h}(1+e\cos\theta)$); the $\mu/h$ cancels.*
> $\tan\gamma=\dfrac{(\mu e/h)\sin\theta}{(\mu/h)(1+e\cos\theta)}=\dfrac{e\sin\theta}{1+e\cos\theta}$.

> [!question]- 7. Speed as an explicit function of true anomaly. Show $v^2=\dfrac{\mu}{p}\left(1+2e\cos\theta+e^2\right)$.
> *Hint: combine problem "demo" result $v^2=\mu(2/r-1/a)$ with the trajectory equation $r=p/(1+e\cos\theta)$ and $1/a=(1-e^2)/p$.*
> $v^2=\mu\left[\dfrac{2(1+e\cos\theta)}{p}-\dfrac{1-e^2}{p}\right]=\dfrac\mu p\left[2+2e\cos\theta-1+e^2\right]=\dfrac\mu p\left(1+2e\cos\theta+e^2\right)$.

> [!tip] General strategy if you're handed an unfamiliar "given/show" problem
> 1. Write down everything you're *given* and the *target* expression, side by side.
> 2. Scan §2 (or the real equation sheet) for any equation containing a symbol that appears in **both**.
> 3. Substitute to eliminate whichever symbol is in your given/derived expressions but *not* in the target.
> 4. If two vectors are being combined, ask "is this a dot product (→ scalar/energy) or cross product (→ new vector/BAC-CAB) situation?"
> 5. If time derivatives are involved, check whether the quantity is a known constant of motion ($h$, $\bar e$, $\mathcal E$) — if so, its derivative is zero and that's usually the whole point of the problem.

---

## 10. Worked example bank (from your notes — good calculation drills)

> [!example]- ISS circular orbit ($h_{alt}=410$ km, $\mu_{Earth}=3.986\times10^5$ km³/s²)
> $r_c=6788$ km. $v_c=7.663$ km/s. $\mathcal E=-29.36$ km²/s². $P=5566$ s $=92.76$ min. $h=5.2\times10^4$ km²/s.

> [!example]- Mars Reconnaissance Orbiter capture orbit ($r_a=48{,}389$ km, $r_p=3819$ km)
> $a=26{,}104$ km, $e=0.85$, $P=1.277\times10^5$ s $=35.48$ hr, $v_p=4.57$ km/s (check both via $\mathcal E=-\mu/2a$ and via $v_p=\sqrt{\mu(1+e)/r_p}$ — both are legitimate calculation-question paths to the same number).

> [!example]- Venus hyperbolic flyby ($v_\infty=3.5$ km/s, $\Delta=30{,}000$ km, $\mu=3.257\times10^5$ km³/s²)
> $\mathcal E=6.125$ km²/s², $h=105{,}000$ km²/s, $a=-2.66\times10^4$ km, $e=1.508$, $r_p=13{,}500$ km, $\delta=83°$. (No hyperbolic trig used anywhere — good confirmation that hyperbolic *geometry* problems are still fair game, only hyperbolic *time-of-flight* is excluded.)

---

## 11. New calculation practice set

> [!question]- A. Given $r_a=52{,}000$ km, $r_p=7200$ km, $\mu=398{,}600$ km³/s², find $a,e,P$.
> $a=29{,}600$ km, $e=0.7568$, $P=50{,}681$ s $=14.08$ hr.

> [!question]- B. An orbit has $a=15{,}000$ km, $e=0.4$ ($\mu=398{,}600$ km³/s²). Find the speed at $r=12{,}000$ km.
> $v^2=\mu(2/r-1/a)=39.86$ km²/s² $\Rightarrow v=6.313$ km/s.

> [!question]- C. A spacecraft has hyperbolic excess speed $v_\infty=4.0$ km/s and miss distance $\Delta=20{,}000$ km at Earth ($\mu=398{,}600$ km³/s²). Find $\mathcal E$, $h$, $a$, $e$, $r_p$, and the turn angle $\delta$.
> $\mathcal E=8.0$ km²/s², $h=80{,}000$ km²/s, $a=-24{,}912.5$ km, $p=16{,}056.2$ km, $e=1.282$, $r_p=7034.8$ km, $\delta=102.5°$.

> [!question]- D. (Identification) A problem states "the RAAN is $200°$ and the argument of periapsis is $50°$." Which classical orbital element(s) does this problem *not* tell you, and what would you still need to fully define the state vector at a given time?
> Missing: $a$ (or $p$/$h$), $e$, $i$, and either $\theta$ at the epoch of interest or $T$ (time of periapsis passage) to propagate via Kepler's equation. $\Omega$ and $\omega$ alone fix the plane's swivel and the ellipse's orientation *within* the plane, but not its size, shape, tilt, or where the spacecraft is along it.

---

## 12. Night-before checklist

- [ ] Can you write down all 6 orbital elements and what each one physically controls, from memory?
- [ ] Can you go elements → $(\bar r,\bar v)_{PQW}$ and $(\bar r,\bar v)\to$ elements without looking anything up except the equation sheet?
- [ ] Given $\theta_1,\theta_2,e,a$, can you get $\Delta t$ *without* ever needing to invert Kepler's equation?
- [ ] Do you have $v^2=\mu(2/r-1/a)$ so automatic that you'd reach for it in the first 10 seconds of any speed-related derivation?
- [ ] Can you tell, from a bare list of given/target symbols, whether a derivation wants a dot product (energy-type) or cross product (BAC–CAB / new-vector-type) move?
- [ ] Do you know, cold, that $\sinh,\cosh,\tanh$ and Newton–Raphson are off the table — so if a problem *seems* to need them, you're either overcomplicating it or misreading which orbit type it's asking about?
- [ ] Can you reproduce the hodograph relations ($R=\mu/h$, $\bar c_h=\frac{\mu e}h\hat q$) and explain what the hodograph looks like for $e=0$ vs. $e\geq1$?
- [ ] Reference frame vocabulary: ICRF vs. ICRS, ECI vs. ECEF, GMST/ERA, sidereal vs. solar day, DU/TU — could you define each in one sentence?