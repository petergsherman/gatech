---
note_type: refined-lecture
course: AE6114
lecture_date: 2026-08-26
source_pdf: '[[08-26-2026 - FSM rough notes.pdf]]'
tags:
- gt
- notes/refined
permalink: brain/ae6114-fundamentals-of-solid-mechanics/refined-notes/2026-08-26-refined-notes
---

# AE6114 — Lecture 2026-08-26

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

Defined as $\ \delta_{ij} = \begin{cases} 1 & \text{if } j=j\\ 0 & \text{if } i\neq j \end{cases}$ $\qquad$ Thus it is the identity matrix $\bar{\bar{I}} = \delta_{ij}$

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