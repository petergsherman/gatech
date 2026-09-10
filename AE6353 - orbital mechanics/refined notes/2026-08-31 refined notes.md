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
