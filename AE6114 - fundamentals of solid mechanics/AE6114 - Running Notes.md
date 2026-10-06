---
note_type: running-notes
course: AE6114
tags:
- gt
- notes/running
permalink: brain/ae6114-fundamentals-of-solid-mechanics/ae6114-running-notes
---

# 2026-08-26

*Source: [[08-26-2026 - FSM rough notes.pdf]] · Refined: [[AE6114 - fundamentals of solid mechanics/refined notes/2026-08-26 refined notes|2026-08-26 refined notes]]*

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-08-26 fig1.svg]]

What determines the elongation of the bar?

↳ Stress and strain

These factors are studied in continuum mechanics

- Kinematics (Measure of deformation)
- Balance (equilibrium) → helps finds measures of stress
- Constitutive Laws (stress-strain relations)
  observed, not derived ↗

### Math preliminaries

Tensors: A tensor is an entity which linearly transforms vectors

↳ physically: Can represent physical quantities or properties that don't depend on a refrence coordinate system.

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-08-26 fig2.svg]]

← The actualy physical stress at any point doesn't change when observed from two different frames, but the tensor does.

### Scalars, vectors, tensors

Scalars: $\alpha$ $\quad \left[ \alpha \right]$ $1\times1$ matrix (Just for completeness)

Vectors: $v_i$ — indicial notation

$$
\left( v \right) = \left[ V_1,\, V_2,\, V_3,\, V_4,\, \ldots \right]
$$

$\bar{v}$ — direct notation

Tensor: $\sigma_{ij}$ — indicial notation

$$
\left[ \sigma \right] =
\begin{bmatrix}
\sigma_{11} & \sigma_{12} & \sigma_{13} & \cdots & \sigma_{1n}\\
\sigma_{21} & \ddots & & & \\
\vdots & & \ddots & & \\
\sigma_{n1} & & & & \sigma_{mn}
\end{bmatrix}
$$

$\bar{\bar{\sigma}}$ — direct notation (2nd order tensor)

### Summation Convention

$$
\alpha = a_1 x_1 + a_2 x_2 + \ldots + a_n x_n = \sum_{i=1}^{N} a_i x_i = \sum_{j=1}^{N} a_j x_j
$$

Choice of letter for index is <u>irrelevant</u> (dummy index) $\ \uparrow$

Using Summation Convention

$$
\alpha = a_i x_i = a_j x_j = \ldots \text{etc} \ \longrightarrow\ \text{for dummy indicies, summation is implied}
$$

The value of $N$ is either stated or known from context

Examples:

$$
a_i x_i = a_1 x_1 + a_2 x_2 + a_3 x_3 \qquad (n=3)
$$

$$
a_i a_i = a_1^{\,2} + a_2^{\,2} + a_3^{\,2} + a_4^{\,2} \qquad (n=3)
$$

$$
\sigma_{ii} = \sigma_{11} + \sigma_{22} + \sigma_{22} \qquad (n=3)
$$

Notes: 1. A product having more than two occurances of the same dummy index is meaningless (i.e. $a_i b_i c_i$)

2. A sum is always implied unless noted otherwise

3. In this class, $n=3$ so $i \in 1,2,3$ unless stated otherwise

An index that appears only once in each term is called a "free" index.

$$
A_{ij} x_j = b_i = A_{i1} x_1 + A_{i2} x_2 + A_{i3} x_3
$$

<span style="color:red">j is dummy<br>i is free index</span>

Thus,

$$
\begin{aligned}
A_{11} x_1 + A_{12} x_2 + A_{13} x_3 &= b_1\\
A_{21} x_1 + A_{22} x_2 + A_{23} x_3 &= b_2\\
A_{31} x_1 + A_{32} x_2 + A_{33} x_3 &= b_3
\end{aligned}
$$

or,

$$
\begin{bmatrix}
A_{11} & A_{12} & A_{13}\\
A_{21} & A_{22} & A_{23}\\
A_{31} & A_{32} & A_{33}
\end{bmatrix}
\begin{Bmatrix} x_1\\ x_2\\ x_3 \end{Bmatrix}
=
\begin{Bmatrix} b_1\\ b_2\\ b_3 \end{Bmatrix}
$$

### Kronecker Delta $\delta_{ij}$

Defined as $\ \delta_{ij} = \begin{cases} 1 & \text{if } i=j\\ 0 & \text{if } i\neq j \end{cases}$ $\qquad$ Thus it is the identity matrix $\bar{\bar{I}} = \delta_{ij}$

An important property of $\delta_{ij}$ is index substitution

↓

$$
x_i \delta_{ij} = x_1 \delta_{1j} + x_2 \delta_{2j} + x_3 \delta_{x_3 j}
$$

$$
= \begin{cases} x_1 & \text{if } j=1\\ x_2 & \text{if } j=2\\ x_3 & \text{if } j=3 \end{cases}
\qquad \longrightarrow \qquad x_i \delta_{ij} = x_j
$$

<span style="color:red">↷ dummy is substituted with the free index</span>

EX:

$$
A_{ij}\delta_{ij} = A_{ii} = A_{11} + A_{22} + A_{33}
$$

$$
= A_{jj}
$$

$$
A_{ij} - \underset{\textcolor{red}{\uparrow}}{A_{ik}}\,\underset{\textcolor{red}{\uparrow}}{\delta_{jk}} = A_{ij} - A_{ij} = 0_{ij}
\qquad \Bigg| \qquad
A_{ij}\delta_{jk} - A_{ij}\delta_{jk} = A_{ik} - A_{ik} = 0_{ik}
$$

<span style="color:red">dummy k</span>

$$
\delta_{ii} = \delta_{11} + \delta_{22} + \delta_{33} = 3
$$

### Permutation Symbol

defined as:

$$
\epsilon_{ijk} = \begin{cases}
1 & \text{if } i,j,k \text{ form an even permutation of } 1,2,3\\
-1 & \text{if } i,j,k \text{ form an odd permutation of } 1,2,3\\
0 & \text{if Do not form perm of } 1,2,3
\end{cases}
$$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-08-26 fig3.svg]]

$$
\epsilon_{123} = \epsilon_{231} = \epsilon_{312} = 1
$$

$$
\epsilon_{132} = \epsilon_{321} = \epsilon_{213} = -1
$$

$$
\epsilon_{112} = \epsilon_{221} = \ldots = 0
$$

### Operations with tensors

<u>Addition</u> $\qquad \bar{\bar{C}} = \bar{\bar{A}} + \bar{\bar{B}} \ \longrightarrow\ C_{ij} = A_{ij} + B_{ij}$

<u>Subtraction</u> $\qquad \bar{\bar{C}} = \bar{\bar{A}} - \bar{\bar{B}} \ \longrightarrow\ C_{ij} = A_{ij} - B_{ij}$

<u>Magnification</u> $\qquad \bar{\bar{B}} = \lambda\bar{\bar{A}} \ \longrightarrow\ B_{ij} = \lambda A_{ij}$

<u>Transpose</u> $\qquad \bar{\bar{B}} = \bar{\bar{A}}^{\mathsf{T}} \ \longrightarrow\ B_{ij} = A_{ji}$

A tensor is symmetric if $\bar{\bar{B}} = \bar{\bar{B}}^{\mathsf{T}} \longrightarrow B_{ij} = B_{ji}$ (6 independent components from 9)

A tensor is skew if $\bar{\bar{B}} = -\bar{\bar{B}}^{\mathsf{T}} \rightarrow B_{ij} = -B_{ji}$

<span style="color:red">↖ must have 0 along the diagonal</span>

↑ (3 independent components)

We may write

$$
B_{ij} = \underbrace{\frac{1}{2}\left( B_{ij} + B_{ji} \right)}_{\text{Symmetric}} + \underbrace{\frac{1}{2}\left( B_{ij} - B_{ji} \right)}_{\text{Skew}}
$$

Every tensor emits a decomposition: $\ \bar{\bar{B}} = \text{sym}\,\bar{\bar{B}} + \text{skew}\,\bar{\bar{B}}$

$$
\text{Sym}\,\bar{\bar{B}} = \frac{1}{2}\left( \bar{\bar{B}} + \bar{\bar{B}}^{\mathsf{T}} \right)
\qquad
\text{skew}\,\bar{\bar{B}} = \frac{1}{2}\left( \bar{\bar{B}} - \bar{\bar{B}}^{\mathsf{T}} \right)
$$

The tensor or <u>Dyadic Product</u>

$$
\bar{\bar{A}} = \bar{x} \otimes \bar{y} \ \longrightarrow\ A_{ij} = x_i y_j
$$

### Products

Tensor by Vector: $\quad \bar{u} = \bar{\bar{A}}\cdot\bar{v} \ \rightarrow\ u_i = A_{ij} v_j \ \neq A_{ij} v_i$

Tensor on Tensor: $\quad \bar{\bar{C}} = \bar{\bar{A}}\cdot\bar{\bar{B}} \ \rightarrow\ C_{ij} = A_{ik} B_{kj}$ $\quad$ Thus, $\bar{\bar{A}}\bar{\bar{B}} \neq \bar{\bar{B}}\bar{\bar{A}}$

### Inner product

Vectors: $\quad \bar{x}\cdot\bar{y} = \bar{y}\cdot\bar{x} = x_i y_i$

Tensor: $\quad \bar{\bar{A}} : \bar{\bar{B}} = \bar{\bar{B}} : \bar{\bar{A}} = A_{ij} B_{ij}$

<u>Magnitude</u>

Vector: $\quad \lVert \bar{u} \rVert = \sqrt{\bar{u}\cdot\bar{u}} = \sqrt{u_i u_i}$

Tensor: $\quad \lVert \bar{\bar{A}} \rVert = \sqrt{\bar{\bar{A}} : \bar{\bar{A}}} = \sqrt{A_{ij} A_{ij}}$

### Cross product

Vectors:

$$
\bar{a} = \bar{u}\times\bar{v} = a_i\,\epsilon_{ijk}\, u_j v_k
$$

$$
a_1 = \epsilon_{123} u_2 v_3 + \epsilon_{132} u_3 v_2 + \epsilon_{111} u_1 v_1 + \epsilon_{112} u_1 v_2 + \epsilon_{113} u_1 v_3 + \ldots
$$

<span style="color:red">repeating indicies are zero</span>

$$
a_1 = u_2 v_3 - u_3 v_2
$$

### Trace of a tensor

$$
\text{Tr}(A) = A_{ii} \qquad \text{(sum of components on diagonal)}
$$

Thus, $\ \text{tr}\left( \bar{x}\otimes\bar{y} \right) = \bar{x}\cdot\bar{y} \ \rightarrow\ \text{tr}\left( x_i y_j \right) = x_i y_i$

A tensor $\bar{\bar{A}}$ is deviatoric if: $\ \text{Tr}(\bar{\bar{A}}) = 0$

We define the deviatoric part of a tensor $\bar{\bar{A}}$ as:

$$
\bar{\bar{A}}' = \text{Dev}\,\bar{\bar{A}} = \bar{\bar{A}} - \tfrac{1}{3}\,\text{tr}(\bar{\bar{A}})\,\bar{\bar{I}}
$$

or

$$
A_{ij}' = A_{ij} - \tfrac{1}{3} A_{kk}\,\delta_{ij}
$$

$$
\text{Tr}\left( \bar{\bar{A}}' \right) = \text{tr}\left( A_{ij} - \tfrac{1}{3} A_{kk}\delta_{ij} \right) = A_{pp} - \tfrac{1}{3} A_{kk}\,\delta_{pp}
$$

$$
= A_{pp} - \tfrac{1}{3} A_{kk}\,(3) = A_{pp} - A_{kk} = 0
$$

In doing this, we defined the spherical part of $\bar{\bar{A}}$

$$
\tfrac{1}{3}\,\text{tr}(\bar{\bar{A}})\,\bar{\bar{I}} \ \leftarrow\ \text{spherical part}
$$

Every tensor then admits a decomposition in to deviatoric and spherical parts…

$$
\bar{\bar{A}} = \underset{\uparrow\ \text{dev}}{\bar{\bar{A}}'} + \underset{\uparrow\ \text{spherical}}{\tfrac{1}{3}\,\text{tr}(\bar{\bar{A}})\,\bar{\bar{I}}}
$$

> [!aside]
> FREE Indicies have to match on each side of equation.

### Determinant of a tensor

$$
\det\left( \bar{\bar{S}} \right) = \frac{\bar{\bar{S}}\bar{u} \cdot \left( \bar{\bar{S}}\bar{v} \times \bar{\bar{S}}\bar{w} \right)}{\bar{u}\cdot\left( \bar{v}\times\bar{w} \right)}
\qquad \text{For any Non-coplanar } \{\bar{u},\bar{v},\bar{w}\}
$$

### Invertible tensor

$\bar{\bar{S}}$ is invertible if there exists an inverse $\bar{\bar{S}}^{-1}$ such that:

$$
\bar{\bar{S}}\,\bar{\bar{S}}^{-1} = \bar{\bar{S}}^{-1}\bar{\bar{S}} = \bar{\bar{I}}
\ \textcolor{red}{\longrightarrow\ \bar{\bar{S}}\bar{\bar{B}} = \bar{\bar{B}}\bar{\bar{S}} = \bar{\bar{I}} \ \text{Then } \bar{\bar{B}} = \bar{\bar{S}}^{-1}}
$$

$\bar{\bar{S}}$ is invertible if and only if $\det\left( \bar{\bar{S}} \right) \neq 0$

### Components and Change of Basis

→ Vectors and tensors are physical entities independent of the frame we choose to represent them

→ If we know the components with respect to One frame, we know them with respect to Another

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-08-26 fig4.svg]]

Basis: $\quad \bar{e}_1\cdot\bar{e}_2 = 0 \qquad \bar{e}_1\cdot\bar{e}_1 = 1$

$$
\bar{e}_1\cdot\left( \bar{e}_2\times\bar{e}_3 \right) = 1
$$

$$
\bar{e}_i\cdot\bar{e}_j = \delta_{ij}
$$

$\textcolor{red}{\uparrow \qquad \uparrow}$
<span style="color:red">i,j not index, it is a label of which unit vector we are using</span>

$$
\bar{e}_i\cdot\left( \bar{e}_j\times\bar{e}_k \right) = \epsilon_{ijk}
$$

$$
\bar{V} = V_1\bar{e}_1 + V_2\bar{e}_2 + V_3\bar{e}_3 = V_i\bar{e}_i
$$

$$
\bar{V} = V_1'\bar{e}_1' + V_2'\bar{e}_2' + V_3'\bar{e}_3' = V_i'\bar{e}_i'
$$

Find $V_i'$ in terms of $V_i$

$$
\bar{V}\cdot\bar{e}_i' = V_i' \qquad \text{as} \quad \underset{\uparrow}{V_i'} = \bar{V}\cdot\bar{e}_i' = \left( V_j\bar{e}_j \right)\cdot\bar{e}_i'
$$

$$
= \underbrace{\left( \bar{e}_i'\cdot\bar{e}_j \right)}_{\ } V_j
$$

$$
\boxed{\ V_i' = Q_{ij}\cdot V_j\ } \qquad \textcolor{red}{Q_{ij}\ \text{is a Rotation tensor}}
$$

$$
\bar{V}' = \bar{\bar{Q}}\bar{V}, \ \text{where} \ Q_{ij} = \bar{e}_i'\cdot\bar{e}_j
$$

Similarly…

$$
V_i = \bar{V}\cdot\bar{e}_i = \left( V_j'\bar{e}_j' \right)\bar{e}_i = \left( \bar{e}_i\cdot\bar{e}_j' \right) V_j'
$$

$$
= \left( \bar{e}_j'\cdot\bar{e}_i' \right) V_j'
$$

$$
= Q_{ji} V_j'
$$

$$
\boxed{\ \bar{V} = \bar{\bar{Q}}^{\mathsf{T}}\bar{V}'\ }
$$

All rotation Tensors obey:

$$
\bar{\bar{Q}}\,\bar{\bar{Q}}^{\mathsf{T}} = \bar{\bar{Q}}^{\mathsf{T}}\bar{\bar{Q}} = \bar{\bar{I}}
\qquad \text{and} \quad \det\left( \bar{\bar{Q}} \right) = \pm 1
$$

## Cross-check findings

An independent verification pass compared this transcription against the PDF at high zoom, symbol by symbol.

1. **Extra term in $a_i a_i$ (source, flagged):** inked as $a_i a_i = a_1^2 + a_2^2 + a_3^2 + a_4^2$ with $(n=3)$ written beside it — four terms for a three-term sum. Subscripts 1,2,3,4 and the $(n=3)$ are both unambiguous at high zoom. Transcribed as written.
2. **Repeated term in $\sigma_{ii}$ (source, flagged):** inked $\sigma_{ii} = \sigma_{11} + \sigma_{22} + \sigma_{22}$; the third term should be $\sigma_{33}$. The two "22" subscripts are written identically. Transcribed as written.
3. **Matrix corner entry (source, flagged):** the tensor component array's bottom-right entry is inked $\sigma_{mn}$ — a clear three-legged $m$ — where $\sigma_{nn}$ is meant, given $\sigma_{1n}$ and $\sigma_{n1}$ elsewhere in the same array. Transcribed as written.
4. **Kronecker delta condition (source, flagged):** inked $1$ if $j=j$; the glyph has both a dot and a descender, so it is a $j$, not an $i$. Should read $i=j$ — the line below correctly has $0$ if $i \neq j$. Transcribed as written.
5. **Delta subscript slip (source, flagged):** in the index-substitution expansion the third term is inked $x_3\,\delta_{x_3 j}$ — the $x_3$ was repeated into the subscript. Should be $\delta_{3j}$. Transcribed as written.
6. **Identical products in the substitution example (source, flagged):** the right-hand expression is inked $A_{ij}\delta_{jk} - A_{ij}\delta_{jk} = A_{ik} - A_{ik} = 0_{ik}$, with both products written the same. Its left-hand companion, $A_{ij} - A_{ik}\delta_{jk} = A_{ij} - A_{ij} = 0_{ij}$, is correct, so the second term of the right-hand one was presumably meant to differ. Transcribed as written.
7. **Stray $a_i$ in the cross product (source, flagged):** inked $\bar{a} = \bar{u}\times\bar{v} = a_i\,\epsilon_{ijk} u_j v_k$ — a clear $a$ with subscript $i$ sits between the equals sign and the permutation symbol. As written the right side is a scalar while the left is a vector; $a_i = \epsilon_{ijk} u_j v_k$ is meant. Transcribed as written.
8. **Both bars and both primes on one dot product (source, flagged):** the change-of-basis chain is inked $\left(\bar{e}_j'\cdot\bar{e}_i'\right) V_j'$, with a prime on both basis vectors. That product is $\delta_{ij}$, not $Q_{ji}$; the line above it correctly has $\left(\bar{e}_i\cdot\bar{e}_j'\right)$. Transcribed as written.
9. **Wording and spelling preserved as written:** "Every tensor emits a decomposition" (the analogous sentence later correctly reads "admits"); "The actualy physical stress…" — "actualy" is a caret insertion above the line; also "refrence", "occurances", "indicies", "InDicies", and "helps finds measures of stress".
10. **Confirmed, not an error:** the permutation symbol's subscript is $\epsilon_{ijk}$ — at very high zoom the first glyph is a dotted $i$ with no descender, not a second $j$. The bracket convention on the component arrays is the author's: square $\left[\alpha\right]$, $\left[\sigma\right]$, $\left[V_1, V_2, \ldots\right]$ but round $\left(v\right)$.
11. **Ink-colour audit:** every red annotation is reproduced and no black one was mistakenly coloured. Verified red: "j is dummy / i is free index"; "dummy is substituted with the free index" and its curved arrow; "dummy k" and its two arrows; "must have 0 along the diagonal"; "repeating indicies are zero"; the $\bar{\bar{S}}\bar{\bar{B}} = \bar{\bar{B}}\bar{\bar{S}} = \bar{\bar{I}}$ line together with the arrow that precedes it; "i,j not index, it is a label of which unit vector we are using"; "$Q_{ij}$ is a Rotation tensor"; and the $\hat{x},\hat{y},\hat{z}$ labels in the basis diagram. The "(3 independent components)" note and its arrow are black.
12. **Transcription fixes applied after cross-check:** removed a third overbar that had crept onto $\sigma$ in the sectioned-body diagram; restored the author's square brackets on the three component-array lines; moved the red "dummy k" arrows onto the left-hand expression they actually annotate and the red "j is dummy / i is free index" note above the "Thus," system, matching their positions in the ink; pulled the arrow preceding the red invertibility line inside the red; restored the capital $\bar{V}$ and the black emphasis caret on the $V_i'$ line; corrected the direction of the arrow on the "observed, not derived" margin note.
13. **Diagrams verified against the sketches:** the cantilever bar (wall hatching, $A$ leader into the bar, curved $P$ at the free end, $L$ dimension), the sectioned body (two outward $\bar{F}$ tractions, exterior hatching at the lower left, interior point with its leader to $\bar{\bar{\sigma}}$, the $T$ line through the cut), the cyclic-permutation loop (1 top, 2 lower right, 3 lower left, $+$ centred, arrows 3→1→2→3), and the basis diagram (black $\bar{e}_i$ with red $\hat{x},\hat{y},\hat{z}$; green dashed primed triad, drawn without overbars exactly as inked; blue $\bar{v}$) all match.
14. Everything else — every equation, index, overbar versus double overbar, boxed result, and aside — verified as matching the handwriting.

# 2026-10-06

*Source: [[10-6-2026 - fsm rough notes.pdf]] · Refined: [[AE6114 - fundamentals of solid mechanics/refined notes/2026-10-06 refined notes|2026-10-06 refined notes]]*

$$
\bar{V}' = \bar{\bar{Q}}\bar{V} \ , \text{ where } \ Q_{ij} = \bar{e}_i' \cdot \bar{e}_j
$$

Similarly…

$$
V_i = \bar{V}\cdot\bar{e}_i = \left( V_j'\,\bar{e}_j' \right)\bar{e}_i = \left( \bar{e}_i\cdot\bar{e}_j' \right) V_j'
$$

$$
= \left( \bar{e}_j'\cdot\bar{e}_i' \right) V_j'
$$

$$
= Q_{ji}\, V_j'
$$

$$
\boxed{\ \bar{V} = \bar{\bar{Q}}^{\mathsf{T}}\bar{V}'\ }
$$

All rotation Tensors obey:

$$
\bar{\bar{Q}}\,\bar{\bar{Q}}^{\mathsf{T}} = \bar{\bar{Q}}^{\mathsf{T}}\bar{\bar{Q}} = \bar{\bar{I}} \qquad \text{and} \quad \det\left( \bar{\bar{Q}} \right) = \pm 1
$$

$$
\underset{\textcolor{red}{\uparrow}}{\bar{e}_i}\cdot\underset{\textcolor{blue}{\uparrow}}{\bar{e}_k} = \left( Q_{ji}\,\underset{\textcolor{red}{\uparrow}}{\bar{e}_j'} \right)\cdot\left( Q_{pk}\,\underset{\textcolor{blue}{\uparrow}}{\bar{e}_p'} \right)
$$

$$
\delta_{ik} = Q_{ji}\,Q_{pk}\left( \bar{e}_j'\cdot\bar{e}_p' \right)
$$

$$
\delta_{ik} = Q_{ji}\,Q_{pk}\,\delta_{jp}
$$

$$
\delta_{ik} = Q_{pi}\,Q_{pk}
$$

$$
\delta_{ik} = \left( \bar{\bar{Q}}^{\mathsf{T}} \right)_{ip} Q_{pk} \qquad \longrightarrow \qquad \text{Thus,}\ \ \bar{\bar{I}} = \bar{\bar{Q}}^{\mathsf{T}}\bar{\bar{Q}}
$$

$$
\textcolor{red}{\bar{\bar{Q}}^{-1} = \bar{\bar{Q}}^{\mathsf{T}}}
$$

### Properties of $\det(\bar{\bar{A}})$

$$
\det(\bar{\bar{A}}) = \det(\bar{\bar{A}}^{\mathsf{T}})
$$

$$
\det(\bar{\bar{A}}) = \frac{1}{\det(\bar{\bar{A}}^{-1})}
$$

Given $\bar{\bar{Q}}$…

$$
\det(\bar{\bar{Q}}) = \frac{1}{\det(\bar{\bar{Q}}^{-1})} = \frac{1}{\det(\bar{\bar{Q}}^{\mathsf{T}})} = \frac{1}{\det(\bar{\bar{Q}})}
$$

Thus, $\left( \det(\bar{\bar{Q}}) \right)^2 = 1$

↓

$$
\det(\bar{\bar{Q}}) = \pm 1
$$

If $\{\bar{e}_i\}$ is right handed then $\det(\bar{\bar{Q}}) = 1$

### Tensors

Components with respect to $\{\bar{e}_i\}$

$$
S_{ij} = \bar{e}_i\cdot\bar{\bar{S}}\,\bar{e}_j \qquad \left[ 1\ \ 0 \right]\begin{bmatrix} S_{11} & S_{12}\\ S_{21} & S_{22} \end{bmatrix}\begin{bmatrix} 1\\ 0 \end{bmatrix} = \left[ 1\ \ 0 \right]\begin{bmatrix} S_{11}\\ S_{21} \end{bmatrix} = S_{11}
$$

Change of Basis…

$$
S_{ij}' = \bar{e}_i'\cdot\bar{\bar{S}}\,\bar{e}_j' = \left( Q_{ip}\,\bar{e}_p \right)\cdot\bar{\bar{S}}\left( Q_{jk}\,\bar{e}_k \right)
$$

$$
= Q_{ip}\,\underset{\textcolor{red}{\uparrow\ \ \uparrow}}{\bar{e}_p\cdot\bar{\bar{S}}\,\bar{e}_k}\,Q_{jk} \qquad = Q_{ip}\,S_{pk}\,Q_{jk} = S_{ij}'
$$

<span style="color:red">Change of variable i think</span>

Thus,

$$
\boxed{\ \bar{\bar{S}}' = \bar{\bar{Q}}\,\bar{\bar{S}}\,\bar{\bar{Q}}^{\mathsf{T}}\ } \qquad \text{or} \qquad \boxed{\ \bar{\bar{S}} = \bar{\bar{Q}}^{\mathsf{T}}\,\bar{\bar{S}}'\,\bar{\bar{Q}}\ }
$$

### Eigenvalues and Eigenvectors

Let $\bar{\bar{A}}$ be a tensor, $\bar{u}$ a vector, and $\lambda$ a scalar.

if $\bar{\bar{A}}\bar{u} = \lambda\bar{u}$ for $\bar{u}\neq 0$, then $\lambda$ is an eigenvalue of $\bar{\bar{A}}$ and $\bar{u}$ is an eigenvector of $\bar{\bar{A}}$ associated with $\lambda$.

How do we find these?

$$
\bar{\bar{A}}\bar{u} = \lambda\bar{u} = \lambda\bar{\bar{I}}\bar{u}
$$

$$
\bar{\bar{A}}\bar{u} - \lambda\bar{\bar{I}}\bar{u} = \bar{0} \ \longrightarrow\ \left( \bar{\bar{A}} - \lambda\bar{\bar{I}} \right)\bar{u} = \bar{0}
$$

Only has a non-trivial solution if $\text{Det}\left( \bar{\bar{A}} - \lambda\bar{\bar{I}} \right) = 0$

This may be written as…

$$
\lambda^3 - I_1\lambda^2 + I_2\lambda - I_3 = 0 \qquad \longleftarrow \text{characteristic equation}
$$

$$
\left.
\begin{aligned}
I_1 &= \text{tr}(\bar{\bar{A}}) = A_{ii} = \lambda_1 + \lambda_2 + \lambda_3\\
I_2 &= \tfrac{1}{2}\left( \text{Tr}(\bar{\bar{A}})^2 - \text{Tr}(\bar{\bar{A}}^2) \right) = \lambda_1\lambda_2 + \lambda_2\lambda_3 + \lambda_1\lambda_3\\
I_3 &= \text{Det}(\bar{\bar{A}}) = \lambda_1\lambda_2\lambda_3
\end{aligned}
\right\} \quad \text{Principle invariants of } A
$$

Consider A New basis $\{\bar{e}_1', \bar{e}_2', \bar{e}_3'\}$

$$
\left( \bar{\bar{A}}' - \lambda\bar{\bar{I}}' \right)\bar{v}' = \bar{0} \ \longrightarrow\ \det\left( \bar{\bar{A}} - \lambda\bar{\bar{I}} \right) = 0
$$

We Know $\bar{\bar{A}}' = \bar{\bar{Q}}\bar{\bar{A}}\bar{\bar{Q}}^{\mathsf{T}}$

$$
\text{Det}\left( \bar{\bar{Q}}\bar{\bar{A}}\bar{\bar{Q}}^{\mathsf{T}} - \lambda\bar{\bar{Q}}\bar{\bar{I}}\bar{\bar{Q}}^{\mathsf{T}} \right) = 0 = \text{Det}\left( \bar{\bar{Q}}\left( \bar{\bar{A}} - \lambda\bar{\bar{I}} \right)\bar{\bar{Q}}^{\mathsf{T}} \right)
$$

$$
\textcolor{red}{\cancel{\text{Det}(\bar{\bar{Q}})}}\,\det\left( \bar{\bar{A}} - \lambda\bar{\bar{I}} \right)\,\textcolor{red}{\cancel{\det(\bar{\bar{Q}}^{\mathsf{T}})}} = 0
$$

$$
\text{Det}(\bar{\bar{Q}}^{\mathsf{T}}) = \det(\bar{\bar{Q}}^{-1}) = \frac{1}{\det(\bar{\bar{Q}})} \ \longrightarrow\ \text{Det}\left( \bar{\bar{A}} - \lambda\bar{\bar{I}} \right) = 0
$$

★ Thus, the values of $\lambda$ are independent of the Basis used to represent $\bar{\bar{A}}$.

Since the invariants $\{I_1, I_2, I_3\}$ are coefficients of the characteristic equation, they must be independent as well.

$$
\text{Tr}(\bar{\bar{A}}') = A_{ii}' = Q_{ip}\,A_{pk}\,Q_{ik} = Q_{ip}\,Q_{ik}\,A_{pk} = \delta_{pk}\,A_{pk} = A_{kk}
$$

<u>Practically</u>

Solve characteristic equation for $\lambda$'s

→ for each $\lambda$ solve $\left( \bar{\bar{A}} - \lambda\bar{\bar{I}} \right)\cdot\bar{v} = 0$ for $\bar{v}$

### Properties of symmetric tensors

let $\bar{\bar{A}}$ be a symmetric tensor $\left( \bar{\bar{A}} = \bar{\bar{A}}^{\mathsf{T}} \right)$

1\) Eigen values <u>are real</u>

2\) The associated eigenvectors form an orthonormal basis $\{\bar{e}_1, \bar{e}_2, \bar{e}_3\}$
$\left( \text{eigen-space or eigen-basis} \right)$

3\) in the eigen basis, the Matrix representation of $\bar{\bar{A}}$ is diagonal

$$
\bar{\bar{A}} = \begin{bmatrix} \lambda_1 & 0 & 0\\ 0 & \lambda_2 & 0\\ 0 & 0 & \lambda_3 \end{bmatrix} = \underset{\uparrow}{\begin{bmatrix} \lambda_1 & 0 & 0\\ 0 & 0 & 0\\ 0 & 0 & 0 \end{bmatrix}} + \begin{bmatrix} 0 & 0 & 0\\ 0 & \lambda_2 & 0\\ 0 & 0 & 0 \end{bmatrix} + \begin{bmatrix} 0 & 0 & 0\\ 0 & 0 & 0\\ 0 & 0 & \lambda_3 \end{bmatrix}
$$

$$
\lambda_1\,\bar{v}_1\otimes\bar{v}_1 \qquad \bar{v}_1 = \left[ 1\ \ 0\ \ 0 \right] \ \ldots\ \left( \bar{v}_1\otimes\bar{v}_1 \right)_{11} = 1
$$

$$
\textcolor{red}{\text{The rest are zero}\ldots}
$$

### Spectral decomposition

<u>Practice This!</u>

$\bar{\bar{S}}$ is symmetric with distinct eigenvalues…

$$
\bar{\bar{S}} = \sum_{i=1}^{3}\lambda_i\,\bar{e}_i\otimes\bar{e}_i \qquad \text{useful later}\ldots \qquad \ln(\bar{\bar{S}}) = \sum_{i=1}^{3}\ln(\lambda_i)\,\bar{v}_i\otimes\bar{v}_i
$$

$$
\exp(\bar{\bar{S}}) = \sum_{i=1}^{3}\exp(\lambda_i)\,\bar{v}_i\otimes\bar{v}_i
$$

<span style="color:red">eigenvalues ↓ &nbsp; eigenvectors ↙ ↘</span>

This method is used to ensure same quantites when computed from different frames.

### Practice problems

1\) a) $a_i b_i = a_1 b_1 + a_2 b_2 + a_3 b_3 \ \rightarrow$ Scalar &nbsp; dot product

b) $a_i b_j = \begin{bmatrix} a_1 b_1 & a_1 b_2 & a_1 b_3\\ a_2 b_1 & a_2 b_2 & a_2 b_3\\ a_3 b_1 & a_3 b_2 & a_3 b_3 \end{bmatrix} \ \rightarrow$ tensor &nbsp; diatic product

c) $a_i b_i c_j =$

$$
\begin{aligned}
&c_1\left( a_1 b_1 + a_2 b_2 + a_3 b_3 \right) +\\
&c_2\left( a_1 b_1 + a_2 b_2 + a_3 b_3 \right) +\\
&c_3\left( a_1 b_1 + a_2 b_2 + a_3 b_3 \right)
\end{aligned}
\quad \rightarrow \ \text{Vector}\ \left( \bar{a}\cdot\bar{b} \right)\bar{c}\ \text{ or }\ \bar{a}\cdot\left( \bar{b}\otimes\bar{c} \right)
$$

2\) a) $\delta_{ij}\,a_j = a_i$

b) $\delta_{ij}\,A_{jk} = A_{ik}$

c) $\delta_{ij}\,\delta_{jk} = \delta_{ik}$

d) $\delta_{ii} = \delta_{ii} = 3 = \bar{\bar{I}}$

3\) a) $A_{ii} \rightarrow$ scalar

b) $C_{ik} = A_{ji}\,B_{jk} \rightarrow$ tensor

c) $A_{ij}\,B_{ij} = \bar{\bar{A}}:\bar{\bar{B}}$ &nbsp; scalar

5\) $A'v' = QAQ^{\mathsf{T}}\cdot Qv$

$$
Q^{\mathsf{T}}\cdot Q = I \ \rightarrow\ A'v' = \bar{\bar{Q}}\bar{\bar{A}}\bar{v}
$$

You can transform before and after the product.

6\) $\bar{\bar{A}} = \bar{\bar{A}}^{\mathsf{T}}$ &nbsp; $\lambda_1 \neq \lambda_2$ &nbsp; $\bar{m}_1\cdot\bar{m}_2 = 0$ &nbsp; (with $\bar{m}_1$, $\bar{m}_2$ marked under the two $\lambda$)

$$
\bar{\bar{A}}\bar{m}_1 = \lambda_1\bar{m}_1
$$

$$
\bar{\bar{A}}\bar{m}_2 = \lambda_2\bar{m}_2
$$

$$
\bar{m}_1\cdot\bar{\bar{A}}\,\bar{m}_2 = \lambda_2\,\bar{m}_2\cdot\bar{m}_1
$$

$$
\bar{m}_1\cdot A\,\bar{m}_2 =
$$

$$
\left( \bar{m}_1 \right)_i A_{ij} \left( \bar{m}_2 \right)_j
$$

$$
A_{ij}\left( \bar{m}_1 \right)_i \left( \bar{m}_2 \right)_j
$$

$$
\left( \bar{\bar{A}}^{\mathsf{T}}\bar{m}_1 \right)\cdot\bar{m}_2 = \left( \bar{\bar{A}}\bar{m}_1 \right)\cdot\bar{m}_2 \ \rightarrow\ \lambda_1\,\bar{m}_1\cdot\bar{m}_2
$$

$$
\tfrac{1}{2}\left( \bar{\bar{A}} + \bar{\bar{A}}^{\mathsf{T}} \right) \qquad \tfrac{1}{2}\left( \bar{\bar{A}} - \bar{\bar{A}}^{\mathsf{T}} \right)
$$

$$
\tfrac{1}{4}\left( A_{ij} + A_{ji} \right)\left( A_{ij} - A_{ji} \right) \qquad A_{ij}^{\,2} + A \ \cdots \qquad \tfrac{1}{4}\left( A:A - A:A \right) = 0
$$

### Kinematics

Define a body and its configuration…

A body is a set of material particles occupying a region of space.

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig1.svg]]

How to describe a body:

→ Select a convinient configuration as a refrence config., $B_R$

↳ Label each particle $P$ by its position $\bar{x}(P)$ in the Config, $B_R$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig2.svg]]

The Collection of $\bar{x}$ obtained describes the body.

$$
\bar{x} = x_1\bar{e}_1 + x_2\bar{e}_2 + x_3\bar{e}_3
$$

$$
B \in x_1 = \left[ 0, 1 \right],\ x_2 = \left[ 0, 1 \right],\ x_3 = \left[ 0, 1 \right]
$$

### Deformation Mapping

— Motion is a change of a body's config with time

— To describe a motion, Select an origin and provide the position occupied at time, $t$, by the particle with position $\bar{x}$ in $B_R$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig3.svg]]

$$
\bar{x} = \bar{\chi}(\bar{x}, t)
$$

Important: The deformation map $\bar{\chi}(\bar{x}, t)$ is one-to-one and has a unique inverse

$$
\bar{X} = \bar{\chi}^{-1}(\bar{x}, t)
$$

Example: $B_R$ is a unit cube, $t = \tfrac{1}{2}$

$$
\bar{x} = \bar{\chi} = x_1\left( 1 + t^2 \right)\bar{e}_1 + x_2\bar{e}_2 + x_3\bar{e}_3
$$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig4.svg]]

### Rigid Motion

A motion in which distance between any two points remains constant…

$$
\tilde{\chi}(\bar{x}, t) = \underset{\textcolor{red}{\uparrow}}{\bar{c}(t)} + \underset{\textcolor{red}{\uparrow}}{\bar{\bar{Q}}(t)}\left( \bar{x} - \underset{\textcolor{red}{\uparrow}}{\bar{0}} \right)
$$

<span style="color:red">translation Vector &nbsp;&nbsp; rotation tensor &nbsp;&nbsp; Fixed origin</span>

<u>Proof…</u>

$$
\lVert \bar{x}_a - \bar{x}_b \rVert = \lVert \bar{c}(t) + \bar{\bar{Q}}(t)\left( \bar{X}_A - \bar{0} \right) - \bar{c}(t) - \bar{\bar{Q}}(t)\left( \bar{X}_B - \bar{0} \right) \rVert
$$

$$
= \lVert \bar{\bar{Q}}\left( \bar{x}_A - \bar{x}_B \right) \rVert = \left( \bar{\bar{Q}}\left( \bar{x}_A - \bar{x}_B \right)\cdot\bar{\bar{Q}}\left( \bar{x}_A - \bar{x}_B \right) \right)^{1/2}
$$

$$
= \left( \left( \bar{x}_A - \bar{x}_B \right)\cdot\left( \bar{\bar{Q}}^{\mathsf{T}}\bar{\bar{Q}} \right)\left( \bar{x}_A - \bar{x}_B \right) \right)^{1/2} = \lVert X_A - X_B \rVert
$$

Thus, $\lVert \bar{x}_A - \bar{x}_B \rVert = \lVert X_A - X_B \rVert$

### Kinematics of local deformation

Let us consider the mapping of a point within an infinitesimal neighborhood of $\bar{X}$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig5.svg]]

$$
\bar{x} + d\bar{x} = \chi(\bar{x} + d\bar{x}, t) \ \longrightarrow\ x_i + dx_i = \chi_i(\bar{x} + d\bar{x}, t)
$$

$$
= \chi_i(X_i, t) + \frac{\partial\chi_i}{\partial X_j}(\bar{X}, t) + O\left( \lvert d\bar{X} \rvert^2 \right)
$$

$$
x_i + dx_i = x_i + \frac{\partial\chi_i}{\partial X_j}(X_i, t)\,dX_j
$$

$$
dx_i = \frac{\partial\chi_i}{\partial X_j}(X_i, t)\,dX_j
$$

$$
\textcolor{red}{F_{ij} = \frac{\partial\chi_i}{\partial X_j} \ \longrightarrow\ \text{deformation gradient}}
$$

Thus, $d\bar{x} = \bar{\bar{F}}\,d\bar{X}$

$$
\bar{\bar{F}} = \frac{\partial\bar{x}}{\partial\bar{X}} = \nabla\bar{x}
$$

How does $\bar{\bar{F}}$ transform in a changing basis

$$
\bar{x}' = \bar{\bar{Q}}\bar{x} \ , \ \bar{X}' = \bar{\bar{Q}}\bar{X}
$$

$$
\bar{\bar{F}}' = \frac{\partial \bar{x}'}{\partial \bar{X}'} = \frac{\partial \left( \bar{\bar{Q}}\bar{x} \right)}{\partial \bar{X}'} = \frac{\partial \left( \bar{\bar{Q}}\bar{x} \right)}{\partial \bar{X}} \cdot \frac{\partial \bar{X}}{\partial \bar{X}'}
$$

$$
= \left( \frac{\partial \bar{\bar{Q}}}{\partial \bar{X}}\,\bar{x} + \bar{\bar{Q}}\frac{\partial \bar{x}}{\partial \bar{X}} \right)\bar{\bar{Q}}^{\mathsf{T}}
$$

$$
= \bar{\bar{Q}}\frac{\partial \bar{x}}{\partial \bar{X}}\bar{\bar{Q}}^{\mathsf{T}} = \bar{\bar{Q}}\,\bar{\bar{F}}\,\bar{\bar{Q}}^{\mathsf{T}}
$$

★ Generally $\bar{\bar{F}}$ doesn't need to be symmetric

<u>Changes in Length, Area, Volume</u>

<u>Change in Length</u>

$$
d\bar{x} = \bar{\bar{F}}\,d\bar{X}
$$

$$
\left| d\bar{x} \right|^2 = ds^2 = d\bar{x}\cdot d\bar{x}
$$

$$
ds^2 = \left( \bar{\bar{F}}d\bar{X} \right)\bullet\left( \bar{\bar{F}}d\bar{X} \right)
$$

$$
= d\bar{X}\cdot\bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}}\,d\bar{X}
$$

$$
\textcolor{red}{\bar{\bar{C}} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}} \quad \text{Right Cauchy-Green tensor (symmetric)}}
$$

The stretch $\lambda$ of $d\bar{x}$ is defined as the ratio of the deformed length to the undeformed length.

$$
\lambda = \frac{\lVert d\bar{x} \rVert}{\lVert d\bar{X} \rVert} \qquad \lambda^2 = \frac{\lVert d\bar{x} \rVert^2}{\lVert d\bar{X} \rVert^2} = \frac{d\bar{X}\cdot\bar{\bar{C}}\,d\bar{X}}{\lVert d\bar{X} \rVert^2}
$$

$$
\bar{N} = \frac{d\bar{X}}{\lVert d\bar{X} \rVert}
$$

Thus,

$$
\boxed{\ \lambda^2 = \bar{N}\cdot\bar{\bar{C}}\bar{N}\ }
$$

The stretch $\lambda$ at a point $\bar{X}$ in any given direction $\bar{N}$ is $\lambda^2 = \bar{N}\,\bar{\bar{C}}(x)\bar{N}$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig6.svg]]

$$
\lambda^2 = \bar{N}\cdot\bar{\bar{C}}(x)\bar{N}
$$

$$
\downarrow
$$

$$
\bar{\bar{C}} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}} \ , \ \bar{\bar{F}} = \nabla\bar{\chi}
$$

$$
\textcolor{red}{\boxed{\ 0 > \lambda\ }}
$$

Example: Simple elongation

$$
\bar{\chi} = \alpha(t)\cdot x_1\bar{e}_1 + x_2\bar{e}_2 + x_3\bar{e}_3
$$

What is $\lambda$ in $\bar{N} = \bar{e}_1$, $\bar{X} = ?$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig7.svg]]

$$
F_{ij} = \frac{\partial \chi_i}{\partial x_j} \ \longrightarrow\ \left[ \bar{\bar{F}} \right] = \begin{bmatrix} \alpha & 0 & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix}
$$

$$
\bar{\bar{C}} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}} = \begin{bmatrix} \alpha & 0 & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix}\cdot\begin{bmatrix} \alpha & 0 & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix} = \begin{bmatrix} \alpha^2 & 0 & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix}
$$

<span style="color:red">↑ must be symmetric</span>

$$
\lambda^2\left( \bar{N} = \bar{e}_1 \right) = \left( 1\ 0\ 0 \right)\cdot\begin{bmatrix} \alpha^2 & 0 & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix}\begin{bmatrix} 1\\ 0\\ 0 \end{bmatrix}
$$

$$
= \alpha^2 = \lambda^2 \ \longrightarrow\ \boxed{\lambda = \alpha}
$$

Example: Simple shear:

$$
\bar{\chi} = \left( x_1 + \gamma x_2 \right)\bar{e}_1 + x_2\bar{e}_2 + x_3\bar{e}_3
$$

$$
\lambda\left( \bar{N} = \bar{e}_2 \right) ?
$$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig8.svg]]

$$
\left[ \bar{\bar{F}} \right] = \frac{\partial \chi_i}{\partial x_j} = \begin{bmatrix} 1 & \gamma & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix}
$$

$$
\bar{\bar{C}} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}} = \begin{bmatrix} 1 & \gamma & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix}\begin{bmatrix} 1 & 0 & 0\\ \gamma & 1 & 0\\ 0 & 0 & 1 \end{bmatrix} = \begin{bmatrix} 1 & \gamma & 0\\ \gamma & \gamma^2+1 & 0\\ 0 & 0 & 1 \end{bmatrix}
$$

$$
\lambda^2 = \bar{N}\bar{C}\bar{N}, \ \bar{N} = \bar{e}_2 \quad \left[ 0\ 1\ 0 \right]
$$

$$
\left[ \bar{\bar{C}}\bar{N} \right) = \begin{bmatrix} 1 & \gamma & 0\\ \gamma & \gamma^2+1 & 0\\ 0 & 0 & 1 \end{bmatrix}\begin{bmatrix} 0\\ 1\\ 0 \end{bmatrix} = \begin{bmatrix} \gamma\\ \gamma^2+1\\ 0 \end{bmatrix}
$$

$$
\left[ \bar{N}\cdot\bar{\bar{C}}\bar{N} \right) = \left( 0\ 1\ 0 \right)\begin{bmatrix} \gamma\\ \gamma^2+1\\ 0 \end{bmatrix} = \gamma^2 + 1 = \lambda^2
$$

So, $\ \lambda = \left( 1+\gamma^2 \right)^{1/2}$

$$
\textcolor{blue}{S_{ij} = \bar{e}_i\,\bar{\bar{S}}\,\bar{e}_j \ \longrightarrow\ \lambda^2 = \bar{e}_2\,\bar{\bar{C}}\,\bar{e}_2,\ \bar{N} = \bar{e}_2 \ \ldots\ \text{etc}}
$$

<u>Change in Angle:</u>

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig9.svg]]

$$
\bar{N} = \frac{d\bar{X}}{\lvert d\bar{X} \rvert} \ , \ \bar{M} = \frac{d\bar{Y}}{\lvert d\bar{Y} \rvert} \qquad\qquad \bar{n} = \frac{d\bar{x}}{\lvert d\bar{x} \rvert} \ , \ \bar{m} = \frac{d\bar{y}}{\lvert d\bar{y} \rvert}
$$

$$
\cos(\phi) = \bar{N}\cdot\bar{M} \qquad\qquad \cos(\theta) = \bar{n}\cdot\bar{m}
$$

$$
\cos(\theta) = \frac{d\bar{x}\cdot d\bar{y}}{\lvert d\bar{x} \rvert\cdot\lvert d\bar{y} \rvert} = \frac{\left( \bar{\bar{F}}d\bar{X} \right)\cdot\left( \bar{\bar{F}}d\bar{Y} \right)}{\lambda(\bar{N})\cdot\lvert d\bar{x} \rvert\,\lambda(\bar{M})\cdot\lvert d\bar{y} \rvert}
$$

$$
= \frac{d\bar{X}\cdot\left( \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}} \right)d\bar{Y}}{\lambda(\bar{N})\lvert d\bar{X} \rvert\,\lambda(\bar{M})\lvert d\bar{Y} \rvert}
$$

$$
= \frac{\bar{N}\cdot\bar{\bar{C}}\bar{M}}{\lambda(\bar{N})\,\lambda(\bar{M})}
$$

$$
\cos\theta\left( \bar{N},\bar{M} \right) = \frac{\bar{N}\cdot\bar{\bar{C}}\bar{M}}{\left( \bar{N}\cdot\bar{\bar{C}}\bar{N} \right)^{1/2}\left( \bar{M}\cdot\bar{\bar{C}}\bar{M} \right)^{1/2}}
$$

$\bar{N},\bar{M} = \left\{ \bar{e}_1,\bar{e}_2,\bar{e}_3 \right\}$

$$
\boxed{\ \cos\theta\left( \bar{e}_1,\bar{e}_2 \right) = \frac{C_{12}}{\left( C_{11} \right)^{1/2}\left( C_{22} \right)^{1/2}}\ } \ \rightarrow\ C_{12} = \bar{e}_1\cdot\bar{\bar{C}}\bar{e}_2 \ \rightarrow\ C_{ij} = \bar{e}_i\cdot\bar{\bar{C}}\bar{e}_j
$$

$$
\cos\theta\left( \bar{e}_1,\bar{e}_3 \right) = \frac{C_{13}}{\left( C_{11} \right)^{1/2}\left( C_{33} \right)^{1/2}}
$$

etc…

Diagonals of $\bar{\bar{C}}$ $\left\{ C_{11}, C_{22}, C_{33} \right\}$ encode length changes.
The off diagonals $\left\{ C_{12}, C_{13}, C_{23} \right\}$ encode Angle changes.

Example: Simple Shear

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig10.svg]]

$$
\chi = \left( x_1 + \gamma x_2 \right)\bar{e}_1 + x_2\bar{e}_2 + x_3\bar{e}_3
$$

$$
\bar{\bar{F}} = \begin{bmatrix} 1 & \gamma & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix} \qquad \bar{\bar{C}} = \begin{bmatrix} 1 & \gamma & 0\\ \gamma & 1+\gamma^2 & 0\\ 0 & 0 & 1 \end{bmatrix}
$$

Angle changes between $\left\{ \bar{e}_1, \bar{e}_2 \right\}$

$\det\left( \bar{\bar{F}} \right) = 1$ ↑ Volume conserved

$$
\cos\theta\left( \bar{e}_1,\bar{e}_2 \right) = \frac{C_{12}}{\left( C_{11} \right)^{1/2}\left( C_{22} \right)^{1/2}} = \frac{\gamma}{\left( 1+\gamma^2 \right)^{1/2}}
$$

$$
\sin\alpha\left( \bar{e}_1,\bar{e}_2 \right) = \frac{\gamma}{\left( 1+\gamma^2 \right)^{1/2}}
$$

for $\lvert\gamma\rvert \ll 1 \ \longrightarrow\ \boxed{\alpha \approx \gamma}$

<u>Changes in Volume</u>

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig11.svg]]

$$
dV = d\bar{X}\cdot\left( d\bar{Y}\times d\bar{Z} \right) \qquad\qquad dv = d\bar{x}\cdot\left( d\bar{y}\times d\bar{z} \right)
$$

$$
\frac{dv}{dV} = \frac{\left( \bar{\bar{F}}d\bar{X} \right)\cdot\left( \bar{\bar{F}}d\bar{Y}\times\bar{\bar{F}}d\bar{Z} \right)}{d\bar{X}\cdot\left( d\bar{Y}\times d\bar{Z} \right)} \ \rightarrow\ \text{determinant of } F \ \text{(Volume ratio)}
$$

$$
J = \det\left( \bar{\bar{F}} \right) = \text{Jacobian} > 0 \qquad \text{also} \quad \det\left( \bar{\bar{C}} \right) = \det\left( \bar{\bar{F}} \right)^2
$$

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig12.svg]]

$$
\bar{\bar{F}} = \begin{bmatrix} \lambda_1 & 0 & 0\\ 0 & \lambda_2 & 0\\ 0 & 0 & \lambda_3 \end{bmatrix} \qquad \det\left( \bar{\bar{F}} \right) = \lambda_1\lambda_2\lambda_3 \qquad \lambda_i = \frac{L^{(i)}}{L_0^{(i)}}
$$

$$
\boxed{\ \det\left( \bar{\bar{F}} \right) = \frac{L^{(1)}L^{(2)}L^{(3)}}{L_0^{(1)}L_0^{(2)}L_0^{(3)}}\ }
$$

$$
\det\left( \bar{\bar{F}} \right) = \frac{\bar{\bar{F}}\bar{a}\cdot\left( \bar{\bar{F}}\bar{b}\times\bar{\bar{F}}\bar{c} \right)}{\bar{a}\cdot\left( \bar{b}\times\bar{c} \right)} \qquad\qquad \bar{a},\bar{b},\bar{c} \rightarrow \left\{ \bar{e}_p,\bar{e}_q,\bar{e}_r \right\}
$$

$$
J = \frac{\bar{\bar{F}}\bar{e}_p\cdot\left( \bar{\bar{F}}\bar{e}_q\times\bar{\bar{F}}\bar{e}_r \right)}{\bar{e}_p\cdot\left( \bar{e}_q\times\bar{e}_r \right)}
$$

$$
\textcolor{red}{\uparrow \quad \bar{e}_p\cdot\left( \bar{e}_q\times\bar{e}_r \right) = \epsilon_{pqr}}
$$

$$
\bar{\bar{F}}\bar{e}_p = F_{ip}\bar{e}_i \qquad F_{ip} = \bar{e}_i\cdot\bar{\bar{F}}\bar{e}_p \qquad \underline{\text{STUDY Components}}
$$

$$
\epsilon_{pqr}\,J = \left( F_{ip}\bar{e}_i \right)\cdot\left( F_{jq}\bar{e}_j\times F_{kR}\bar{e}_r \right)
$$

$$
= F_{ip}F_{jq}F_{kR}\left( \bar{e}_i\cdot\left( \bar{e}_j\times\bar{e}_r \right) \right)
$$

$$
\boxed{\ \text{Thus,}\ \ J\,\epsilon_{pqr} = \epsilon_{ijk}F_{ip}F_{jr}F_{kR}\ }
$$

<u>Changes in Area</u>

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig13.svg]]

$$
d\bar{A} = d\bar{X}\times d\bar{Y} \qquad\qquad d\bar{a} = d\bar{x}\times d\bar{y}
$$

$$
d\bar{A} = dA\cdot\bar{N} \ , \ dA = \frac{\lvert d\bar{X}\times d\bar{Y} \rvert}{\dfrac{d\bar{x}\times d\bar{y}}{\lvert d\bar{x}\times d\bar{y} \rvert}} \qquad\qquad d\bar{a} = da\cdot\bar{n}
$$

$$
da_i = \epsilon_{ijk}\,dx_j\,dy_k = \epsilon_{ijk}\left( F_{jq}dX_q \right)\left( F_{kR}dY_R \right)
$$

$$
da_i = \epsilon_{ijk}F_{jq}F_{kr}\,X_q dY_r
$$

$$
F_{ip}\,da_i = \underbrace{\epsilon_{ijk}F_{ip}F_{jq}F_{kr}}_{J\epsilon_{pqr}}dX_q dY_r
$$

$$
F_{ip}\,da_i = J\,\epsilon_{pqr}\,dX_q\,dY_r
$$

$$
F_{ip}\,da_i = J\left( d\bar{X}\times d\bar{Y} \right) = J\,d\bar{A}
$$

$$
\bar{\bar{F}}^{\mathsf{T}}d\bar{a} = J\left( d\bar{A} \right)
$$

$$
\text{Thus,} \quad \boxed{\ d\bar{a} = J\,\bar{\bar{F}}^{-\mathsf{T}}d\bar{A}\ } \ \rightarrow\ \text{Nanson's Formula}
$$

$$
\frac{da}{dA} = J\left\lvert \bar{\bar{F}}^{-\mathsf{T}}\bar{N} \right\rvert
$$

<span style="color:red">↑ original direction</span>

$$
\bar{n} = \frac{J\bar{\bar{F}}^{-\mathsf{T}}\bar{N}}{\left\lvert J\bar{\bar{F}}^{-\mathsf{T}}\bar{N} \right\rvert} = \frac{\bar{\bar{F}}^{-\mathsf{T}}\bar{N}}{\left\lvert \bar{\bar{F}}^{-\mathsf{T}}\bar{N} \right\rvert}
$$

Back to example:

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig14.svg]]

$$
\bar{\bar{F}}^{-1} = \begin{bmatrix} 1 & -\gamma & 0\\ 0 & 1 & 0\\ 0 & 0 & 1 \end{bmatrix} \qquad \bar{\bar{F}}^{-\mathsf{T}} = \begin{bmatrix} 1 & 0 & 0\\ -\gamma & 1 & 0\\ 0 & 0 & 1 \end{bmatrix}
$$

$$
\frac{da}{dA} = J\left\lvert \bar{\bar{F}}^{-\mathsf{T}}\bar{N} \right\rvert \ \rightarrow\ \begin{bmatrix} 1 & 0 & 0\\ -\gamma & 1 & 0\\ 0 & 0 & 1 \end{bmatrix}\begin{bmatrix} 1\\ 0\\ 0 \end{bmatrix} = \begin{bmatrix} 1\\ -\gamma\\ 0 \end{bmatrix} = \bar{\bar{F}}^{-\mathsf{T}}\bar{N} \ , \ \bar{N} = \bar{e}_1
$$

$$
\frac{da}{dA} = \left( 1+\gamma^2 \right)^{1/2}
$$

$$
\bar{n} = \frac{J\bar{\bar{F}}^{-\mathsf{T}}\bar{N}}{\left\lvert J\bar{\bar{F}}^{-\mathsf{T}}\bar{N} \right\rvert} \ \rightarrow\ \bar{n} = \frac{\left( 1\bar{e}_1 - \gamma\bar{e}_2 \right)}{\left( 1+\gamma^2 \right)^{1/2}}
$$

<u>Summary</u>

$\bar{X}$ - Reference
$\bar{\chi}(\bar{X})$ - Motion

$$
\bar{\bar{F}} = \nabla\bar{\chi} = \frac{\partial \bar{x}}{\partial \bar{X}} = F_{ij} = \frac{\partial x_i}{\partial x_j}
$$

$$
\bar{\bar{C}} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}} \ \rightarrow\ \text{Right-Cauchy Green tensor}
$$

$$
\text{Lengths} \ \rightarrow\ \lambda^2\left( \bar{X},\bar{N} \right) = \bar{N}\cdot\bar{\bar{C}}(X)\bar{N} \ \rightarrow\ \text{stretch}
$$

Angles $\longrightarrow$ $\displaystyle \cos\theta\left(\bar{N},\bar{M}\right) = \frac{\bar{N}\cdot\bar{\bar{C}}\bar{M}}{\left(\bar{N}\cdot\bar{\bar{C}}\bar{N}\right)^{1/2}\left(\bar{M}\cdot\bar{\bar{C}}\bar{M}\right)^{1/2}}$

Volumes $\to$ $\displaystyle \frac{dv}{dV} = J = \det\left(\bar{\bar{F}}\right) \to$ Volume ratio

Areas $\to$ $\ d\bar{a} = J\bar{\bar{F}}^{-T}d\bar{A}$

$$
\frac{da}{dA} = \left| J\bar{\bar{F}}^{-T}\bar{N} \right|
$$

$$
\bar{n} = \frac{\bar{\bar{F}}^{-T}\bar{N}}{\left| \bar{\bar{F}}^{-T}\bar{N} \right|}
$$

<u>Frame indifference</u>

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig15.svg]]

$$
\bar{\bar{F}} = \nabla\bar{\chi}
$$

$$
\bar{\bar{F}}^{*} = \frac{\partial \chi^{*}}{\partial \bar{X}} = \frac{\partial}{\partial \bar{X}}\left( \bar{\bar{Q}}\,\bar{\chi}(\bar{x}) + \bar{c} \right)
$$

$$
\bar{\bar{F}}^{*} = \bar{\bar{Q}}\,\frac{\partial \bar{x}}{\partial \bar{X}} = \bar{\bar{Q}}\bar{\bar{F}} \ \rightarrow\ \text{under a rigid body motion}\ \ \bar{\bar{F}}^{*} = \bar{\bar{Q}}\bar{\bar{F}}
$$

$$
\bar{\bar{C}}^{*} = \bar{\bar{F}}^{*\mathsf{T}}\bar{\bar{F}}^{*}
$$

$$
= \left( \bar{\bar{Q}}\bar{\bar{F}} \right)^{\mathsf{T}}\left( \bar{\bar{Q}}\bar{\bar{F}} \right)
$$

$$
\bar{\bar{C}}^{*} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{Q}}^{\mathsf{T}}\bar{\bar{Q}}\bar{\bar{F}} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}} = \bar{\bar{C}}
$$

### Polar decomposition

$\to$ For $\det\left(\bar{\bar{F}}\right) > 0$, $\bar{\bar{F}}$ admits the unique decomposition:

$$
\bar{\bar{F}} = \bar{\bar{R}}\bar{\bar{U}}
$$

<span style="color:red">↑ rotation ↗ right stretch tensor</span>

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig16.svg]]

$$
\bar{\bar{U}} = \sqrt{\bar{\bar{C}}} = \sqrt{\bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}}}
$$

$$
\bar{\bar{U}}^{2} = \bar{\bar{C}} \ \to\ \bar{\bar{U}}\bar{\bar{U}} = \bar{\bar{C}} \qquad \textcolor{red}{\bar{\bar{U}}\ \text{is symmetric because}\ \bar{\bar{C}}\ \text{is symmetric}}
$$

Is $\bar{\bar{R}}$ a proper rotation?

$$
\bar{\bar{R}} = \bar{\bar{F}}\bar{\bar{U}}^{-1}
$$

$$
\bar{\bar{R}}^{\mathsf{T}}\bar{\bar{R}} = \left( \bar{\bar{F}}\bar{\bar{U}}^{-1} \right)^{\mathsf{T}}\left( \bar{\bar{F}}\bar{\bar{U}}^{-1} \right)
$$

$$
\left( \bar{\bar{R}}^{\mathsf{T}}\bar{\bar{R}} \right)_{ip} = \left( F_{ij}\left( \bar{\bar{U}}^{-1} \right)_{jk} \right)^{\mathsf{T}}\left( F_{kp}\left( U^{-1} \right)_{pq} \right)
$$

$$
= \left( F_{kj}\left( \bar{\bar{U}}^{-1} \right)_{ji} \right)\left( F_{kp}\left( U^{-1} \right)_{pq} \right)
$$

$$
= \left( \bar{\bar{U}}^{-1} \right)_{ji} F_{kj} F_{kp}\left( \bar{\bar{U}}^{-1} \right)_{pq}
$$

$$
= \left( \bar{\bar{U}}^{-1} \right)_{ji}\underbrace{\left( \bar{\bar{F}}^{\mathsf{T}} \right)_{jk} F_{kp}}_{\bar{\bar{C}} = U_{jk}U_{kp}}\left( \bar{\bar{U}}^{-1} \right)_{pq}
$$

$$
\left( \bar{\bar{U}}^{-1} \right)_{ji} U_{jk} U_{kp}\left( U^{-1} \right)_{pq}
$$

$$
\to\ \colorbox{#fff3a0}{$\left( \bar{\bar{U}}^{-1}\bar{\bar{U}} \right)\left( \bar{\bar{U}}\bar{\bar{U}}^{-1} \right) = \bar{\bar{I}}$}
$$

$$
\text{Det}\left( \bar{\bar{R}} \right) = \text{Det}\left( \bar{\bar{F}}\bar{\bar{U}}^{-1} \right) = \frac{\text{Det}\left( \bar{\bar{F}} \right)}{\text{Det}\left( \bar{\bar{U}}^{-1} \right)}
$$

↓

$\text{Det}\left( \bar{\bar{R}} \right) = 1$ so, $\bar{\bar{R}}$ is a rotation tensor

Given this…

$$
\lambda^{2}\left( \bar{N} \right) = \bar{N}\cdot\bar{\bar{C}}\bar{N} \qquad \bar{\bar{C}} = \bar{\bar{U}}\bar{\bar{U}}
$$

$$
= \left( \bar{N}\cdot\bar{\bar{U}}\bar{\bar{U}}\bar{N} \right)
$$

$$
= \left( \bar{\bar{U}}^{\mathsf{T}}\bar{N}\cdot\bar{\bar{U}}\bar{N} \right)
$$

$$
= \left( \bar{\bar{U}}\bar{N} \right)\cdot\left( \bar{\bar{U}}\bar{N} \right)
$$

$$
\lambda^{2} = \left( \bar{\bar{U}}\bar{N} \right)\cdot\left( \bar{\bar{U}}\bar{N} \right) = \left| \bar{\bar{U}}\bar{N} \right|^{2}
$$

$$
\boxed{\ \lambda = \left| \bar{\bar{U}}\bar{N} \right|\ } \qquad \longleftarrow \ \text{Hence "stretch tensor"}
$$

### Strain

$\to$ For any direction $\bar{N}$, we have defined stretch $\lambda(\bar{N})$

$\to$ tensorial definition of stretch, $\bar{\bar{C}}$ or $\bar{\bar{U}}$

$\to$ How do we define strain?

$$
\varepsilon = \frac{\text{change in length}}{\text{Length}} = \frac{\left| d\bar{x} \right| - \left| d\bar{X} \right|}{\left| d\bar{X} \right|} = \underbrace{\frac{\left| d\bar{x} \right|}{\left| d\bar{X} \right|}}_{\text{stretch}} - 1
$$

$$
\varepsilon = \lambda - 1
$$

Since $\bar{\bar{U}}$ encodes stretches

$$
\bar{\bar{\varepsilon}}^{B} = \bar{\bar{U}} - \bar{\bar{I}} \ \longrightarrow\ \text{Biot strain}
$$

General definition:

$$
\varepsilon = f(F)
$$

$$
\varepsilon = 0 \ \text{when}\ \bar{\bar{F}} = \bar{\bar{I}}
$$

$\varepsilon$ is frame indifferent $\to$ $f(F) = f\left( \bar{\bar{Q}}\bar{\bar{F}} \right) \to f(\bar{\bar{C}}),\, f(\bar{\bar{U}})$

We require that they linearize to the infinitesimal strain tensor.

$$
\bar{\bar{\varepsilon}} = f(\bar{\bar{F}}) = \text{Sym}\left( \nabla\bar{u} \right), \ \text{for small}\ \left( \nabla\bar{u} \right) \to \bar{u}\ \text{is displacement}
$$

$\bar{\bar{\epsilon}} \to$ infinitesimal strain

<u>Green Strain</u>

$$
\bar{\bar{E}} = \tfrac{1}{2}\left( \bar{\bar{C}} - \bar{\bar{I}} \right)
$$

$$
E_{11} = \bar{e}_1\cdot\tfrac{1}{2}\left( \bar{\bar{C}} - \bar{\bar{I}} \right)\bar{e}_1
$$

$$
E_{11} = \tfrac{1}{2}\left( \bar{e}_1\cdot\bar{\bar{C}}\bar{e}_1 - \bar{e}_1\bar{e}_1 \right)
$$

$$
E_{11} = \tfrac{1}{2}\left( C_{11} - 1 \right)
$$

$$
E_{11} = \tfrac{1}{2}\left( \lambda^{2}(\bar{e}_1) - 1 \right) = \frac{1}{2}\left( \frac{\left| d\bar{x} \right|^{2}}{\left| d\bar{X} \right|^{2}} - 1 \right) = \frac{1}{2}\left( \frac{\left| d\bar{x} \right|^{2} - \left| d\bar{X} \right|^{2}}{\left| d\bar{X} \right|} \right)
$$

### Hencky strain

$$
\bar{\bar{\varepsilon}}^{H} = \ln\left( \bar{\bar{U}} \right)
$$

### Seth-Hill Family

"General family"

$$
\bar{\bar{\varepsilon}}^{m} = \frac{1}{m}\left( \bar{\bar{U}}^{m} - \bar{\bar{I}} \right), \quad m \in \mathbb{R},\ m \neq 0
$$

$$
\bar{\bar{\varepsilon}}^{0} = \lim_{m\to 0}\bar{\bar{\varepsilon}}^{m} = \ln\left( \bar{\bar{U}} \right) \ \to\ \text{Hencky}
$$

$$
\bar{\bar{\varepsilon}}^{1} = \bar{\bar{U}} - 1 \ \to\ \text{Biot}
$$

$$
\bar{\bar{\varepsilon}}^{2} = \tfrac{1}{2}\left( \bar{\bar{U}}^{2} - \bar{\bar{I}} \right) = \tfrac{1}{2}\left( \bar{\bar{C}} - \bar{\bar{I}} \right) \ \to\ \text{Green}
$$

### Components of Green strain

$$
\begin{aligned}
E_{11} &= \bar{e}_1\cdot\bar{\bar{E}}\bar{e}_1 = \tfrac{1}{2}\left( \lambda\left( \bar{e}_1 \right)^{2} - 1 \right)\\
E_{22} &= \bar{e}_2\cdot\bar{\bar{E}}\bar{e}_2 = \tfrac{1}{2}\left( \lambda\left( \bar{e}_2 \right)^{2} - 1 \right)\\
&\ \vdots\\
&\ \text{etc}
\end{aligned}
$$

Diagonal components encode Axial strains

$$
\cos(\theta)\left( \bar{e}_1, \bar{e}_2 \right) = \frac{C_{12}}{\left( C_{11} \right)^{1/2}\left( C_{22} \right)^{1/2}} \qquad \bar{\bar{E}} = \tfrac{1}{2}\left( \bar{\bar{C}} - \bar{\bar{I}} \right) \qquad \bar{\bar{C}} = 2\bar{\bar{E}} + \bar{\bar{I}}
$$

$$
C_{11} = 2E_{11} + 1 \qquad C_{12} = 2E_{12}
$$

$$
C_{22} = 2E_{22} + 1
$$

$$
\cos(\theta)\left( \bar{e}_1, \bar{e}_2 \right) = \frac{2E_{12}}{\left( 2E_{11} + 1 \right)^{1/2}\left( 2E_{22} + 1 \right)^{1/2}}
$$

Thus, off-diagonal encode angle changes…

### Small deformations

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig17.svg]]

$\bar{\chi}(\bar{X})$ - Motion

$$
\bar{u} = \bar{\chi}(\bar{X}) - \bar{x}
$$

$$
\bar{\bar{F}} = \nabla\bar{\chi}
$$

$$
= \frac{\partial \bar{\chi}}{\partial \bar{X}} = \frac{\partial}{\partial \bar{X}}\left( \bar{u} + \bar{X} \right) = \frac{\partial \bar{u}}{\partial \bar{X}} + \bar{\bar{I}}
$$

$$
\bar{\bar{F}} = \nabla\bar{u} + \bar{\bar{I}}
$$

$$
\bar{\bar{H}} = \nabla\bar{u} \ \to\ \text{displacement gradient}
$$

$\to$ A deformation is set to be infinitesimal when

$$
\left| \bar{\bar{H}} \right| = \left| \bar{\bar{F}} - \bar{\bar{I}} \right| \ll 1
$$

$\to$ If this is true, we can neglect quadratic terms in $\bar{\bar{H}}$

$$
\bar{\bar{E}} = \tfrac{1}{2}\left( \bar{\bar{C}} - \bar{\bar{I}} \right)
$$

What is this if we linearize, ignore "$\bar{\bar{H}}^{2}$"

<u>Motion</u>

$$
\bar{x} = \bar{\chi}(\bar{X})
$$

$$
\bar{\bar{F}} = \bar{\nabla}\bar{x} = \frac{\partial \bar{x}}{\partial \bar{X}}
$$

$$
\bar{\bar{C}} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}}
$$

$$
\bar{\bar{F}} = \bar{\bar{R}}\bar{\bar{U}}
$$

$$
\bar{\bar{U}} = \sqrt{\bar{\bar{C}}}
$$

$$
\bar{\bar{E}} = \tfrac{1}{2}\left( \bar{\bar{C}} - \bar{\bar{I}} \right)
$$

$$
\bar{\bar{\varepsilon}}^{B} = \bar{\bar{U}} - \bar{\bar{I}}
$$

$$
\bar{\bar{\varepsilon}}^{H} = \ln\left( \bar{\bar{U}} \right)
$$

$$
\lambda^{2}\left( \bar{N} \right) = \bar{N}\cdot\bar{\bar{C}}\bar{N}
$$

$$
\cos(\theta)\left( \bar{N}, \bar{M} \right) = \frac{\bar{N}\cdot\bar{\bar{C}}\left( \bar{N} \right)}{\lambda(\bar{N})\cdot\lambda(\bar{M})} \qquad \frac{dv}{dV_0} = J = \text{Det}\left( \bar{\bar{F}} \right)
$$

### Small deformations

$$
\bar{x} = \bar{X} + \bar{u}
$$

$$
\bar{\bar{F}} = \bar{\nabla}\bar{x} = \bar{\nabla}\left( \bar{X} + \bar{u} \right) = \bar{\bar{I}} + \bar{\nabla}\bar{u}
$$

$H = \nabla\bar{u} \to$ Displacement Gradient.

A deformation is said to be infinitesimal when $\left| \bar{\bar{H}} \right| = \left| \nabla\bar{u} \right| \ll 1$

<u>Infinitesimal strain tensor</u>

$$
\bar{\bar{\epsilon}} = \text{sym}\left( \nabla\bar{u} \right) = \text{sym}\left( \bar{\bar{H}} \right)
$$

$$
= \tfrac{1}{2}\left( \bar{\bar{H}} + \bar{\bar{H}}^{\mathsf{T}} \right)
$$

$$
\epsilon_{ij} = \frac{1}{2}\left( \frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i} \right)
$$

$$
\bar{\bar{C}} = \bar{\bar{F}}^{\mathsf{T}}\bar{\bar{F}} = \left( \bar{\bar{I}} + \bar{\bar{H}} \right)^{\mathsf{T}}\left( \bar{\bar{I}} + \bar{\bar{H}} \right)
$$

$$
\bar{\bar{C}} = \left( \bar{\bar{I}} + \bar{\bar{H}}^{\mathsf{T}} + \bar{\bar{H}} + \cancel{\bar{\bar{H}}^{\mathsf{T}}\bar{\bar{H}}} \right) \ \ \textcolor{red}{\text{o higher order}}
$$

$$
\boxed{\bar{\bar{C}} \approx \left( \bar{\bar{I}} + \bar{\bar{H}}^{\mathsf{T}} + \bar{\bar{H}} \right) \approx \bar{\bar{I}} + 2\bar{\bar{\epsilon}}}
$$

$$
\bar{\bar{E}} = \tfrac{1}{2}\left( \bar{\bar{C}} - \bar{\bar{I}} \right)
$$

$$
\bar{\bar{E}} \approx \tfrac{1}{2}\left( \bar{\bar{I}} + 2\bar{\bar{\epsilon}} - \bar{\bar{I}} \right)
$$

$$
\boxed{\text{Thus,}\ \bar{\bar{E}} \approx \bar{\bar{\epsilon}}}
$$

$$
\bar{\bar{U}} = \left( \bar{\bar{C}} \right)^{1/2}
$$

$$
\bar{\bar{U}} = \left( \bar{\bar{I}} + 2\bar{\bar{\epsilon}} \right)^{1/2}
$$

$$
\bar{\bar{U}} = \bar{\bar{I}} + \tfrac{1}{2}\left( 2\bar{\bar{\epsilon}} \right)
$$

$$
\bar{\bar{U}} = \bar{\bar{I}} + \bar{\bar{\epsilon}}
$$

$$
\bar{\bar{\varepsilon}}^{B} = \bar{\bar{U}} - \bar{\bar{I}}
$$

$$
\boxed{\bar{\bar{\varepsilon}}^{B} \approx \left( \bar{\bar{I}} + \bar{\bar{\epsilon}} \right) - \bar{\bar{I}} = \bar{\bar{\epsilon}}}
$$

$$
\bar{\bar{\varepsilon}}^{H} = \ln\left( \bar{\bar{U}} \right)
$$

$$
\bar{\bar{\varepsilon}}^{H} = \ln\left( \bar{\bar{I}} + \bar{\bar{\epsilon}} \right)
$$

$$
\approx \bar{\bar{I}} + \bar{\bar{\epsilon}} - \bar{\bar{I}}
$$

$$
\boxed{\bar{\bar{\varepsilon}}^{H} \approx \epsilon}
$$

<u>Linearize Stretch</u>

$$
\lambda^{2}\left( \bar{N} \right) = \bar{N}\cdot\bar{\bar{C}}\cdot\bar{N}
$$

$$
\approx \bar{N}\left( \bar{\bar{I}} + 2\bar{\bar{\epsilon}} \right)\bar{N}
$$

$$
\lambda^{2}(\bar{N}) \approx \left( 1 + 2\bar{N}\bar{\bar{\epsilon}}\bar{N} \right)
$$

$$
\lambda(\bar{N}) = \left( 1 + 2\bar{N}\bar{\bar{\epsilon}}\bar{N} \right)^{1/2}
$$

$$
\lambda(\bar{N}) = 1 + \underbrace{\bar{N}\bar{\bar{\epsilon}}\bar{N}}_{\textcolor{red}{\epsilon_N}} \qquad \longrightarrow \qquad \epsilon_N = \bar{N}\bar{\bar{\epsilon}}\bar{N} = \lambda(\bar{N}) - 1 = \frac{\left| d\bar{x} \right|}{\left| d\bar{X} \right|} - 1
$$

$$
= \frac{\left| d\bar{x} \right| - \left| d\bar{X} \right|}{\left| d\bar{X} \right|}
$$

Thus the components of $\epsilon_N$ encode:

$$
\epsilon_N = \frac{\text{"change in length"}}{\text{"og length"}}
$$

$$
\bar{e}_1 \cdot \bar{\bar{\epsilon}}\, \bar{e}_1 = \epsilon_{11} \qquad \text{thus,} \quad \begin{Bmatrix} \epsilon_{11} \\ \epsilon_{22} \\ \epsilon_{33} \end{Bmatrix} = \text{Axial strains}
$$

### Volume

$$
\frac{dv}{dV_0} = J = \det\left( \bar{\bar{F}} \right) = \det\left( \bar{\bar{U}} \right)
$$

$$
\bar{\bar{U}} \approx \bar{\bar{I}} + \bar{\bar{\epsilon}} \qquad \textcolor{red}{\bar{\bar{U}}\ \text{has eigenvalues}\ \lambda_1, \lambda_2, \lambda_3}
$$

$$
\frac{dv}{dV_0} = \lambda_1 \lambda_2 \lambda_3 \qquad
\begin{aligned}
\lambda_1 &\approx 1 + \epsilon_1 \\
\lambda_2 &\approx 1 + \epsilon_2 \\
\lambda_3 &\approx 1 + \epsilon_3
\end{aligned}
$$

$$
\frac{dv}{dV_0} \approx 1 + \epsilon_1 + \epsilon_2 + \epsilon_3 + \textcolor{red}{\cancel{\epsilon_1 \epsilon_2}} + \textcolor{red}{\cancel{\epsilon_2 \epsilon_3}} + \ldots
$$

<span style="color:red">Higher order</span>

$$
\frac{dv}{dV_0} \approx 1 + \epsilon_1 + \epsilon_2 + \epsilon_3
$$

$$
\frac{dv}{dV_0} \approx 1 + \text{trace}\left( \bar{\bar{\epsilon}} \right)
$$

$$
\text{Tr}\left( \bar{\bar{\epsilon}} \right) \approx \frac{dv}{dV_0} - 1 \approx \frac{dv - dV_0}{dV_0}
$$

Thus $\text{tr}\left( \bar{\bar{\epsilon}} \right)$ encodes

$$
\frac{\text{"change of volume"}}{\text{"og volume"}}
$$

### Change in Angle

$$
\cos(\theta)\left( \bar{N}, \bar{M} \right) = \frac{\bar{N} \cdot \bar{\bar{C}} \bar{N}}{\lambda(\bar{N})\, \lambda(\bar{M})}
$$

$$
\bar{\bar{C}} \approx \bar{\bar{I}} + 2\bar{\bar{\epsilon}}
$$

$$
\left( 1 + \epsilon_N \right)\left( 1 + \epsilon_M \right) \approx 1 + \epsilon_N + \epsilon_M + \textcolor{red}{\cancel{\epsilon_N \epsilon_M}}
$$

$$
\cos\theta = \frac{\bar{N} \cdot \left( \bar{\bar{I}} + 2\bar{\bar{\epsilon}} \right) \bar{M}}{1 + \epsilon_N + \epsilon_M} = \bar{N} \cdot \left( \bar{\bar{I}} + 2\bar{\bar{\epsilon}} \right) \bar{M}\left( 1 + \epsilon_N + \epsilon_M \right)^{-1}
$$

$$
= \bar{N} \cdot \left( \bar{\bar{I}} + 2\bar{\bar{\epsilon}} \right) \bar{M}\left( 1 - \epsilon_N - \epsilon_M \right)
$$

$$
= \bar{N} \cdot \left( \bar{\bar{I}} + 2\bar{\bar{\epsilon}} \right) \bar{M} - \left( \epsilon_N + \epsilon_M \right) \bar{N} \left( \bar{\bar{I}} + 2\bar{\bar{\epsilon}} \right) \bar{M}
$$

$$
- \underbrace{\left( \epsilon_N + \epsilon_M \right) 2\bar{N} \cdot \bar{\bar{\epsilon}} \bar{N}}_{\textcolor{red}{\approx 0}}
$$

Thus,

$$
\cos(\theta)\left( \bar{N}, \bar{M} \right) = \left( 1 - \epsilon_N - \epsilon_M \right) \bar{N} \cdot \bar{M} + \bar{N} \cdot 2\bar{\bar{\epsilon}} \bar{M}
$$

Specialize to $\left\{ \bar{N}, \bar{M} \right\} \rightarrow \left\{ \bar{e}_1, \bar{e}_2, \bar{e}_3 \right\}$

$$
\cos(\theta)\left( \bar{e}_1, \bar{e}_2 \right) = 2\bar{e}_1 \cdot \bar{\bar{\epsilon}} \bar{e}_2 = 2\epsilon_{12} \qquad \cos(\theta) = \sin(\alpha)
$$

Further, $\sin(\alpha)\left( \bar{e}_1, \bar{e}_2 \right) \approx 2\epsilon_{12}$

↓

$$
\boxed{\ \alpha\left( \bar{e}_1, \bar{e}_2 \right) \approx 2\epsilon_{12}\ }
$$

Note: off diagonal components are shear strain (Angle changes)

Engineering shear strain

$$
\gamma_{ij} = 2\epsilon_{ij}
$$

Thus,

$$
\boxed{\ \alpha\left( \bar{e}_i, \bar{e}_j \right) = \gamma_{ij}\ }
$$

### Volumetric - deviatoric split

$$
\bar{\bar{\epsilon}} = \underbrace{\bar{\bar{\epsilon}}'}_{\text{dev}} + \underbrace{\tfrac{1}{3}\text{Tr}\left( \bar{\bar{\epsilon}} \right)\bar{\bar{I}}}_{\text{spherical}}
$$

- spherical part: $\tfrac{1}{3}\text{Tr}\left( \bar{\bar{\epsilon}} \right)\bar{\bar{I}}$ encodes volume changes
- $\epsilon'$ → strain deviator encodes shape changes.

### Symmetric Skew split of $\bar{\bar{H}}$

$$
\bar{\bar{H}} = \text{Sym}\left( \bar{\bar{H}} \right) + \text{Skew}\left( \bar{\bar{H}} \right)
$$

$$
\bar{\bar{\epsilon}} = \text{sym}\left( \bar{\bar{H}} \right) \qquad \longrightarrow \text{infinitesimal strain}
$$

$$
\bar{\bar{\omega}} = \text{skew}\left( \bar{\bar{H}} \right) = \tfrac{1}{2}\left( \bar{\bar{H}} - \bar{\bar{H}}^{\mathsf{T}} \right) \rightarrow \text{infinitesimal Rotation}
$$

### Polar Decomposition

$$
\bar{\bar{F}} = \bar{\bar{R}}\bar{\bar{U}} \qquad \bar{\bar{R}} = \bar{\bar{F}}\bar{\bar{U}}^{-1} \qquad \bar{\bar{U}} \approx \bar{\bar{I}} + \bar{\bar{\epsilon}}
$$

$$
\bar{\bar{U}}^{-1} = \left( \bar{\bar{I}} + \bar{\bar{\epsilon}} \right)^{-1} = \left( \bar{\bar{I}} - \bar{\bar{\epsilon}} \right)
$$

$$
\bar{\bar{R}} = \left( \bar{\bar{I}} + \bar{\bar{H}} \right)\left( \bar{\bar{I}} - \bar{\bar{\epsilon}} \right)
$$

$$
= \left( \bar{\bar{I}} + \bar{\bar{\epsilon}} + \bar{\bar{\omega}} \right)\left( \bar{\bar{I}} - \bar{\bar{\epsilon}} \right)
$$

$$
\approx \bar{\bar{I}} + \bar{\bar{\epsilon}} + \bar{\bar{\omega}} - \bar{\bar{\epsilon}} + \ldots \text{etc})
$$

$$
\boxed{\ \bar{\bar{R}} \approx \bar{\bar{I}} + \bar{\bar{\omega}}\ }
$$

### Small deformations recap

$$
\left| \bar{\bar{H}} \right| = \left| \nabla \bar{u} \right| \ll 1 \ \longrightarrow \ \text{Key assumption}
$$

$$
\bar{\bar{H}} = \bar{\bar{F}} - \bar{\bar{I}} \qquad \longrightarrow \ \left| \bar{\bar{H}} \right| = \sqrt{\bar{\bar{H}} : \bar{\bar{H}}}
$$

$$
\bar{\bar{\epsilon}} = \text{sym}\left( \nabla \bar{u} \right) \qquad \bar{\omega} = \text{skew}\left( \nabla \bar{u} \right)
$$

$$
\lambda(\bar{N}) = 1 + \bar{N} \cdot \bar{\bar{\epsilon}} \bar{N} = \epsilon_N
$$

$$
\frac{\Delta V}{V_0} = \text{trace}\left( \bar{\epsilon} \right)
$$

$$
\cos(\theta)\left( \bar{N}, \bar{M} \right) = 2\bar{N} \cdot \bar{\bar{\epsilon}} \bar{M} + \left( \bar{N} \cdot \bar{M} \right)\left( 1 - \left( \epsilon_N - \epsilon_M \right) \right)
$$

### Example:

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig18.svg]]

$$
\mathcal{B} = \left\{ 0 \leq X_1, X_2, X_3 \leq 1 \right\}
$$

$$
\bar{\chi} = X_1\left( 1 + \alpha X_2 \right)\bar{e}_1 + \left( X_2 + \beta X_1^{\,2} \right)\bar{e}_2 + X_3 \bar{e}_3
$$

Find: $\bar{\bar{F}},\ \bar{\bar{C}},\ \bar{\bar{E}},\ \bar{u},\ \nabla\bar{u},\ \bar{\epsilon},\ \dfrac{\Delta V}{V_0}$

$$
\bar{\bar{F}} = \nabla\chi = \frac{\partial \chi}{\partial X} = \begin{bmatrix} 1 + \alpha X_2 & \alpha X_1 & 0 \\ 2\beta X_1 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}
$$

$$
\bar{\bar{C}} = \bar{\bar{F}}^{\mathsf{T}} \bar{\bar{F}} = \begin{bmatrix} 1 + \alpha X_2 & 2\beta X_1 & 0 \\ \alpha X_1 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix} \begin{bmatrix} 1 + \alpha X_2 & \alpha X_1 & 0 \\ 2\beta X_1 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}
$$

$$
= \begin{bmatrix} \left( 1 + \alpha X_2 \right)^2 + \left( \alpha X_1 \right)^2 & \alpha X_1 \left( 1 + \alpha X_2 \right) + 2\beta X_1 & 0 \\ \bullet & \left( \alpha X_1 \right)^2 + 1 & 0 \\ \text{Sym} & \bullet & 1 \end{bmatrix}
$$

$$
\bar{\bar{E}} = \frac{1}{2} \begin{bmatrix} \left( \alpha X_2 \right)^2 + 2\alpha X_2 + \left( 2\beta X_1 \right)^2 & X_1 \left[ 2\beta + \alpha + \alpha^2 X_2 \right] & 0 \\ \bullet & \left( \alpha X_1 \right)^2 & 0 \\ \text{Sym} & \bullet & 0 \end{bmatrix}
$$

$$
\bar{u} = \bar{\chi} - \bar{X} = \alpha X_1 X_2 \bar{e}_1 + \beta X_1^{\,2} \bar{e}_2
$$

$$
\bar{\bar{H}} = \bar{\bar{F}} - \bar{\bar{I}} = \begin{bmatrix} \alpha X_2 & \alpha X_1 & 0 \\ 2\beta X_1 & 0 & 0 \\ 0 & 0 & 0 \end{bmatrix}
\qquad
\left| \bar{\bar{H}} \right| = \sqrt{\bar{\bar{H}} : \bar{\bar{H}}} = \sqrt{\left( \alpha X_2 \right)^2 + \left( \alpha X_1 \right)^2 + \left( 2\beta X_1 \right)^2}
$$

<span style="color:red">plug in greatest bound (1)</span>

$$
\left| \bar{\bar{H}} \right| = 2\alpha^2 + 4\beta^2 \approx 0 \qquad \alpha, \beta \ll 1
$$

$$
\bar{\bar{\epsilon}} = \text{Sym}\left( \bar{\bar{H}} \right) = \frac{1}{2}\left( \bar{\bar{H}} + \bar{\bar{H}}^{\mathsf{T}} \right) = \frac{1}{2} \begin{bmatrix} 2\alpha X_2 & \left( \alpha + 2\beta \right) X_1 & 0 \\ \left( \alpha + 2\beta \right) X_1 & 0 & 0 \\ 0 & 0 & 0 \end{bmatrix}
$$

$$
\underset{\lim \left| \bar{\bar{H}} \right| \ll 1}{\bar{\bar{\epsilon}}} = \frac{1}{2} \begin{bmatrix} 2\alpha X_2 & \left( 2\beta + \alpha \right) X_1 & 0 \\ \bullet & 0 & 0 \\ \text{Sym} & \bullet & 0 \end{bmatrix}
\qquad \textcolor{red}{\text{quadratic terms approximate to zero because}\ \alpha, \beta \rightarrow 0}
$$

<span style="color:#1a56db">Both strain Methods Match… IMPortant!!</span>

$$
J = \frac{V}{V_0} = 1 + \alpha X_2 - 2\alpha\beta X_1^{\,2} \ \rightarrow \ \frac{\Delta V}{V_0} = \alpha X_2 - 2\alpha\beta X_1^{\,2} \ \left[ \text{finite} \right]
$$

$$
\frac{\Delta V}{V_0} = \text{tr}\left( \bar{\bar{\epsilon}} \right) = \alpha X_2
$$

$$
\bar{N} = \frac{1}{\sqrt{2}}\left( \bar{e}_1 + \bar{e}_2 \right) \qquad \lambda^2(\bar{N}) = \bar{N} \cdot \bar{\bar{C}} \bar{N}
$$

$$
1 + \bar{N} \cdot \bar{\bar{\epsilon}} \bar{N} = \lambda(\bar{N}) \quad \text{(infinitesimal)}
$$

$$
\bar{N} \cdot \bar{\bar{C}} \bar{N}
$$

$$
\frac{1}{\sqrt{2}}\left( \bar{e}_1 + \bar{e}_2 \right) \cdot \bar{\bar{C}} \left( \frac{1}{\sqrt{2}}\left( \bar{e}_1 + \bar{e}_2 \right) \right)
$$

$$
\frac{1}{2}\left[ \bar{e}_1 \bar{\bar{C}} \bar{e}_1 + 2\bar{e}_1 \bar{\bar{C}} \bar{e}_2 + \bar{e}_2 \bar{\bar{C}} \bar{e}_2 \right]
$$

↓

$$
= \frac{1}{2}\left( C_{11} + 2C_{12} + C_{22} \right) = \lambda^2(\bar{N})
$$

### Example:

$$
\bar{\chi} = X_1 \bar{e}_1 + X_2 \bar{e}_2 + \left( X_3 + \alpha X_1 + \alpha X_2 \right) \bar{e}_3
$$

$$
\bar{\bar{F}} = \nabla\chi = \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ \alpha & \alpha & 1 \end{bmatrix} \qquad \textcolor{red}{\text{Homogenous deformation}}
$$

$$
\frac{V}{V_0} = J = \det\left( \bar{\bar{F}} \right) = 1 \qquad \text{So, No volume change}
$$

$$
\bar{\bar{E}} = \frac{1}{2}\left( \bar{\bar{C}} - \bar{\bar{I}} \right) = \frac{1}{2}\left( \bar{\bar{F}}^{\mathsf{T}} \bar{\bar{F}} - \bar{\bar{I}} \right)
$$

$$
= \frac{1}{2}\left( \begin{bmatrix} 1 & 0 & \alpha \\ 0 & 1 & \alpha \\ 0 & 0 & 1 \end{bmatrix} \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ \alpha & \alpha & 1 \end{bmatrix} - \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix} \right)
$$

$$
\bar{\bar{E}} = \frac{1}{2} \begin{bmatrix} \alpha^2 & \alpha^2 & \alpha \\ \bullet & \alpha^2 & \alpha \\ \text{Sym} & \bullet & 0 \end{bmatrix}
$$

$$
\lambda^2(\bar{N}) = \bar{N} \cdot \bar{\bar{C}} \bar{N}
$$

$$
\lambda^2(\bar{e}_2) = \bar{e}_2 \cdot \bar{\bar{C}} \bar{e}_2 = C_{22} = 1 + \alpha^2
$$

$$
\lambda(\bar{e}_2) = \sqrt{1 + \alpha^2}
$$

$$
\cos(\theta)\left( \bar{e}_2, \bar{e}_3 \right) = \frac{\bar{e}_2 \cdot \bar{\bar{C}} \bar{e}_3}{\lambda(\bar{e}_2)\, \lambda(\bar{e}_3)} = \frac{C_{23}}{\sqrt{C_{22}}\, \sqrt{C_{33}}} = \frac{\alpha}{\sqrt{1 + \alpha^2}}
$$

$$
\bar{u} = \bar{\chi} - \bar{X} = \left( \alpha X_1 + \alpha X_2 \right) \bar{e}_3
$$

$$
\bar{\bar{\epsilon}} = \text{sym}\left( \nabla\bar{u} \right) = \frac{1}{2}\left( \bar{\bar{H}} + \bar{\bar{H}}^{\mathsf{T}} \right)
$$

$$
\bar{\bar{H}} = \nabla\bar{u} = \begin{bmatrix} 0 & 0 & 0 \\ 0 & 0 & 0 \\ \alpha & \alpha & 0 \end{bmatrix}
$$

$$
\bar{\bar{\epsilon}} = \frac{1}{2} \begin{bmatrix} 0 & 0 & \alpha \\ 0 & 0 & \alpha \\ \alpha & \alpha & 0 \end{bmatrix} \qquad \left| \bar{\bar{H}} \right| = \sqrt{2\alpha^2} \ll 1 \ \rightarrow \ \alpha\sqrt{2} \ll 1
$$

For eigenspace…

$$
\det\left( \bar{\bar{\epsilon}} - \lambda\bar{\bar{I}} \right) = 0
$$

$$
\det \begin{bmatrix} -\lambda & 0 & \tfrac{\alpha}{2} \\ 0 & -\lambda & \tfrac{\alpha}{2} \\ \tfrac{\alpha}{2} & \tfrac{\alpha}{2} & -\lambda \end{bmatrix} = 0 = -\lambda\left( \lambda^2 - \tfrac{\alpha^2}{4} \right) + \tfrac{\alpha}{2}\left( \tfrac{\alpha}{2}\lambda \right) = 0
$$

$$
= \lambda\left( \tfrac{\alpha^2}{4} + \tfrac{\alpha^2}{4} - \lambda^2 \right) = 0
$$

$$
= \lambda\left( \tfrac{\alpha^2}{2} - \lambda^2 \right) = 0 \ \rightarrow \ \lambda = \left\{ 0, \pm\tfrac{\alpha}{\sqrt{2}} \right\}
$$

$$
\begin{bmatrix} -\tfrac{\alpha}{\sqrt{2}} & 0 & \tfrac{\alpha}{2} \\ 0 & -\tfrac{\alpha}{\sqrt{2}} & \tfrac{\alpha}{2} \\ \tfrac{\alpha}{2} & \tfrac{\alpha}{2} & -\tfrac{\alpha}{\sqrt{2}} \end{bmatrix} \begin{Bmatrix} V_1 \\ V_2 \\ V_3 \end{Bmatrix} = \begin{Bmatrix} 0 \\ 0 \\ 0 \end{Bmatrix}
$$

Find $V$ to find direction of Max tensile strain.

### Balance Laws:

→ Kinematics alone does not predict how the body deforms.

↓ Laws

1) Mass balance
2) linear & angular momentum
3) Balance of Energy
4) Entropy imbalance.

### Balance of Mass

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig19.svg]]

$$
m_0(E_0) = m(E)
$$

<u>Densities</u>

$$
\rho_0 = \frac{dm_0}{dV_0} \qquad , \qquad \rho = \frac{dm}{dv}
$$

$$
\int_{E_0} \rho_0\, dV_0 = \int_{E} \rho\, dv
$$

Recall, $J = \det\left( \bar{\bar{F}} \right) = \dfrac{dv}{dV_0} \ \rightarrow \ dv = J\, dV_0$

$$
\int_{E_0} \rho_0\, dV_0 = \int_{E_0} \rho J\, dV_0
$$

$$
\int_{E_0} \left( \rho_0 - \rho J \right) dV_0 = 0 \qquad \textcolor{red}{\text{Must hold for all}\ E_0}
$$

Thus, $\rho_0 = \rho J$

### Linear and Angular momentum

$$
\bar{L}(B) = \int_B \dot{\bar{x}}\, dm = \int_B \rho \dot{\bar{x}}\, dv
$$

$$
\frac{D}{Dt} \int_B \dot{\bar{x}} \rho\, dv = f_{\text{external}} \qquad \text{Possible external forces:}
$$

1) body forces: $\bar{b}$ (per unit mass)
2) Surface force: $\bar{t}$ (per unit area)

$$
\frac{D}{Dt} \int_B \dot{\bar{x}} \rho\, dv = \int_B \bar{b}\, \rho\, dv + \int_S \bar{t}\, dA
$$

$$
\frac{D}{Dt}\int_{B} \dot{\bar{x}}\,\rho\,dv = \frac{D}{Dt}\int_{B_0} \dot{\bar{x}}\,\frac{\rho_0}{\textcolor{red}{\cancel{J}}}\,\textcolor{red}{\cancel{J}}\,dV_0 = \int_{B_0} \frac{D}{Dt}\left( \dot{\bar{x}}\,\rho_0 \right) dV_0
$$

$$
= \int_{B_0} \ddot{\bar{x}}\,\rho_0\,dV_0 = \int_{B} \ddot{\bar{x}}\,\rho\,dv
$$

Global momentum Balance...

$$
\int_{B} \ddot{\bar{x}}\,\rho\,dv = \int_{B} \bar{f}\,\rho\,dv + \int_{S} \bar{t}\,dA
$$

### Cauchy's stress principle

→ Principle: Internal interactions across a surface can be represented by a distribution of tractions in the current configuration

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig20.svg]]

For any sub-body

$$
\int_{\mathcal{E}} \ddot{\bar{x}}\,\rho\,dv = \int_{\mathcal{E}} \bar{b}\,\rho\,dv + \int_{\partial\mathcal{E}} \bar{t}(\bar{x},\hat{n})\,dA
$$

### Pillbox construction

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig21.svg]]

$$
\int_{\mathcal{E}} \rho\left( \ddot{\bar{x}} - \bar{b} \right) dv = \int_{\partial\mathcal{E}^+} \bar{t}(\hat{n})\,dA + \int_{\partial\mathcal{E}^-} \bar{t}(-\hat{n})\,dA + \int_{\partial\mathcal{E}^b} \bar{t}\,dA
$$

Let $h \to 0$

$$
0 = \int_{\partial\mathcal{E}^+} \bar{t}(\hat{n})\,dA + \int_{\partial\mathcal{E}^-} \bar{t}(-\hat{n})\,dA
$$

Let $R \to 0$

$$
\bar{t}(\bar{x},\hat{n}) = -\bar{t}(\bar{x},\hat{n})
$$

Thus, tractions acting on opposite sides of the same internal surface are equal but opposite.

### Cauchy's tetrahedron

![[AE6114 - fundamentals of solid mechanics/refined notes/diagrams/2026-10-06 fig22.svg]]

$$
A_1 = A_n \cdot n_1 \qquad A_2 = A_n \cdot n_2 \qquad A_3 = A_3 \cdot n_3
$$

$$
\int_{\mathcal{E}} \rho\left( \ddot{\bar{x}} - \bar{b} \right) dv = \int_{\partial A_1} \bar{t}(-\bar{e}_1)\,dA + \int_{\partial A_2} \bar{t}(-\bar{e}_2)\,dA + \int_{\partial A_3} \bar{t}(-\bar{e}_3)\,dA + \int_{\partial A_n} \bar{t}(\hat{n})\,dA
$$

$$
\rho\left( \ddot{\bar{x}} - \bar{b} \right) dv \cdot \tfrac{1}{3}\cdot h\cdot A_n = \bar{t}(-\bar{e}_1)A_1 + \bar{t}(-\bar{e}_2)A_2 + \bar{t}(-\bar{e}_3)A_3 + \bar{t}(\hat{n})A_n
$$

Using $A_1 = A_n n_1$, etc and divide by $A_n$

$$
\rho\left( \ddot{\bar{x}} - \bar{b} \right) dv \left( \tfrac{1}{3}h \right) = \bar{t}(-\bar{e}_1)n_1 + \bar{t}(-\bar{e}_2)n_2 + \bar{t}(-\bar{e}_3)n_3 + \bar{t}(\hat{n})
$$

Let $h \to 0$ and $\bar{t}(-\bar{e}_1) = -\bar{t}(\bar{e}_1)$

$$
\bar{t}(\hat{n}) = \bar{t}(\bar{e}_1)n_1 + \bar{t}(\bar{e}_2)n_2 + \bar{t}(\bar{e}_3)n_3
$$

$$
n_1 = \hat{n}\cdot\bar{e}_1\,,\ n_2 = \hat{n}\cdot\bar{e}_2\,,\ \text{etc}
$$

$$
\bar{t}(\hat{n}) = \bar{t}(\bar{e}_1)\,\bar{n}\cdot\bar{e}_1 + \bar{t}(\bar{e}_2)\,\bar{n}\cdot\bar{e}_2 + \bar{t}(\bar{e}_3)\,\bar{n}\cdot\bar{e}_3
$$

$$
= \left( \bar{t}(\bar{e}_1)\otimes\bar{e}_1 \right)\bar{n} + \left( \bar{t}(\bar{e}_2)\otimes\bar{e}_2 \right)\bar{n} + \left( \bar{t}(\bar{e}_3)\otimes\bar{e}_3 \right)\bar{n}
$$

$$
= \underbrace{\left( \bar{t}(\bar{e}_1)\otimes\bar{e}_1 + \bar{t}(\bar{e}_2)\otimes\bar{e}_2 + \bar{t}(\bar{e}_3)\otimes\bar{e}_3 \right)}_{\textcolor{red}{\bar{\bar{\sigma}}\ =\ \text{Cauchy's stress tensor}}}\bar{n}
$$

Thus,

$$
\bar{t}(\bar{x},\hat{n}) = \bar{\bar{\sigma}}(\bar{x})\,\hat{n}
$$

### Local form of linear momentum

$$
\int_{\mathcal{E}} \rho\left( \ddot{\bar{x}} - \bar{b} \right) dv = \int_{\partial\mathcal{E}} \bar{t}\,dA = \int_{\partial\mathcal{E}} \bar{\bar{\sigma}}\,\bar{n}\,dA
$$

Using divergence theorem: $\displaystyle \int_{\partial\mathcal{E}} \bar{\bar{A}}\,\bar{n}\,dA = \int_{\mathcal{E}} \text{Div}(\bar{\bar{A}})\,dv$

$$
0 = \int_{\mathcal{E}} \rho\left( \ddot{\bar{x}} - \bar{b} \right) dv = \int_{\mathcal{E}} \text{div}\left( \bar{\bar{\sigma}} \right) dv
$$

$$
0 = \int_{\mathcal{E}} \left( \rho\ddot{\bar{x}} - \rho\bar{b} - \text{div}\left( \bar{\bar{\sigma}} \right) \right) dv \ \rightarrow\ \boxed{\ \text{div}\left( \bar{\bar{\sigma}} \right) + \rho\bar{b} = \rho\ddot{\bar{x}}\ }
$$

### Balance of Angular Momentum

$$
\bar{H}_0 = \int_{\mathcal{E}} \bar{x}\times\left( \dot{\bar{x}}\,\rho\,dv \right)
$$

$$
\bar{M}_0 = \int_{\mathcal{E}} \bar{x}\times\left( \rho\,\bar{b}\,dv \right) + \int_{\partial\mathcal{E}} \bar{x}\times\bar{t}\,dA
$$

$$
\frac{D}{Dt}\int_{\mathcal{E}} \bar{x}\times\left( \rho\dot{\bar{x}} \right) dv = \int_{\mathcal{E}} \bar{x}\times\rho\bar{b}\,dv + \int_{\partial\mathcal{E}} \bar{x}\times\bar{t}\,dA
$$

Using $\rho J = \rho_0$, $dv = J\,dV_0$, $\bar{t} = \bar{\bar{\sigma}}\,\hat{n}$

$$
\int_{\mathcal{E}} \frac{D}{Dt}\left( \bar{x}\times\dot{\bar{x}} \right)\rho\,dv = \int_{\mathcal{E}} \bar{x}\times\rho\bar{b}\,dv + \int_{\partial\mathcal{E}} \bar{x}\times\bar{t}\,dA
$$

$$
\int_{\mathcal{E}} \frac{D}{Dt}\left( \epsilon_{ijk}\,x_j\,\dot{x}_k \right)\rho\,dv = \int_{\mathcal{E}} \epsilon_{ijk}\,x_j\,b_k\,\rho\,dv + \int_{\partial\mathcal{E}} \underbrace{\epsilon_{ijk}\,x_j\,\sigma_{kp}}_{\textcolor{red}{A_{ip}}}\,n_p\,dA
$$

$$
\int_{\partial\mathcal{E}} A_{ip}\,n_p\,dA = \int_{\mathcal{E}} \frac{\partial A_{ip}}{\partial x_p}\,dv
$$

$$
\int_{\mathcal{E}} \epsilon_{ijk}\left( \textcolor{red}{\cancel{\dot{x}_j\dot{x}_k}} + x_j\ddot{x}_k \right)\rho\,dv = \int_{\mathcal{E}} \epsilon_{ijk}\,x_j\,b_k\,\rho\,dv + \int_{\mathcal{E}} \frac{\partial}{\partial x_p}\left( \epsilon_{ijk}\,x_j\,\sigma_{kp} \right) dv
$$

<span style="color:red">0</span>

$$
\epsilon_{ijk}\,\dot{x}_j\dot{x}_k = \left( \dot{\bar{x}}\times\dot{\bar{x}} \right)_i = 0
$$

$$
\frac{\partial}{\partial x_p}\left( \epsilon_{ijk}\,x_j\,\sigma_{kp} \right) = \epsilon_{ijk}\frac{\partial x_j}{\partial x_p}\,\sigma_{kp} + \epsilon_{ijk}\,x_j\,\frac{\partial \sigma_{kp}}{\partial x_p}
$$

$$
\int_{\mathcal{E}} \epsilon_{ijk}\underbrace{\left( \rho\ddot{x}_k - \rho b_k - \frac{\partial \sigma_{kp}}{\partial x_k} \right)}_{\textcolor{red}{\rho\ddot{x} - \rho b - \text{div}(\bar{\bar{\sigma}}) = 0}}x_j\,dv = \int_{\mathcal{E}} \epsilon_{ijk}\frac{\partial x_j}{\partial x_p}\,\sigma_{kp}
$$

$$
\int_{\mathcal{E}} \epsilon_{ijk}\,\delta_{jp}\,\sigma_{kp}\,dv = 0
$$

Thus, $\epsilon_{ijk}\,\sigma_{kj} = 0_i$

$i=1)\quad \epsilon_{123}\,\sigma_{32} + \epsilon_{132}\,\sigma_{23} = 0$

$$
\sigma_{32} - \sigma_{23} = 0 \ \rightarrow\ \boxed{\ \sigma_{32} = \sigma_{23}\ }
$$

$i=2)\quad \longrightarrow\ \boxed{\ \sigma_{13} = \sigma_{31}\ }$

$i=3)\quad \longrightarrow\ \boxed{\ \sigma_{12} = \sigma_{21}\ }$

Thus, stress is symmetric!!

Consequences of symmetry

- 3 real eigenvalues $\{\sigma_1, \sigma_2, \sigma_3\}$ and directions $\{\bar{v}_1, \bar{v}_2, \bar{v}_3\}$
  - if $\hat{n} = \bar{v}_1 \ \rightarrow\ \bar{t} = \bar{\bar{\sigma}}\,\bar{n} = \sigma_1\bar{v}_1$
  - Traction is purely normal
  - In the principle basis $\left[ \bar{\bar{\sigma}} \right] = \begin{bmatrix} \sigma_1 & 0 & 0\\ 0 & \sigma_2 & 0\\ 0 & 0 & \sigma_3 \end{bmatrix}$

### Gradient and divergence

<u>Gradient:</u>

| | Referencial | spacial |
|---|---|---|
| Scalar $\alpha$: | $\nabla\alpha \rightarrow \left( \nabla\alpha \right)_i = \dfrac{\partial\alpha}{\partial X_i}$ | $\text{grad}(\alpha)_i = \dfrac{\partial\alpha}{\partial x_i}$ |
| Vector $\bar{v}$: | $\nabla\bar{v} \rightarrow \left( \nabla\bar{v} \right)_{ij} = \dfrac{\partial V_i}{\partial X_j}$ | $\text{grad}(\bar{v})_{ij} = \dfrac{\partial\bar{v}}{\partial x_j}$ |

<u>divergence:</u>

| | Referencial | spacial |
|---|---|---|
| Vector $\bar{v}$: | $\text{div}(\bar{v}) \rightarrow \text{div}(\bar{v}) = \dfrac{\partial V_i}{\partial X_i}$ | $\text{div}(\bar{v}) \rightarrow \text{div}(\bar{v}) = \dfrac{\partial v_i}{\partial x_i}$ |
| Tensor $\bar{\bar{A}}$: | $\text{div}(\bar{\bar{A}}) \rightarrow \text{div}(\bar{\bar{A}})_i = \dfrac{\partial A_{ij}}{\partial x_j}$ | $\text{div}(\bar{\bar{A}})_i = \dfrac{\partial A_{ij}}{\partial x_j}$ |

### Material Form

$$
\bar{f} = \bar{t}\,da = \bar{\bar{\sigma}}\,\bar{n}\,da \ \longrightarrow\ \text{spatial force}
$$

<span style="color:red">↑<br>"t̄ = spatial force over deformed area"</span>

$$
\bar{n}\,dA = J\,\bar{\bar{F}}^{-\mathsf{T}}\bar{N}\,dA_0
$$

$$
\bar{f} = \bar{\bar{\sigma}}\,J\,\bar{\bar{F}}^{-\mathsf{T}}\bar{N}\,dA_0
$$

$$
\bar{f} = \underbrace{J\,\bar{\bar{\sigma}}\,\bar{\bar{F}}^{-\mathsf{T}}}_{\bar{\bar{P}}}\bar{N}\,dA_0 \ \rightarrow\ \text{First Piola-Kirchoff Stress}
$$

$$
\bar{\bar{P}} = J\,\bar{\bar{\sigma}}\,\bar{\bar{F}}^{-\mathsf{T}}
$$

$$
\bar{\bar{P}}\bar{N} = \frac{\bar{f}}{dA_0} \ \rightarrow\ \text{spatial force per unit undeformed area}
$$

$\bar{\bar{\sigma}}$ is cauchy stress (True stress)

$\bar{\bar{P}}$ is known as engineering stress $\textcolor{red}{\left( \bar{\bar{P}}\ \text{isnt always symmetric} \right)}$

Map spatial force back to reference.

$$
d\bar{x} = \bar{\bar{F}}\,d\bar{X}
$$

$$
\bar{f} = \bar{\bar{F}}\,\bar{f}_0 \ \rightarrow\ \bar{f}_0 = \bar{\bar{F}}^{-1}\bar{f}
$$

$$
\bar{f}_0 = \bar{\bar{F}}^{-1}\bar{\bar{P}}\bar{N}\,dA_0 = \underbrace{\bar{\bar{F}}^{-1}J\,\bar{\bar{\sigma}}\,\bar{\bar{F}}^{-\mathsf{T}}}_{\bar{\bar{S}}\ \rightarrow\ \text{second P-K Stress}}\bar{N}\,dA_0
$$

$$
\bar{\bar{S}} = \bar{\bar{F}}^{-1}\bar{\bar{P}} = J\,\bar{\bar{F}}^{-1}\bar{\bar{\sigma}}\,\bar{\bar{F}}^{-\mathsf{T}}
$$

$$
\bar{\bar{S}}\bar{N} = \frac{\bar{f}_0}{dA_0} \ \longrightarrow\ \bar{\bar{S}}\ \text{is symmetric}
$$

Material form of linear momentum balance

$$
\int_{\mathcal{E}} \rho\ddot{\bar{x}}\,dv = \int_{\mathcal{E}} \rho\bar{b}\,dv + \int_{\partial\mathcal{E}} \bar{\bar{\sigma}}\,\bar{n}\,da
$$

$$
\int_{\mathcal{E}_0} \rho_0\ddot{\bar{x}}\,dV_0 = \int_{\mathcal{E}_0} \rho_0\bar{b}\,dV_0 + \int_{\partial\mathcal{E}_0} J\,\bar{\bar{\sigma}}\,\bar{\bar{F}}^{-\mathsf{T}}\bar{N}\,dA_0
$$

$$
\int_{\mathcal{E}_0} \rho_0\ddot{\bar{x}}\,dV_0 = \int_{\mathcal{E}_0} \rho_0\bar{b}\,dV_0 + \int_{\partial\mathcal{E}_0} \bar{\bar{P}}\bar{N}\,dA_0
$$

$$
\int_{\mathcal{E}_0} \left( \rho_0\ddot{\bar{x}} - \rho_0\bar{b} - \text{Div}\left( \bar{\bar{P}} \right) \right) dV_0 = 0
$$

Thus, $\ \rho_0\ddot{\bar{x}} = \text{Div}\left( \bar{\bar{P}} \right) + \rho_0\bar{b}$
