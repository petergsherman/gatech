# Heading 1

This is a paragraph beneath a level-one heading.

## Heading 2

This section tests basic text formatting.

### Heading 3

#### Heading 4

##### Heading 5

###### Heading 6

---

## Text Formatting

This is normal text.

**This text is bold.**

*This text is italicized.*

***This text is bold and italicized.***

~~This text has a strikethrough.~~

This sentence contains some `inline code`.

This sentence contains a ==highlighted section==.

You can combine formatting, such as **bold text with *italic text* inside it**.

---

## Lists

### Unordered List

* First item
* Second item

  * Nested item
  * Another nested item

    * Third-level item
* Third item

### Ordered List

1. First step
2. Second step

   1. Nested step
   2. Another nested step
3. Third step

### Task List

* [x] Completed task
* [ ] Incomplete task
* [ ] Another incomplete task

---

## Links

### External Link

[Obsidian Website](https://obsidian.md)

### Internal Obsidian Links

[[Example Note]]

[[Example Note|Custom Link Text]]

[[Example Note#Specific Heading]]

![[Example Note]]

---

## Blockquotes

> This is a blockquote.

> This blockquote contains multiple lines.
>
> It can also contain **bold text**, *italic text*, and `inline code`.

> [!note]
> This is an Obsidian callout.

> [!warning]
> This is a warning callout.

> [!tip] Custom Callout Title
> This callout has a custom title.

> [!info]- Collapsed Callout
> The minus sign makes this callout collapsed by default.

> [!example]+ Expanded Callout
> The plus sign makes this callout expanded by default.

---

## Code Blocks

### Python

```python
def calculate_force(mass: float, acceleration: float) -> float:
    """Calculate force using Newton's second law."""
    return mass * acceleration


force = calculate_force(10.0, 9.81)
print(f"Force: {force:.2f} N")
```

### C++

```cpp
#include <iostream>

int main() {
    double mass = 10.0;
    double acceleration = 9.81;
    double force = mass * acceleration;

    std::cout << "Force: " << force << " N" << std::endl;
    return 0;
}
```

### Plain Text

```text
This is a plain-text code block.
Spacing and formatting are preserved.
```

---

## Tables

| Parameter    | Symbol | Value | Units |
| ------------ | -----: | ----: | ----- |
| Mass         |    $m$ |  10.0 | kg    |
| Acceleration |    $a$ |  9.81 | m/s²  |
| Force        |    $F$ |  98.1 | N     |

---

## Inline LaTeX

Einstein's mass-energy equation is $E = mc^2$.

Newton's second law is $F = ma$.

The magnitude of a velocity vector is

$v = \sqrt{v_x^2 + v_y^2 + v_z^2}$.

A Greek-letter test:

$\alpha, \beta, \gamma, \Delta, \theta, \phi, \psi, \omega$

---

## Display LaTeX

Newton's second law:

$$
\mathbf{F} = m\mathbf{a}
$$

The quadratic formula:

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

A definite integral:

$$
\int_a^b f(x),dx
$$

A summation:

$$
\sum_{i=1}^{n} i = \frac{n(n+1)}{2}
$$

A partial derivative:

$$
\frac{\partial f}{\partial x}
$$

A second-order differential equation:

$$
m\ddot{x} + c\dot{x} + kx = F(t)
$$

---

## Vectors and Matrices

A position vector:

$$
\mathbf{r}
==========

\begin{bmatrix}
x \
y \
z
\end{bmatrix}
$$

A state vector:

$$
\mathbf{x}
==========

\begin{bmatrix}
x & y & z & u & v & w
\end{bmatrix}^{T}
$$

A matrix:

$$
\mathbf{A}
==========

\begin{bmatrix}
a_{11} & a_{12} \
a_{21} & a_{22}
\end{bmatrix}
$$

A linear state-space model:

$$
\dot{\mathbf{x}}
================

\mathbf{A}\mathbf{x}
+
\mathbf{B}\mathbf{u}
$$

$$
\mathbf{y}
==========

\mathbf{C}\mathbf{x}
+
\mathbf{D}\mathbf{u}
$$

---

## Aerodynamics LaTeX

Dynamic pressure:

$$
q = \frac{1}{2}\rho V^2
$$

Lift and drag:

$$
L = \frac{1}{2}\rho V^2 S C_L
$$

$$
D = \frac{1}{2}\rho V^2 S C_D
$$

Angle of attack:

$$
\alpha = \tan^{-1}\left(\frac{w}{u}\right)
$$

Sideslip angle:

$$
\beta
=====

\sin^{-1}\left(
\frac{v}{\sqrt{u^2+v^2+w^2}}
\right)
$$

Aerodynamic force vector:

$$
\mathbf{F}_a
============

\frac{1}{2}\rho V^2 S
\begin{bmatrix}
C_x \
C_y \
C_z
\end{bmatrix}
$$

---

## Control-System LaTeX

A proportional-integral-derivative controller:

$$
u(t)
====

K_p e(t)
+
K_i\int_0^t e(\tau),d\tau
+
K_d\frac{de(t)}{dt}
$$

An LQR control law:

$$
\mathbf{u} = -\mathbf{K}\mathbf{x}
$$

A quadratic cost function:

$$
J
=

\int_0^\infty
\left(
\mathbf{x}^{T}\mathbf{Q}\mathbf{x}
+
\mathbf{u}^{T}\mathbf{R}\mathbf{u}
\right)dt
$$

Wrapped heading error:

$$
e_{\psi}
========

\operatorname{atan2}
\left(
\sin(\psi_d-\psi),
\cos(\psi_d-\psi)
\right)
$$

---

## Aligned Equations

$$
\begin{aligned}
F_x &= ma_x, \
F_y &= ma_y, \
F_z &= ma_z.
\end{aligned}
$$

A multi-step derivation:

$$
\begin{aligned}
E &= \frac{1}{2}mv^2 + mgh \
&= \frac{1}{2}m(v_x^2+v_y^2+v_z^2) + mgh
\end{aligned}
$$

---

## Piecewise Functions

$$
f(x)
====

\begin{cases}
x^2, & x \geq 0, \
-x, & x < 0.
\end{cases}
$$

---

## Cases with Conditions

$$
u =
\begin{cases}
u_{\max}, & e > e_{\max}, \
K_pe, & |e| \leq e_{\max}, \
-u_{\max}, & e < -e_{\max}.
\end{cases}
$$

---

## Symbols and Operators

$$
\begin{aligned}
a &\neq b, \
a &\approx b, \
a &\leq b, \
a &\geq b, \
x &\in \mathbb{R}, \
n &\in \mathbb{N}, \
\mathbf{x} &\in \mathbb{R}^{n}, \
|\mathbf{x}|_2 &= \sqrt{\mathbf{x}^{T}\mathbf{x}}.
\end{aligned}
$$

---

## Footnotes

This sentence contains a footnote.[^1]

This sentence contains another footnote.[^engineering]

[^1]: This is the first footnote.

[^engineering]: This is an engineering-related footnote with **formatted text**.

---

## Comments

The following text is an Obsidian comment and should not appear in reading view:

%% This is a hidden comment. %%

A multiline comment:

%%
This entire block is hidden in reading view.

It can contain notes, unfinished ideas, or reminders.
%%

---

## Tags

#test

#engineering

#obsidian/example

---

## Embedded Image

Replace the filename below with an image stored in your vault:

![[example-image.png]]

You can also specify the displayed width:

![[example-image.png|400]]

---

## Horizontal Rules

Text above the horizontal rule.

---

Text below the horizontal rule.

---

## Escaped Characters

Use a backslash to display Markdown characters literally:

*This text is surrounded by literal asterisks.*

# This is not a heading.

---

## Final Test Section

> [!success] Markdown Test Complete
> This note includes headings, formatting, lists, links, callouts, code blocks, tables, footnotes, comments, tags, embeds, and LaTeX equations.

The final equation is:

$$
\boxed{
\mathbf{F}
==========

m\mathbf{a}
}
$$
