---
note_type: study-guide
course: AE6114
tags:
- gt
- exam-prep
related:
- '[[AE6114 - Running Notes]]'
permalink: brain/ae6114-fundamentals-of-solid-mechanics/ae6114-exam-1-study-guide
---

# AE6114 — Exam 1 Study Guide (Fundamentals of Solid Mechanics)

> [!abstract] Scope and sources
> Built from [[AE6114 - Running Notes]] (math preliminaries, indicial notation, tensors, **kinematics and strain**, through the small-deformation examples and balance of mass) plus the exam-relevant problems in the course folder: **Fall 2022 Quiz 1** and **HW2 (Kinematics, 2024)**. Per your instruction, **stress, tractions, the Topic 3 and Topic 4 practice problems, and everything from the balance of momentum onward are deliberately excluded.** Every numerical answer, tensor, and closed-form result in this guide was recomputed symbolically or numerically.

> [!info] Notation used in this guide
> Bold lowercase = vector ($\mathbf{a},\mathbf{n},\mathbf{x}$), bold uppercase = second-order tensor ($\mathbf{F},\mathbf{C},\mathbf{U}$). This is the same object as your single/double overbars. $\{\mathbf{e}_i\}$ = orthonormal right-handed basis. $X_i$ = reference coordinates, $x_i$ = current coordinates. A comma means partial derivative: $u_{i,j}=\partial u_i/\partial x_j$. Unless stated, indices run over $1,2,3$.

## 0. How to use this guide

1. **Part 1 is the engine.** Every proof in this course (rotation properties, Nanson's formula, frame indifference) is the same five or six index moves. Drill them until they are automatic.
2. **Parts 2 to 5** are the theory, organized so each result lists what you must be able to derive and what you must be able to compute.
3. **Part 6** solves every Quiz and HW2 problem. **Cover the solution, try it, then compare.**
4. **Part 7** is a fresh mock exam that mirrors the Fall 2022 quiz format (40/40/20 split: kinematics calculation, polar decomposition, short proofs).
5. **Part 8** collects the traps, the errata in the lecture notes, and a one-page formula sheet. Read it the night before.

> [!tip] What the one past exam in the folder tells you
> Fall 2022 Quiz 1 was: (1) a full kinematics calculation ($\mathbf{F},\mathbf{C},\mathbf{E},\mathbf{u},\boldsymbol\epsilon$, stretch and angle change by both the finite and the infinitesimal route, and when they agree), (2) polar decomposition of a rotation-plus-scaling motion with a "what does the result mean physically" comment, and (3) three short proofs in indicial notation (skew tensor, skew from a cross product, frame indifference of $\mathbf{N}\cdot\mathbf{C}\mathbf{N}$). Expect the same mix: **computation, interpretation, and index-notation proofs.**

---

## 1. Indicial notation — the complete toolkit

### 1.1 The six rules

| # | Rule | Example |
|---|---|---|
| R1 | An index appearing **twice in one term** is a **dummy** index: sum $1\to3$. | $a_ib_i=a_1b_1+a_2b_2+a_3b_3$ |
| R2 | An index appearing **once in a term** is **free**: the equation holds for each value. | $u_i=A_{ij}v_j$ is three equations |
| R3 | **Free indices must match in every term** of an equation, on both sides. | $A_{ij}x_j=b_i$ ok; $A_{ij}x_j=b_j$ illegal |
| R4 | **No index appears three or more times** in a term. | $a_ib_ic_i$ is meaningless |
| R5 | Dummy letters are arbitrary and may be **renamed**, as long as the new letter is not already used in that term. | $a_ix_i=a_jx_j=a_kx_k$ |
| R6 | Summation is implied unless stated ("no sum on $i$"). Order of the factors is irrelevant (they are just numbers): $A_{ij}B_{jk}=B_{jk}A_{ij}$. **Order of the indices is what encodes the matrix product.** | $A_{ij}B_{jk}=(\mathbf{AB})_{ik}$ but $B_{jk}A_{ij}$ is the same number |

> [!warning] The two bugs that cost the most points
> **Bug 1, free-index mismatch** (R3): the notes' own reminder: *"Free indices have to match on each side of the equation."* Check this before anything else on every line you write.
> **Bug 2, reusing a letter** when renaming: $(A_{ij}x_j)(B_{jk}y_k)$ is already wrong because $j$ appears twice in two different sums. Rename one: $(A_{ij}x_j)(B_{pk}y_k)$. Never let a dummy letter collide with a free letter or another dummy in the same term.

### 1.2 Kronecker delta $\delta_{ij}$

$$
\delta_{ij}=\begin{cases}1&i=j\\0&i\neq j\end{cases}\qquad[\delta]=\mathbf{I}
$$

- **Substitution (index replacement):** $\delta_{ij}x_j=x_i$, $\ \delta_{ij}A_{jk}=A_{ik}$, $\ \delta_{ij}\delta_{jk}=\delta_{ik}$. The delta eats one index and *renames* the other.
- **Contraction:** $\delta_{ii}=3$ (a **scalar**, not the tensor $\mathbf{I}$), $\ \delta_{ij}\delta_{ij}=3$, $\ \delta_{ij}A_{ij}=A_{ii}=\text{tr}\,\mathbf{A}$.
- **Derivatives:** $\dfrac{\partial x_i}{\partial x_j}=\delta_{ij}$, $\ \dfrac{\partial x_i}{\partial x_i}=3$.
- **Orthonormal basis:** $\mathbf{e}_i\cdot\mathbf{e}_j=\delta_{ij}$.

### 1.3 Permutation symbol $\epsilon_{ijk}$

$$
\epsilon_{ijk}=\begin{cases}+1&(ijk)\ \text{even perm. of }123:\ 123,231,312\\-1&\text{odd perm.}:\ 132,321,213\\0&\text{any repeated index}\end{cases}
$$

- **Triple product:** $\mathbf{e}_i\cdot(\mathbf{e}_j\times\mathbf{e}_k)=\epsilon_{ijk}$.
- **Cross product:** $(\mathbf{a}\times\mathbf{b})_i=\epsilon_{ijk}a_jb_k$. **Scalar triple product:** $\mathbf{a}\cdot(\mathbf{b}\times\mathbf{c})=\epsilon_{ijk}a_ib_jc_k$.
- **Antisymmetry:** swapping any two indices flips the sign: $\epsilon_{ijk}=-\epsilon_{jik}=\epsilon_{jki}$ (cyclic invariance).
- **Contraction with a symmetric pair is zero:** $\epsilon_{ijk}S_{jk}=0$ if $S_{jk}=S_{kj}$. *This is the move that kills terms like $\epsilon_{ijk}\dot x_j\dot x_k$.*

> [!example] The $\epsilon$–$\delta$ identity (AI-added; not derived in your notes but it is the single most useful identity)
> $$
> \boxed{\epsilon_{ijk}\epsilon_{ilm}=\delta_{jl}\delta_{km}-\delta_{jm}\delta_{kl}}
> $$
> Rule for remembering: share the **first** index, then the pattern is *(first of each remaining pair)(second of each) minus (cross pairs)*. Consequences: $\epsilon_{ijk}\epsilon_{ijl}=2\delta_{kl}$ and $\epsilon_{ijk}\epsilon_{ijk}=6$. Numerically verified.
> **Use:** triple products, $\mathbf{a}\times(\mathbf{b}\times\mathbf{c})=\mathbf{b}(\mathbf{a}\cdot\mathbf{c})-\mathbf{c}(\mathbf{a}\cdot\mathbf{b})$, $|\mathbf{a}\times\mathbf{b}|^2=|\mathbf{a}|^2|\mathbf{b}|^2-(\mathbf{a}\cdot\mathbf{b})^2$.

### 1.4 Direct ↔ indicial dictionary (memorize this table)

| Direct notation | Indicial | Result type |
|---|---|---|
| $\alpha=\mathbf{a}\cdot\mathbf{b}$ | $a_ib_i$ | scalar |
| $\mathbf{u}=\mathbf{A}\mathbf{v}$ | $u_i=A_{ij}v_j$ | vector. Contract the **second** index of $\mathbf{A}$. |
| $\mathbf{u}=\mathbf{A}^{\mathsf T}\mathbf{v}$ | $u_i=A_{ji}v_j$ | vector. $A_{ij}v_i$ would be wrong **for $\mathbf{Av}$**. |
| $\mathbf{C}=\mathbf{AB}$ | $C_{ij}=A_{ik}B_{kj}$ | tensor (not commutative) |
| $\mathbf{C}=\mathbf{A}^{\mathsf T}\mathbf{A}$ | $C_{ij}=A_{ki}A_{kj}$ | symmetric tensor |
| $\mathbf{C}=\mathbf{A}\mathbf{A}^{\mathsf T}$ | $C_{ij}=A_{ik}A_{jk}$ | symmetric tensor |
| $\mathbf{A}:\mathbf{B}=\text{tr}(\mathbf{A}^{\mathsf T}\mathbf{B})$ | $A_{ij}B_{ij}$ | scalar |
| $\text{tr}(\mathbf{AB})$ | $A_{ij}B_{ji}$ | scalar |
| $\lVert\mathbf{A}\rVert=\sqrt{\mathbf{A}:\mathbf{A}}$ | $\sqrt{A_{ij}A_{ij}}$ | scalar |
| $\mathbf{A}=\mathbf{x}\otimes\mathbf{y}$ | $A_{ij}=x_iy_j$ | tensor (dyad) |
| $(\mathbf{a}\otimes\mathbf{b})\mathbf{c}=\mathbf{a}(\mathbf{b}\cdot\mathbf{c})$ | $a_ib_jc_j$ | vector |
| $(\mathbf{a}\otimes\mathbf{b})(\mathbf{c}\otimes\mathbf{d})=(\mathbf{b}\cdot\mathbf{c})\,\mathbf{a}\otimes\mathbf{d}$ | $a_ib_jc_jd_k$ | tensor |
| $\mathbf{A}(\mathbf{a}\otimes\mathbf{b})=(\mathbf{Aa})\otimes\mathbf{b}$ | $A_{ik}a_kb_j$ | tensor |
| $(\mathbf{a}\otimes\mathbf{b})\mathbf{A}=\mathbf{a}\otimes(\mathbf{A}^{\mathsf T}\mathbf{b})$ | $a_ib_kA_{kj}$ | tensor |
| $\mathbf{Q}\mathbf{S}\mathbf{Q}^{\mathsf T}$ | $Q_{ip}S_{pq}Q_{jq}$ | tensor (change of basis) |
| $\mathbf{a}\times\mathbf{b}$ | $\epsilon_{ijk}a_jb_k$ | vector |
| $\text{tr}\,\mathbf{A}$ | $A_{ii}=\delta_{ij}A_{ij}$ | scalar |
| $\mathbf{A}^{\mathsf T}$ | $(A^{\mathsf T})_{ij}=A_{ji}$ | tensor |
| $\text{sym}\,\mathbf{A},\ \text{skew}\,\mathbf{A}$ | $\tfrac12(A_{ij}\pm A_{ji})$ | tensor |
| $\text{Dev}\,\mathbf{A}$ | $A_{ij}-\tfrac13A_{kk}\delta_{ij}$ | tensor |
| $\mathbf{S}_{ij}$ components | $S_{ij}=\mathbf{e}_i\cdot\mathbf{S}\mathbf{e}_j$ | scalar |

### 1.5 Fields: gradient, divergence, curl in indices

| Operation | Index form | Notes |
|---|---|---|
| $\nabla\alpha$ | $\alpha_{,i}=\partial\alpha/\partial x_i$ | vector |
| $\nabla\mathbf{u}$ | $(\nabla\mathbf{u})_{ij}=\partial u_i/\partial x_j=u_{i,j}$ | **derivative index is the SECOND index** |
| $\text{div}\,\mathbf{v}$ | $v_{i,i}$ | scalar |
| $\text{div}\,\mathbf{A}$ | $(\text{div}\mathbf{A})_i=A_{ij,j}$ | **contract the SECOND index.** |
| $\nabla^2\alpha$ | $\alpha_{,ii}$ | scalar |
| $\text{curl}\,\mathbf{v}$ | $\epsilon_{ijk}v_{k,j}$ | vector |
| $\mathbf{F}=\nabla\boldsymbol\chi$ | $F_{ij}=\partial\chi_i/\partial X_j$ | **first index = current, second = reference** |
| divergence theorem | $\displaystyle\int_{\partial\mathcal E}A_{ij}n_j\,da=\int_{\mathcal E}A_{ij,j}\,dv$ | $\int_{\partial\mathcal E}\mathbf{A}\mathbf{n}\,dA=\int_{\mathcal E}\text{div}\mathbf{A}\,dv$ |

Handy: $\operatorname{curl}\nabla\alpha=0$ since $\epsilon_{ijk}\alpha_{,kj}=0$ (symmetric second derivatives hit an $\epsilon$), and $\operatorname{div}\operatorname{curl}\mathbf{v}=0$ since $\epsilon_{ijk}v_{k,ji}=0$.

### 1.6 Identities to have at your fingertips

$$
\begin{aligned}
&\delta_{ii}=3,\quad\delta_{ij}\delta_{ij}=3,\quad\delta_{ij}\delta_{jk}\delta_{ki}=3\\
&\epsilon_{ijk}\delta_{jk}=0,\quad\epsilon_{ijk}\epsilon_{ijk}=6,\quad\epsilon_{ijk}\epsilon_{ijl}=2\delta_{kl}\\
&S_{ij}=S_{ji},\ A_{ij}=-A_{ji}\ \Longrightarrow\ S_{ij}A_{ij}=0\\
&A:\mathbf{B}=A:\text{sym}\mathbf{B}\ \text{ if }\mathbf{A}\text{ symmetric};\qquad \mathbf{A}:\mathbf{B}=\text{tr}(\mathbf{A}^{\mathsf T}\mathbf{B})\\
&\epsilon_{ijk}A_{il}A_{jm}A_{kn}=\det(\mathbf{A})\,\epsilon_{lmn}\qquad\det\mathbf{A}=\tfrac16\epsilon_{ijk}\epsilon_{lmn}A_{il}A_{jm}A_{kn}\\
&\epsilon_{ijk}\epsilon_{ilm}=\delta_{jl}\delta_{km}-\delta_{jm}\delta_{kl}\\
&\text{rotations: }Q_{pi}Q_{pk}=\delta_{ik}\ \text{ and }\ Q_{ip}Q_{kp}=\delta_{ik}\ \ (\text{see §2.3})
\end{aligned}
$$

### 1.7 The five proof moves

Every index proof in this course is a chain of these. Name the move you are using on each line.

> [!tip] Move 1 — Rename a dummy index
> $\;b_iA_{ij}b_j=b_jA_{ji}b_i$ (swap the names $i\leftrightarrow j$). *Why it works:* dummies are bookkeeping, not values.

> [!tip] Move 2 — Use the symmetry or antisymmetry of one tensor
> Skew means $A_{ij}=-A_{ji}$; symmetric means $S_{ij}=S_{ji}$. Combine with Move 1 to show a quantity equals its own negative.

> [!tip] Move 3 — Substitute through a delta
> $\delta_{jp}\,S_{kp}=S_{kj}$. Eliminates a pair of indices.

> [!tip] Move 4 — Transformation with $Q$ then collapse $Q_{ip}Q_{iq}=\delta_{pq}$
> Replace every primed quantity by its $Q$-expression, collect the $Q$'s next to each other, and use orthogonality to turn products of $Q$'s into deltas, then apply Move 3.

> [!tip] Move 5 — $\epsilon$ contracted with something symmetric is zero; $\epsilon\epsilon\to\delta\delta$
> Used in $\operatorname{curl}\operatorname{grad}=0$ and vector identities.

### 1.8 Drills

> [!question]- Drill A — Legal or illegal? (State why; if legal, say free indices and what it is)
> 1. $a_ib_ic_i$
> 2. $A_{ij}x_j=b_j$
> 3. $A_{ij}B_{jk}C_{kj}$
> 4. $A_{ij}n_j=t_i$
> 5. $a_ib_jc_jd_i$
> 6. $A_{ii}B_{jj}$
> 7. $T_{ijk}n_k$
> 8. $S_{ij}u_iu_i$
>
> > [!success]- Answers
> > 1. **Illegal (R4):** $i$ three times.
> > 2. **Illegal (R3):** free $i$ on the left, free $j$ on the right. Also $j$ is dummy on the left but free on the right.
> > 3. **Illegal (R4):** $j$ appears in $A_{ij}$, $B_{jk}$ and $C_{kj}$, three times.
> > 4. **Legal.** Free $i$, dummy $j$: the matrix-vector product $\mathbf{t}=\mathbf{A}\mathbf{n}$.
> > 5. **Legal.** All dummies: $(\mathbf{a}\cdot\mathbf{d})(\mathbf{b}\cdot\mathbf{c})$, a scalar.
> > 6. **Legal.** $\text{tr}\mathbf{A}\,\text{tr}\mathbf{B}$, a scalar.
> > 7. **Legal.** Free $i,j$; it is a second-order tensor: $\mathbf{T}$ contracted with $\mathbf{n}$ on its last index.
> > 8. **Illegal (R4):** $i$ three times.

> [!question]- Drill B — Simplify (all verified)
> 1. $\delta_{ij}\delta_{jk}\delta_{ki}$
> 2. $\delta_{ij}A_{jk}\delta_{ki}$
> 3. $\delta_{ij}x_i x_j$ in terms of $|\mathbf{x}|$
> 4. $\epsilon_{ijk}\delta_{ij}$
> 5. $\epsilon_{ijk}\epsilon_{ijk}$
> 6. $\epsilon_{ijk}\epsilon_{ijl}$
> 7. $\dfrac{\partial x_i}{\partial x_j}\dfrac{\partial x_j}{\partial x_k}$
> 8. $\dfrac{\partial x_k}{\partial x_k}$ and $\dfrac{\partial(x_ix_i)}{\partial x_j}$
> 9. $\epsilon_{ijk}a_ia_j$
> 10. $S_{ij}A_{ij}$ with $\mathbf{S}$ symmetric and $\mathbf{A}$ skew
> 11. $\epsilon_{ijk}S_{jk}$ with $\mathbf{S}$ symmetric
> 12. $\epsilon_{ijk}\,a_j\,\epsilon_{klm}\,b_lc_m$ (hint: $\epsilon_{ijk}=\epsilon_{kij}$)
> 13. $\epsilon_{ijk}\epsilon_{ilm}\,a_jb_kc_ld_m$, i.e. $(\mathbf{a}\times\mathbf{b})\cdot(\mathbf{c}\times\mathbf{d})$ in indices
> 14. $A_{ij}B_{ij}$ if $\mathbf{A}=\mathbf{a}\otimes\mathbf{b}$ and $\mathbf{B}=\mathbf{c}\otimes\mathbf{d}$
>
> > [!success]- Answers
> > 1. $\delta_{ik}\delta_{ki}=\delta_{ii}=3$.
> > 2. $\delta_{ij}A_{jk}=A_{ik}$, then $A_{ik}\delta_{ki}=A_{ii}=\text{tr}\mathbf{A}$.
> > 3. $x_ix_i=|\mathbf{x}|^2$.
> > 4. $0$ ($\epsilon$ against a symmetric pair).
> > 5. $6$.
> > 6. $2\delta_{kl}$.
> > 7. $\delta_{ij}\delta_{jk}=\delta_{ik}$.
> > 8. $\partial x_k/\partial x_k=\delta_{kk}=3$. $\ \partial(x_ix_i)/\partial x_j=2x_i\delta_{ij}=2x_j$.
> > 9. $0$ (same pair symmetric in $a_ia_j$, antisymmetric in $\epsilon_{ijk}$).
> > 10. $0$.
> > 11. $0_i$ (the zero vector).
> > 12. $\epsilon_{ijk}\epsilon_{klm}=\epsilon_{kij}\epsilon_{klm}=\delta_{il}\delta_{jm}-\delta_{im}\delta_{jl}$, so the expression is $a_j\,(b_ic_j-b_jc_i)$ with the free index $i$ on the result: $b_i(\mathbf{a}\cdot\mathbf{c})-c_i(\mathbf{a}\cdot\mathbf{b})$. That is $\mathbf{a}\times(\mathbf{b}\times\mathbf{c})=\mathbf{b}(\mathbf{a}\cdot\mathbf{c})-\mathbf{c}(\mathbf{a}\cdot\mathbf{b})$.
> > 13. $(\delta_{jl}\delta_{km}-\delta_{jm}\delta_{kl})\,a_jb_kc_ld_m=(\mathbf{a}\cdot\mathbf{c})(\mathbf{b}\cdot\mathbf{d})-(\mathbf{a}\cdot\mathbf{d})(\mathbf{b}\cdot\mathbf{c})$.
> > 14. $a_ib_jc_id_j=(\mathbf{a}\cdot\mathbf{c})(\mathbf{b}\cdot\mathbf{d})$.

> [!question]- Drill C — Prove (each is a Fall-2022-style short proof)
> 1. If $\mathbf{A}$ is skew, then $\mathbf{b}\cdot\mathbf{A}\mathbf{b}=0$ for every $\mathbf{b}$.
> 2. $\text{tr}(\mathbf{AB})=\text{tr}(\mathbf{BA})$.
> 3. $(\mathbf{AB})^{\mathsf T}=\mathbf{B}^{\mathsf T}\mathbf{A}^{\mathsf T}$.
> 4. $\mathbf{S}:\mathbf{A}=0$ for $\mathbf{S}$ symmetric, $\mathbf{A}$ skew.
> 5. For a rotation $\mathbf{Q}$: $\text{tr}\,\mathbf{S}'=\text{tr}\,\mathbf{S}$ and $\text{tr}(\mathbf{S}'^2)=\text{tr}(\mathbf{S}^2)$ where $\mathbf{S}'=\mathbf{QSQ}^{\mathsf T}$.
> 6. $\mathbf{S}$ symmetric $\Rightarrow$ $\mathbf{Q}\mathbf{S}\mathbf{Q}^{\mathsf T}$ symmetric.
> 7. $(\mathbf{a}\times\mathbf{b})\cdot(\mathbf{c}\times\mathbf{d})=(\mathbf{a}\cdot\mathbf{c})(\mathbf{b}\cdot\mathbf{d})-(\mathbf{a}\cdot\mathbf{d})(\mathbf{b}\cdot\mathbf{c})$.
>
> > [!success]- Answers
> > 1. $b_iA_{ij}b_j\overset{\text{M1}}{=}b_jA_{ji}b_i\overset{\text{M2}}{=}-b_jA_{ij}b_i=-b_iA_{ij}b_j$. A number equal to its negative is $0$.
> > 2. $\text{tr}(\mathbf{AB})=A_{ij}B_{ji}=B_{ji}A_{ij}=\text{tr}(\mathbf{BA})$ (reordering numbers, then rename).
> > 3. $((\mathbf{AB})^{\mathsf T})_{ij}=(\mathbf{AB})_{ji}=A_{jk}B_{ki}=B_{ki}A_{jk}=(B^{\mathsf T})_{ik}(A^{\mathsf T})_{kj}=(\mathbf{B}^{\mathsf T}\mathbf{A}^{\mathsf T})_{ij}$.
> > 4. $S_{ij}A_{ij}\overset{\text{M1}}{=}S_{ji}A_{ji}\overset{\text{M2}}{=}-S_{ij}A_{ij}\Rightarrow0$. This is also what the notes' $\frac14(\mathbf{A}:\mathbf{A}-\mathbf{A}:\mathbf{A})=0$ scribble in the practice problem is heading for.
> > 5. $S'_{ii}=Q_{ip}S_{pq}Q_{iq}=(Q_{ip}Q_{iq})S_{pq}=\delta_{pq}S_{pq}=S_{pp}$. Then $S'_{ij}S'_{ji}=Q_{ip}S_{pq}Q_{jq}\,Q_{jr}S_{rs}Q_{is}=(Q_{ip}Q_{is})(Q_{jq}Q_{jr})S_{pq}S_{rs}=\delta_{ps}\delta_{qr}S_{pq}S_{rs}=S_{pq}S_{qp}$.
> > 6. $S'_{ji}=Q_{jp}S_{pq}Q_{iq}=Q_{iq}S_{qp}Q_{jp}$ (using $S_{pq}=S_{qp}$ and reordering) $=S'_{ij}$ after renaming $p\leftrightarrow q$.
> > 7. $\epsilon_{ijk}a_jb_k\,\epsilon_{ilm}c_ld_m=(\delta_{jl}\delta_{km}-\delta_{jm}\delta_{kl})a_jb_kc_ld_m=(\mathbf{a}\cdot\mathbf{c})(\mathbf{b}\cdot\mathbf{d})-(\mathbf{a}\cdot\mathbf{d})(\mathbf{b}\cdot\mathbf{c})$.

---

## 2. Tensor algebra and rotations

### 2.1 Definition and components

A tensor $\mathbf{S}$ is a **linear map on vectors** that represents a frame-independent physical entity. Components depend on the basis; the entity does not:

$$
S_{ij}=\mathbf{e}_i\cdot\mathbf{S}\,\mathbf{e}_j\qquad\text{(row }i\text{: output direction; column }j\text{: input direction)}
$$

### 2.2 Change of basis (the heart of Part 1's Move 4)

Primed basis $\{\mathbf{e}_i'\}$. Define $Q_{ij}=\mathbf{e}_i'\cdot\mathbf{e}_j$ (**row $i$ is the new basis vector $\mathbf{e}_i'$ written in the old basis**).

$$
\boxed{V_i'=Q_{ij}V_j\ \ (\mathbf{V}'=\mathbf{QV})}\qquad\boxed{S'_{ij}=Q_{ip}Q_{jq}S_{pq}\ \ (\mathbf{S}'=\mathbf{QSQ}^{\mathsf T})}
$$

Inverse: $\mathbf{V}=\mathbf{Q}^{\mathsf T}\mathbf{V}'$, $\ \mathbf{S}=\mathbf{Q}^{\mathsf T}\mathbf{S}'\mathbf{Q}$.

**Derivation of the vector law (reproduce this):**
$V'_i=\mathbf{V}\cdot\mathbf{e}'_i=(V_j\mathbf{e}_j)\cdot\mathbf{e}_i'=(\mathbf{e}_i'\cdot\mathbf{e}_j)V_j=Q_{ij}V_j$.

**Derivation of the tensor law:**
$S'_{ij}=\mathbf{e}_i'\cdot\mathbf{S}\mathbf{e}_j'=(Q_{ip}\mathbf{e}_p)\cdot\mathbf{S}(Q_{jq}\mathbf{e}_q)=Q_{ip}Q_{jq}\,(\mathbf{e}_p\cdot\mathbf{S}\mathbf{e}_q)=Q_{ip}Q_{jq}S_{pq}$.
(Here we used $\mathbf{e}'_i=Q_{ip}\mathbf{e}_p$, which follows from $\mathbf{e}'_i=(\mathbf{e}'_i\cdot\mathbf{e}_p)\mathbf{e}_p$.)

**Quick test: a scalar built from components must not change.** $\mathbf{V}'\cdot\mathbf{V}'=Q_{ij}V_jQ_{ik}V_k=\delta_{jk}V_jV_k=\mathbf{V}\cdot\mathbf{V}$ ✓.

### 2.3 Properties of rotation tensors

$$
\mathbf{Q}\mathbf{Q}^{\mathsf T}=\mathbf{Q}^{\mathsf T}\mathbf{Q}=\mathbf{I}\ \Longleftrightarrow\ \mathbf{Q}^{-1}=\mathbf{Q}^{\mathsf T}\qquad\det\mathbf{Q}=\pm1\ \ (+1\ \text{for a proper rotation, i.e. right-handed to right-handed})
$$

**Proof of orthogonality (from your notes):**
$\delta_{ik}=\mathbf{e}_i\cdot\mathbf{e}_k=(Q_{ji}\mathbf{e}'_j)\cdot(Q_{pk}\mathbf{e}'_p)=Q_{ji}Q_{pk}\,\delta_{jp}=Q_{pi}Q_{pk}=(Q^{\mathsf T})_{ip}Q_{pk}$. So $\mathbf{Q}^{\mathsf T}\mathbf{Q}=\mathbf{I}$.

**Proof of $\det\mathbf{Q}=\pm1$:** $\det\mathbf{Q}=\det\mathbf{Q}^{\mathsf T}=1/\det\mathbf{Q}$ (since $\mathbf{Q}^{\mathsf T}=\mathbf{Q}^{-1}$), hence $(\det\mathbf{Q})^2=1$.

**Rotation about $\mathbf{e}_3$ by angle $\theta$** (new frame rotated counter-clockwise; this is HW2 Problem 5):

$$
\mathbf{Q}=\begin{bmatrix}\cos\theta&\sin\theta&0\\-\sin\theta&\cos\theta&0\\0&0&1\end{bmatrix},\qquad \mathbf{e}_1'=\cos\theta\,\mathbf{e}_1+\sin\theta\,\mathbf{e}_2,\ \ \mathbf{e}_2'=-\sin\theta\,\mathbf{e}_1+\cos\theta\,\mathbf{e}_2
$$

> [!warning] Sign trap
> Because $Q_{ij}=\mathbf{e}'_i\cdot\mathbf{e}_j$, this $\mathbf{Q}$ **transforms components** and is the transpose of the matrix that physically rotates a vector counter-clockwise by $\theta$. When a problem says "rotate the frame," use the matrix above. When a motion physically rotates the body (Quiz Problem 2), the rotation tensor $\mathbf{R}$ is the "rotate the vector" kind: $\mathbf{R}=\begin{bmatrix}\cos\theta&-\sin\theta\\\sin\theta&\cos\theta\end{bmatrix}$ for counter-clockwise by $\theta$.

### 2.4 Symmetric / skew / deviatoric / spherical

$$
\mathbf{B}=\underbrace{\tfrac12(\mathbf{B}+\mathbf{B}^{\mathsf T})}_{\text{sym}}+\underbrace{\tfrac12(\mathbf{B}-\mathbf{B}^{\mathsf T})}_{\text{skew}}\qquad
\mathbf{A}=\underbrace{\mathbf{A}-\tfrac13\text{tr}(\mathbf{A})\mathbf{I}}_{\text{dev},\ \text{tr}=0}+\underbrace{\tfrac13\text{tr}(\mathbf{A})\mathbf{I}}_{\text{spherical}}
$$

- Symmetric: 6 independent components. Skew: 3, zero diagonal.
- $\text{tr}(\text{Dev}\mathbf{A})=A_{pp}-\tfrac13A_{kk}\delta_{pp}=A_{pp}-A_{kk}=0$ ✓ (uses $\delta_{pp}=3$).
- **Physical meaning (strain):** spherical part of $\boldsymbol\epsilon$ = volume change; deviatoric part = shape change. Skew part of $\nabla\mathbf{u}$ = infinitesimal rotation.

### 2.5 Eigenvalues, invariants, spectral decomposition

$$
\mathbf{A}\mathbf{u}=\lambda\mathbf{u}\ \ (\mathbf{u}\neq0)\ \Longrightarrow\ \det(\mathbf{A}-\lambda\mathbf{I})=0\ \Longleftrightarrow\ \lambda^3-I_1\lambda^2+I_2\lambda-I_3=0
$$

$$
I_1=\text{tr}\mathbf{A}=\lambda_1+\lambda_2+\lambda_3\quad I_2=\tfrac12\big((\text{tr}\mathbf{A})^2-\text{tr}(\mathbf{A}^2)\big)=\lambda_1\lambda_2+\lambda_2\lambda_3+\lambda_1\lambda_3\quad I_3=\det\mathbf{A}=\lambda_1\lambda_2\lambda_3
$$

($I_2$ also equals the sum of the three principal $2\times2$ minors, the fastest way to compute it by hand.)

**Invariance of eigenvalues (the notes' proof, with the cancellation made explicit):**
$\det(\mathbf{A}'-\lambda\mathbf{I})=\det\big(\mathbf{Q}(\mathbf{A}-\lambda\mathbf{I})\mathbf{Q}^{\mathsf T}\big)=\det\mathbf{Q}\cdot\det(\mathbf{A}-\lambda\mathbf{I})\cdot\det\mathbf{Q}^{\mathsf T}=\det(\mathbf{A}-\lambda\mathbf{I})$ because $\det\mathbf{Q}\det\mathbf{Q}^{\mathsf T}=1$. Hence $I_1,I_2,I_3$ are frame-independent.

**Symmetric tensors (strain, $\mathbf{C}$, $\mathbf{U}$):**
1. eigenvalues are real; 2. eigenvectors for distinct eigenvalues are orthogonal (unit-normalize them to get a basis); 3. in the eigenbasis the matrix is diagonal.

**Proof that eigenvectors of a symmetric tensor are orthogonal** (the notes' Problem 6, completed). Let $\mathbf{Am}_1=\lambda_1\mathbf{m}_1$, $\mathbf{Am}_2=\lambda_2\mathbf{m}_2$, $\lambda_1\neq\lambda_2$. Then
$$
\lambda_1\,\mathbf{m}_1\cdot\mathbf{m}_2=(\mathbf{Am}_1)\cdot\mathbf{m}_2=A_{ji}\,m_{1i}\,m_{2j}\overset{\text{sym}}{=}A_{ij}\,m_{1i}\,m_{2j}=\mathbf{m}_1\cdot(\mathbf{Am}_2)=\lambda_2\,\mathbf{m}_1\cdot\mathbf{m}_2 .
$$
So $(\lambda_1-\lambda_2)\,\mathbf{m}_1\cdot\mathbf{m}_2=0$, hence $\mathbf{m}_1\cdot\mathbf{m}_2=0$. The symmetry step $A_{ji}=A_{ij}$ is exactly where the proof fails for a non-symmetric tensor.

**Spectral decomposition and tensor functions:**

$$
\mathbf{S}=\sum_{i=1}^3\lambda_i\,\mathbf{v}_i\otimes\mathbf{v}_i\qquad f(\mathbf{S})=\sum_i f(\lambda_i)\,\mathbf{v}_i\otimes\mathbf{v}_i\ \ (\sqrt{\ },\ \ln,\ \exp,\ \text{powers})
$$

Component check: $(\mathbf{v}_1\otimes\mathbf{v}_1)$ in the eigenbasis has a single $1$ in the $(1,1)$ slot.

**Practical recipe (practice problem $\mathbf{S}$ in HW2 P6 and the polar decomposition):** find $\lambda_i$ from the characteristic polynomial, find $\mathbf{v}_i$ from $(\mathbf{S}-\lambda_i\mathbf{I})\mathbf{v}=0$, normalize, and assemble $f(\mathbf{S})$.

**Eigenbasis rotation:** $Q_{ij}=\mathbf{v}_i\cdot\mathbf{e}_j$ (rows are eigenvectors) gives $\mathbf{QSQ}^{\mathsf T}=\text{diag}(\lambda_i)$. Order the eigenvectors so the triple $(\mathbf{v}_1,\mathbf{v}_2,\mathbf{v}_3)$ is right-handed, otherwise $\det\mathbf{Q}=-1$ and it is a reflection.

### 2.6 Determinant, inverse, cofactor

- $\det\mathbf{A}=\det\mathbf{A}^{\mathsf T}$, $\ \det(\mathbf{AB})=\det\mathbf{A}\det\mathbf{B}$, $\ \det(\mathbf{A}^{-1})=1/\det\mathbf{A}$.
- **Geometric definition (used for $J$):** $\det\mathbf{S}=\dfrac{\mathbf{S}\mathbf{u}\cdot(\mathbf{S}\mathbf{v}\times\mathbf{S}\mathbf{w})}{\mathbf{u}\cdot(\mathbf{v}\times\mathbf{w})}$ for any non-coplanar $\mathbf{u,v,w}$.
- $\mathbf{S}$ invertible $\Leftrightarrow\det\mathbf{S}\neq0$.
- **Cofactor:** $\text{cof}\,\mathbf{F}=\det(\mathbf{F})\,\mathbf{F}^{-\mathsf T}$. This is exactly the combination in Nanson's formula, and it avoids an explicit inverse when computing by hand.

### 2.7 Quick reference: matrix facts that save time on 2×2 and 3×3

- 2×2 eigenvalues: $\lambda=\tfrac{\text{tr}}{2}\pm\sqrt{\big(\tfrac{\text{tr}}{2}\big)^2-\det}$; for a symmetric $\begin{bmatrix}p&q\\q&r\end{bmatrix}$: $\lambda=\tfrac{p+r}{2}\pm\sqrt{\big(\tfrac{p-r}{2}\big)^2+q^2}$.
- A shortcut for the 2×2 square root of a symmetric positive-definite $\mathbf{C}$ (verified numerically): $\mathbf{U}=\sqrt{\mathbf{C}}=\dfrac{\mathbf{C}+\sqrt{\det\mathbf{C}}\,\mathbf{I}}{\sqrt{\text{tr}\,\mathbf{C}+2\sqrt{\det\mathbf{C}}}}$ (2D block only).
- A matrix is diagonal $\Rightarrow$ its square root, inverse, log are just applied entry-by-entry on the diagonal.

---

## 3. Kinematics (finite deformation)

### 3.1 Setup

- **Reference configuration** $\mathcal B_R$: particle $P$ at $\mathbf{X}$. **Motion / deformation map:** $\mathbf{x}=\boldsymbol\chi(\mathbf{X},t)$, one-to-one with unique inverse $\mathbf{X}=\boldsymbol\chi^{-1}(\mathbf{x},t)$.
- **Displacement:** $\mathbf{u}=\mathbf{x}-\mathbf{X}=\boldsymbol\chi(\mathbf{X})-\mathbf{X}$.
- **Rigid motion:** $\mathbf{x}=\mathbf{c}(t)+\mathbf{Q}(t)\mathbf{X}$ (translation plus rotation). *Proof it preserves distances:* $|\mathbf{x}_A-\mathbf{x}_B|^2=(\mathbf{Q}\Delta\mathbf{X})\cdot(\mathbf{Q}\Delta\mathbf{X})=\Delta\mathbf{X}\cdot\mathbf{Q}^{\mathsf T}\mathbf{Q}\Delta\mathbf{X}=|\Delta\mathbf{X}|^2$.

### 3.2 Deformation gradient

$$
d\mathbf{x}=\mathbf{F}\,d\mathbf{X},\qquad \boxed{F_{ij}=\frac{\partial\chi_i}{\partial X_j}}\qquad\mathbf{F}=\nabla\boldsymbol\chi=\mathbf{I}+\nabla\mathbf{u}
$$

**Derivation (Taylor):** $x_i+dx_i=\chi_i(\mathbf{X}+d\mathbf{X})=\chi_i(\mathbf{X})+\dfrac{\partial\chi_i}{\partial X_j}dX_j+O(|d\mathbf{X}|^2)$, subtract $x_i=\chi_i(\mathbf{X})$.

- $\mathbf{F}$ is generally **not symmetric**. $J=\det\mathbf{F}>0$ for a physically admissible motion.
- Reading $\mathbf{F}$ from the motion: **column $j$** of $\mathbf{F}$ is $\partial\mathbf{x}/\partial X_j$ = the image of the reference unit vector $\mathbf{e}_j$.
- **Under a change of frame of both configurations:** $\mathbf{F}'=\mathbf{QFQ}^{\mathsf T}$. **Under a rigid body motion superposed on the deformed configuration** ($\mathbf{x}^*=\mathbf{Q}\mathbf{x}+\mathbf{c}$): $\mathbf{F}^*=\mathbf{QF}$ (see §3.8). Do not confuse the two.

### 3.3 Right Cauchy–Green tensor, stretch

$$
|d\mathbf{x}|^2=d\mathbf{X}\cdot\mathbf{F}^{\mathsf T}\mathbf{F}\,d\mathbf{X}\ \Longrightarrow\ \boxed{\mathbf{C}=\mathbf{F}^{\mathsf T}\mathbf{F}},\ \ C_{ij}=F_{ki}F_{kj}\ \ (\text{symmetric, positive definite})
$$

For the unit reference direction $\mathbf{N}=d\mathbf{X}/|d\mathbf{X}|$:

$$
\boxed{\lambda^2(\mathbf{N})=\mathbf{N}\cdot\mathbf{C}\mathbf{N}}\qquad\lambda=\frac{|d\mathbf{x}|}{|d\mathbf{X}|}>0
$$

- $\lambda(\mathbf{e}_i)=\sqrt{C_{ii}}$ (no sum). **Diagonal of $\mathbf{C}$ ↔ length changes.**
- $\lambda=1$ in a direction means that fiber is unstretched; $\lambda>1$ extension; $\lambda<1$ compression.

### 3.4 Angle change

For two reference directions $\mathbf{N},\mathbf{M}$ mapped to $\mathbf{n},\mathbf{m}$:

$$
\boxed{\cos\theta=\mathbf{n}\cdot\mathbf{m}=\frac{\mathbf{N}\cdot\mathbf{C}\mathbf{M}}{\sqrt{\mathbf{N}\cdot\mathbf{C}\mathbf{N}}\ \sqrt{\mathbf{M}\cdot\mathbf{C}\mathbf{M}}}}\qquad\cos\theta(\mathbf{e}_i,\mathbf{e}_j)=\frac{C_{ij}}{\sqrt{C_{ii}C_{jj}}}
$$

**Derivation:** $d\mathbf{x}\cdot d\mathbf{y}=(\mathbf{F}d\mathbf{X})\cdot(\mathbf{F}d\mathbf{Y})=d\mathbf{X}\cdot\mathbf{C}\,d\mathbf{Y}$, divide by $|d\mathbf{x}||d\mathbf{y}|=\lambda(\mathbf{N})\lambda(\mathbf{M})|d\mathbf{X}||d\mathbf{Y}|$.

**Off-diagonal of $\mathbf{C}$ ↔ angle changes.** For initially perpendicular fibers ($\phi=\pi/2$), the **shear angle** is $\alpha=\pi/2-\theta$ and $\sin\alpha=\cos\theta$. (Simple shear: $\sin\alpha=\gamma/\sqrt{1+\gamma^2}$, $\alpha\approx\gamma$.)

### 3.5 Volume

$$
\boxed{\frac{dv}{dV}=J=\det\mathbf{F}}\qquad\det\mathbf{C}=J^2\qquad\text{if }\mathbf{F}=\text{diag}(\lambda_i):\ J=\lambda_1\lambda_2\lambda_3=\frac{L^{(1)}L^{(2)}L^{(3)}}{L_0^{(1)}L_0^{(2)}L_0^{(3)}}
$$

$J=1$: volume-preserving (isochoric). Simple shear and the twist of HW2 P4 are both $J=1$.

**Index proof of $J\epsilon_{pqr}=\epsilon_{ijk}F_{ip}F_{jq}F_{kr}$** (the building block of both the volume and the area result):
Take $\mathbf{e}_p,\mathbf{e}_q,\mathbf{e}_r$ as the three reference vectors. Then $\mathbf{F}\mathbf{e}_p=F_{ip}\mathbf{e}_i$ and
$$
J\,\epsilon_{pqr}=\mathbf{F}\mathbf{e}_p\cdot(\mathbf{F}\mathbf{e}_q\times\mathbf{F}\mathbf{e}_r)=F_{ip}\,F_{jq}\,F_{kr}\ \mathbf{e}_i\cdot(\mathbf{e}_j\times\mathbf{e}_k)=\epsilon_{ijk}F_{ip}F_{jq}F_{kr}.
$$
> [!warning] The notes' boxed line has a typo
> It reads $J\epsilon_{pqr}=\epsilon_{ijk}F_{ip}F_{jr}F_{kR}$. The correct subscripts, from the line just above it, are $F_{ip}F_{jq}F_{kr}$ (all lowercase, middle one $q$). Learn the corrected form.

### 3.6 Area: Nanson's formula

$$
\boxed{d\mathbf{a}=J\,\mathbf{F}^{-\mathsf T}d\mathbf{A}}\qquad\frac{da}{dA}=J\,|\mathbf{F}^{-\mathsf T}\mathbf{N}|\qquad\mathbf{n}=\frac{\mathbf{F}^{-\mathsf T}\mathbf{N}}{|\mathbf{F}^{-\mathsf T}\mathbf{N}|}
$$

**Derivation (indicial; this is a likely proof question):**
1. $d\mathbf{A}=d\mathbf{X}\times d\mathbf{Y}$, $\ d\mathbf{a}=d\mathbf{x}\times d\mathbf{y}$, so $da_i=\epsilon_{ijk}\,dx_j\,dy_k=\epsilon_{ijk}(F_{jq}dX_q)(F_{kr}dY_r)$.
2. Multiply by $F_{ip}$ and sum over $i$: $\;F_{ip}\,da_i=\underbrace{\epsilon_{ijk}F_{ip}F_{jq}F_{kr}}_{J\epsilon_{pqr}}\,dX_q\,dY_r=J\,\epsilon_{pqr}dX_qdY_r=J\,dA_p$.
3. $F_{ip}da_i=(\mathbf{F}^{\mathsf T}d\mathbf{a})_p$, so $\mathbf{F}^{\mathsf T}d\mathbf{a}=J\,d\mathbf{A}$, hence $d\mathbf{a}=J\mathbf{F}^{-\mathsf T}d\mathbf{A}$. ∎

*Note the notes' line* $da_i=\epsilon_{ijk}F_{jq}F_{kr}\,X_qdY_r$ *dropped the $d$ on $X_q$; it is $dX_q$.*

**Mnemonic:** $\mathbf{F}$ maps *line* elements, $J\mathbf{F}^{-\mathsf T}$ maps *oriented area* elements, $J$ maps *volume* elements.

### 3.7 Polar decomposition

For $\det\mathbf{F}>0$:

$$
\boxed{\mathbf{F}=\mathbf{R}\,\mathbf{U}},\qquad \mathbf{U}=\sqrt{\mathbf{C}}\ (\text{symmetric, positive definite}),\qquad \mathbf{R}=\mathbf{F}\mathbf{U}^{-1}\ (\text{proper rotation})
$$

**Proof that $\mathbf{R}$ is a proper rotation** (reproduce this):
$\mathbf{R}^{\mathsf T}\mathbf{R}=\mathbf{U}^{-\mathsf T}\mathbf{F}^{\mathsf T}\mathbf{F}\mathbf{U}^{-1}=\mathbf{U}^{-1}\mathbf{C}\,\mathbf{U}^{-1}=\mathbf{U}^{-1}\mathbf{U}\mathbf{U}\mathbf{U}^{-1}=\mathbf{I}$ (using $\mathbf{U}^{\mathsf T}=\mathbf{U}$). And $\det\mathbf{R}=\det\mathbf{F}\cdot\det\mathbf{U}^{-1}=J/\det\mathbf{U}=J/\sqrt{\det\mathbf{C}}=J/J=1$.

> [!warning] Notes' slip
> The notes write $\det\mathbf{R}=\det\mathbf{F}/\det\mathbf{U}^{-1}$. It should be $\det\mathbf{F}\cdot\det\mathbf{U}^{-1}$ (equivalently $\det\mathbf{F}/\det\mathbf{U}$).

**Stretch via $\mathbf{U}$:** $\lambda^2=\mathbf{N}\cdot\mathbf{UUN}=(\mathbf{UN})\cdot(\mathbf{UN})\Rightarrow\boxed{\lambda=|\mathbf{UN}|}$. Principal stretches $\lambda_i$ = eigenvalues of $\mathbf{U}$, $\lambda_i^2$ = eigenvalues of $\mathbf{C}$. Eigenvectors are the principal stretch directions.

**Computation recipe:** (1) $\mathbf{C}=\mathbf{F}^{\mathsf T}\mathbf{F}$; (2) eigen-decompose $\mathbf{C}$; (3) $\mathbf{U}=\sum\sqrt{\mu_i}\,\mathbf{v}_i\otimes\mathbf{v}_i$; (4) $\mathbf{R}=\mathbf{FU}^{-1}$; (5) check $\mathbf{R}^{\mathsf T}\mathbf{R}=\mathbf{I}$, $\det\mathbf{R}=1$.
**Shortcut:** if $\mathbf{C}$ is already diagonal, $\mathbf{U}=\sqrt{\mathbf{C}}$ entry-wise and $\mathbf{R}$'s columns are the columns of $\mathbf{F}$ divided by the corresponding stretch.

**Meaning:** $\mathbf{F}=\mathbf{RU}$ = *first stretch along principal directions, then rotate*. $\mathbf{R}$ carries all the rigid rotation; $\mathbf{U}$ all the deformation. $\mathbf{F}=\mathbf{R}$ (i.e. $\mathbf{U}=\mathbf{I}$) means pure rigid rotation.

### 3.8 Frame indifference (objectivity)

Superpose a rigid motion on the *deformed* configuration: $\mathbf{x}^*=\mathbf{Qx}+\mathbf{c}$. Then
$$
\mathbf{F}^*=\mathbf{QF},\qquad\mathbf{C}^*=\mathbf{F}^{*\mathsf T}\mathbf{F}^*=\mathbf{F}^{\mathsf T}\mathbf{Q}^{\mathsf T}\mathbf{Q}\mathbf{F}=\mathbf{C},\qquad\mathbf{U}^*=\mathbf{U},\qquad\mathbf{R}^*=\mathbf{QR},\qquad\mathbf{E}^*=\mathbf{E}.
$$
**$\mathbf{C},\mathbf{U},\mathbf{E}$ are frame-indifferent (unchanged); $\mathbf{F}$ and $\mathbf{R}$ are not.** A valid strain measure must depend on $\mathbf{F}$ only through $\mathbf{C}$ (or $\mathbf{U}$). The **infinitesimal strain $\boldsymbol\epsilon$ is NOT frame-indifferent** (see Quiz Problem 2(c)).

Proof that $\mathbf{U}^*=\mathbf{U}$: $\mathbf{C}^*=\mathbf{C}\Rightarrow\sqrt{\mathbf{C}^*}=\sqrt{\mathbf{C}}$. Then $\mathbf{R}^*=\mathbf{F}^*\mathbf{U}^{*-1}=\mathbf{QF}\mathbf{U}^{-1}=\mathbf{QR}$.

> [!note] Two different "frame" statements — keep them separate
> *Change of observer basis* (same body, relabel components): tensors transform as $\mathbf{S}'=\mathbf{QSQ}^{\mathsf T}$, and every **scalar** built from them is unchanged. *Superposed rigid motion* (body physically moves): $\mathbf{F}^*=\mathbf{QF}$, and *objective* quantities satisfy the corresponding rule ($\mathbf{C}^*=\mathbf{C}$, $\mathbf{U}^*=\mathbf{U}$). Quiz Problem 3(c) tests the first, in the form "$\mathbf{N}\cdot\mathbf{C}\mathbf{N}$ is the same number in any frame."

---

## 4. Strain measures and linearization

### 4.1 Finite strain measures

A strain measure $\varepsilon=f(\mathbf{F})$ must: vanish at $\mathbf{F}=\mathbf{I}$, be frame-indifferent ($f(\mathbf{QF})=f(\mathbf{F})$, i.e. depend on $\mathbf{C}$ or $\mathbf{U}$), and linearize to $\text{sym}(\nabla\mathbf{u})$.

For a single fiber, $\varepsilon=\lambda-1=\dfrac{|d\mathbf{x}|-|d\mathbf{X}|}{|d\mathbf{X}|}$.

| Name | Definition | In terms of $\mathbf{C}$ | Principal values |
|---|---|---|---|
| **Green–Lagrange** $\mathbf{E}$ | $\tfrac12(\mathbf{C}-\mathbf{I})$ | $\tfrac12(\mathbf{C}-\mathbf{I})$ | $\tfrac12(\lambda_i^2-1)$ |
| **Biot** $\boldsymbol\varepsilon^B$ | $\mathbf{U}-\mathbf{I}$ | $\sqrt{\mathbf{C}}-\mathbf{I}$ | $\lambda_i-1$ |
| **Hencky (log)** $\boldsymbol\varepsilon^H$ | $\ln\mathbf{U}$ | $\tfrac12\ln\mathbf{C}$ | $\ln\lambda_i$ |
| **Seth–Hill family** | $\tfrac1m(\mathbf{U}^m-\mathbf{I})$ | $\tfrac1m(\mathbf{C}^{m/2}-\mathbf{I})$ | $(\lambda_i^m-1)/m$ |

$m=2$: Green. $m=1$: Biot. $m\to0$: Hencky.

**Reading $\mathbf{E}$:** $E_{ii}=\tfrac12(\lambda^2(\mathbf{e}_i)-1)$ (axial); $E_{ij}=\tfrac12C_{ij}$ for $i\ne j$ (shear). Inverse: $\mathbf{C}=2\mathbf{E}+\mathbf{I}$, so
$$
\cos\theta(\mathbf{e}_1,\mathbf{e}_2)=\frac{2E_{12}}{\sqrt{2E_{11}+1}\,\sqrt{2E_{22}+1}}.
$$

### 4.2 Small deformations: the linearization chain

Let $\mathbf{H}=\nabla\mathbf{u}$, $\mathbf{F}=\mathbf{I}+\mathbf{H}$. **Infinitesimal when $|\mathbf{H}|=\sqrt{\mathbf{H}:\mathbf{H}}\ll1$.** Then drop every term quadratic in $\mathbf{H}$:

$$
\mathbf{C}=(\mathbf{I}+\mathbf{H})^{\mathsf T}(\mathbf{I}+\mathbf{H})=\mathbf{I}+\mathbf{H}+\mathbf{H}^{\mathsf T}+\mathbf{H}^{\mathsf T}\mathbf{H}\ \approx\ \mathbf{I}+2\boldsymbol\epsilon
$$

$$
\boxed{\boldsymbol\epsilon=\text{sym}(\nabla\mathbf{u}),\quad\epsilon_{ij}=\tfrac12(u_{i,j}+u_{j,i})}\qquad\boxed{\boldsymbol\omega=\text{skew}(\nabla\mathbf{u})=\tfrac12(\mathbf{H}-\mathbf{H}^{\mathsf T})}
$$

> [!example] Exact relation worth knowing
> $\mathbf{E}=\tfrac12(\mathbf{C}-\mathbf{I})=\boldsymbol\epsilon+\tfrac12\mathbf{H}^{\mathsf T}\mathbf{H}$ **exactly** (no approximation). So $\mathbf{E}-\boldsymbol\epsilon=\tfrac12\mathbf{H}^{\mathsf T}\mathbf{H}$; this is the quantity to compute when a problem asks "show $\mathbf{E}$ reduces to $\boldsymbol\epsilon$ under conditions" (Quiz 1(e)).

Consequences (all derived in your notes):

| Quantity | Linearized result |
|---|---|
| $\mathbf{E},\ \boldsymbol\varepsilon^B,\ \boldsymbol\varepsilon^H$ | all $\approx\boldsymbol\epsilon$ |
| $\mathbf{U}$ | $\approx\mathbf{I}+\boldsymbol\epsilon$ (from $\sqrt{\mathbf{I}+2\boldsymbol\epsilon}$) |
| $\mathbf{R}$ | $\approx\mathbf{I}+\boldsymbol\omega$ (from $\mathbf{R}=(\mathbf{I}+\boldsymbol\epsilon+\boldsymbol\omega)(\mathbf{I}-\boldsymbol\epsilon)$) |
| stretch | $\lambda(\mathbf{N})\approx1+\mathbf{N}\cdot\boldsymbol\epsilon\mathbf{N}=1+\epsilon_N$, so $\epsilon_N=\frac{\lvert d\mathbf{x}\rvert-\lvert d\mathbf{X}\rvert}{\lvert d\mathbf{X}\rvert}$ |
| volume | $\dfrac{dv}{dV}=\det\mathbf{F}\approx1+\text{tr}\boldsymbol\epsilon\ \Rightarrow\ \dfrac{\Delta V}{V_0}=\text{tr}\,\boldsymbol\epsilon=\epsilon_{kk}$ |
| angle | $\cos\theta(\mathbf{N},\mathbf{M})\approx(1-\epsilon_N-\epsilon_M)\,\mathbf{N}\cdot\mathbf{M}+2\mathbf{N}\cdot\boldsymbol\epsilon\mathbf{M}$ |
| shear angle | $\alpha(\mathbf{e}_i,\mathbf{e}_j)\approx2\epsilon_{ij}=\gamma_{ij}$ (engineering shear strain) |

**Why $\text{tr}\,\boldsymbol\epsilon$ is the volume change:** with principal stretches $\lambda_i\approx1+\epsilon_i$, $\ \lambda_1\lambda_2\lambda_3\approx1+\epsilon_1+\epsilon_2+\epsilon_3$ (dropping $\epsilon_i\epsilon_j$), and $\epsilon_1+\epsilon_2+\epsilon_3=\text{tr}\boldsymbol\epsilon$ by invariance of the trace.

**Volumetric–deviatoric split:** $\boldsymbol\epsilon=\boldsymbol\epsilon'+\tfrac13\text{tr}(\boldsymbol\epsilon)\mathbf{I}$; spherical part $\leftrightarrow$ volume change, deviator $\leftrightarrow$ shape change.

> [!warning] When is "infinitesimal" legitimate? Two separate smallness conditions
> The condition is on the **displacement gradient** $|\nabla\mathbf{u}|$, not on $\mathbf{u}$ itself. A large rigid translation has $\nabla\mathbf{u}=0$ and is fine. A moderate rigid **rotation** has $|\mathbf{H}|\sim\theta$ and produces a **spurious** strain $\sim\theta^2/2$ at the next order (Quiz Problem 2(c)). So $\boldsymbol\epsilon$ is valid only for **small strains AND small rotations**.

### 4.3 Summary card (finite deformation)

| Want | Formula |
|---|---|
| Deformation gradient | $F_{ij}=\partial\chi_i/\partial X_j$, $\mathbf{F}=\mathbf{I}+\nabla\mathbf{u}$ |
| Stretch in direction $\mathbf{N}$ | $\lambda^2=\mathbf{N}\cdot\mathbf{CN}$, $\lambda=\lvert\mathbf{UN}\rvert$ |
| Angle | $\cos\theta=\dfrac{\mathbf{N}\cdot\mathbf{CM}}{\lambda(\mathbf{N})\lambda(\mathbf{M})}$ |
| Volume | $dv/dV=J=\det\mathbf{F}$ |
| Area | $d\mathbf{a}=J\mathbf{F}^{-\mathsf T}d\mathbf{A}$ |
| Polar | $\mathbf{F}=\mathbf{RU}$, $\mathbf{U}=\sqrt{\mathbf{C}}$ |
| Strain | $\mathbf{E}=\tfrac12(\mathbf{C}-\mathbf{I})$; $\boldsymbol\epsilon=\text{sym}\nabla\mathbf{u}$ |

---

## 5. Balance of mass (the only balance law in scope)

$$
\int_{E_0}\rho_0\,dV_0=\int_E\rho\,dv,\quad dv=J\,dV_0\ \Rightarrow\ \int_{E_0}(\rho_0-\rho J)\,dV_0=0\ \ \text{for all }E_0\ \Rightarrow\ \boxed{\rho_0=\rho\,J}
$$

The "for all $E_0$" step is the **localization argument**: an integrand whose integral vanishes over every subregion must vanish pointwise. The result ties directly to Part 3: $J=\det\mathbf{F}=dv/dV$ is the volume ratio, so density **drops** when volume grows ($J>1\Rightarrow\rho<\rho_0$) and an isochoric motion ($J=1$) keeps $\rho=\rho_0$. Mass in a material region is $m_0=\rho_0V_0=\rho\,v$.

---

## 6. Worked solutions: every Quiz and HW2 problem

> [!tip] How to use
> Attempt each problem cold first. Every solution below states the **plan** (which formula from Parts 1 to 4), then the computation. All results were verified symbolically.

### 6.1 Fall 2022 Quiz 1 and HW2 Problem 2 (same problem)

**Setup.** Unit cube of side $L$, motion $\boldsymbol\chi=\big(\tfrac aLX_1+\gamma X_2\big)\mathbf{e}_1+X_2\mathbf{e}_2+X_3\mathbf{e}_3$, constants $a,\gamma$.

#### Problem 1 (a): $\mathbf{F}$, $\mathbf{C}$, $\mathbf{E}$

*Plan:* $F_{ij}=\partial\chi_i/\partial X_j$, then $\mathbf{C}=\mathbf{F}^{\mathsf T}\mathbf{F}$, $\mathbf{E}=\tfrac12(\mathbf{C}-\mathbf{I})$.

$$
[\mathbf{F}]=\begin{bmatrix}\tfrac aL&\gamma&0\\0&1&0\\0&0&1\end{bmatrix}\qquad
[\mathbf{C}]=\begin{bmatrix}\tfrac{a^2}{L^2}&\tfrac{a\gamma}{L}&0\\[2pt]\tfrac{a\gamma}{L}&1+\gamma^2&0\\0&0&1\end{bmatrix}\qquad
[\mathbf{E}]=\frac12\begin{bmatrix}\tfrac{a^2}{L^2}-1&\tfrac{a\gamma}{L}&0\\[2pt]\tfrac{a\gamma}{L}&\gamma^2&0\\0&0&0\end{bmatrix}
$$

(Column check: $\mathbf{C}_{ij}=\mathbf{F}_{\cdot i}\cdot\mathbf{F}_{\cdot j}$; columns of $\mathbf{F}$ are $(\tfrac aL,0,0)$, $(\gamma,1,0)$, $(0,0,1)$.) $J=\det\mathbf{F}=a/L$.

#### Problem 1 (b): $\mathbf{u}$ and $\boldsymbol\epsilon$

$\mathbf{u}=\boldsymbol\chi-\mathbf{X}=\Big(\big(\tfrac aL-1\big)X_1+\gamma X_2\Big)\mathbf{e}_1$ (only $u_1\ne0$).

$$
[\nabla\mathbf{u}]=\mathbf{H}=\begin{bmatrix}\tfrac aL-1&\gamma&0\\0&0&0\\0&0&0\end{bmatrix}\ \Rightarrow\ [\boldsymbol\epsilon]=\text{sym}\,\mathbf{H}=\begin{bmatrix}\tfrac aL-1&\tfrac\gamma2&0\\[2pt]\tfrac\gamma2&0&0\\0&0&0\end{bmatrix}
$$

#### Problem 1 (c): stretch along $\mathbf{e}_1$, finite and infinitesimal

- **Finite:** $\lambda^2=\mathbf{e}_1\cdot\mathbf{C}\mathbf{e}_1=C_{11}=a^2/L^2\Rightarrow\boxed{\lambda=a/L}$ (positive, since $\lambda>0$).
- **Infinitesimal:** $\lambda\approx1+\epsilon_{11}=1+\big(\tfrac aL-1\big)=\boxed{a/L}$.
- They agree **exactly**, for any $a/L$, because $\epsilon_{11}$ is linear in $a/L$ and the $\mathbf{H}^{\mathsf T}\mathbf{H}$ correction to $C_{11}$ happens to be absorbed: $C_{11}=(1+H_{11})^2$ and $\lambda=1+H_{11}$ exactly.

#### Problem 1 (d): change in angle between fibers along $\mathbf{e}_1$ and $\mathbf{e}_2$

- **Finite:** $\cos\theta=\dfrac{C_{12}}{\sqrt{C_{11}C_{22}}}=\dfrac{a\gamma/L}{(a/L)\sqrt{1+\gamma^2}}=\dfrac{\gamma}{\sqrt{1+\gamma^2}}$ (independent of $a/L$: stretching along $\mathbf{e}_1$ doesn't change the direction of the $\mathbf{e}_1$ fiber, and the $\mathbf{e}_2$ fiber maps to $(\gamma,1,0)$).
 Initial angle $\pi/2$, final $\theta=\arccos\dfrac{\gamma}{\sqrt{1+\gamma^2}}=\dfrac\pi2-\arctan\gamma$. **Change:** $\Delta\theta=\theta-\tfrac\pi2=-\arctan\gamma$ (the angle closes by $\arctan\gamma$). Shear angle $\alpha=\arctan\gamma$.
- **Infinitesimal:** $\alpha\approx2\epsilon_{12}=\gamma$, i.e. $\Delta\theta\approx-\gamma$.

#### Problem 1 (e): when is $\boldsymbol\epsilon$ valid, and do the answers coincide?

The exact relation is $\mathbf{E}-\boldsymbol\epsilon=\tfrac12\mathbf{H}^{\mathsf T}\mathbf{H}$:
$$
\tfrac12\mathbf{H}^{\mathsf T}\mathbf{H}=\frac12\begin{bmatrix}\big(\tfrac aL-1\big)^2&\big(\tfrac aL-1\big)\gamma&0\\\big(\tfrac aL-1\big)\gamma&\gamma^2&0\\0&0&0\end{bmatrix}
$$
This vanishes (relative to $\boldsymbol\epsilon$) when $\boxed{\big|\tfrac aL-1\big|\ll1\ \text{and}\ |\gamma|\ll1}$, i.e. $|\mathbf{H}|=\sqrt{(a/L-1)^2+\gamma^2}\ll1$. Then $\mathbf{E}\to\boldsymbol\epsilon$, the stretch agrees (already exact), and the angle change agrees because $\arctan\gamma\approx\gamma$ and $\gamma/\sqrt{1+\gamma^2}\approx\gamma$.

#### Problem 2: $\boldsymbol\chi=(aX_1-bX_2)\mathbf{e}_1+(bX_1+aX_2)\mathbf{e}_2+X_3\mathbf{e}_3$

**(a)** 
$$
[\mathbf{F}]=\begin{bmatrix}a&-b&0\\b&a&0\\0&0&1\end{bmatrix}\quad[\mathbf{C}]=\begin{bmatrix}a^2+b^2&0&0\\0&a^2+b^2&0\\0&0&1\end{bmatrix}
$$
$\mathbf{C}$ is diagonal, so with $s=\sqrt{a^2+b^2}$:
$$
[\mathbf{U}]=\begin{bmatrix}s&0&0\\0&s&0\\0&0&1\end{bmatrix},\qquad[\mathbf{R}]=\mathbf{F}\mathbf{U}^{-1}=\frac1s\begin{bmatrix}a&-b&0\\b&a&0\\0&0&s\end{bmatrix}
$$
Check: $\det\mathbf{R}=(a^2+b^2)/s^2=1$ ✓, $\mathbf{R}^{\mathsf T}\mathbf{R}=\mathbf{I}$ ✓.

**(b)(i)** $\mathbf{F}=\mathbf{R}\Leftrightarrow\mathbf{U}=\mathbf{I}\Leftrightarrow\mathbf{C}=\mathbf{I}\Leftrightarrow\boxed{a^2+b^2=1}$.
**(b)(ii)** Then $a=\cos\theta$, $b=\sin\theta$ and $\mathbf{F}$ is a **rigid-body rotation about $\mathbf{e}_3$ by angle $\theta$ (counter-clockwise)**: lengths and angles are preserved, $\lambda=1$ in every direction, $J=1$. (With $a^2+b^2\neq1$ the motion is a rotation combined with a uniform in-plane dilation by $s$.)

**(c)** With $a^2+b^2=1$:
$$
\mathbf{H}=\mathbf{F}-\mathbf{I}=\begin{bmatrix}a-1&-b&0\\b&a-1&0\\0&0&0\end{bmatrix}\ \Rightarrow\ [\boldsymbol\epsilon]=\text{sym}\,\mathbf{H}=\begin{bmatrix}a-1&0&0\\0&a-1&0\\0&0&0\end{bmatrix}=(\cos\theta-1)\,\text{diag}(1,1,0)
$$
**Comment:** a rigid rotation should produce **zero** strain, but $\boldsymbol\epsilon\neq0$ (it is a compressive in-plane strain $\approx-\theta^2/2$). The finite measure gets it right: $\mathbf{E}=\tfrac12(\mathbf{C}-\mathbf{I})=\mathbf{0}$ exactly. The infinitesimal strain is **not frame-indifferent**; it only makes sense when the rotation is small enough that $\theta^2/2$ is negligible. So the result "makes physical sense" only in the limit $\theta\to0$, where it is a second-order effect.

#### Problem 3 (proofs)

**(a)** $\mathbf{A}$ skew, $\mathbf{b}$ arbitrary: $\ \mathbf{b}\cdot\mathbf{A}\mathbf{b}=b_iA_{ij}b_j\overset{\text{rename}}{=}b_jA_{ji}b_i=-b_jA_{ij}b_i=-\,b_iA_{ij}b_j$. A number equal to its own negative is $0$. ∎

**(b)** Given $\mathbf{A}=(\mathbf{a}\times\mathbf{b})\otimes\mathbf{c}$ and $\mathbf{a}\otimes\mathbf{c}=\mathbf{1}$ (the identity tensor), show $\mathbf{A}$ is skew.
$$
A_{ij}=(\mathbf{a}\times\mathbf{b})_i\,c_j=\epsilon_{ikl}\,a_k\,b_l\,c_j=\epsilon_{ikl}\,b_l\,\underbrace{(a_kc_j)}_{=\delta_{kj}}=\epsilon_{ijl}\,b_l
$$
$$
A_{ji}=\epsilon_{jil}\,b_l=-\epsilon_{ijl}\,b_l=-A_{ij}\ \Rightarrow\ \mathbf{A}=-\mathbf{A}^{\mathsf T}\ \text{(skew)}.\ \ \blacksquare
$$
> [!note] AI observation
> As literally stated, $\mathbf{a}\otimes\mathbf{c}=\mathbf{1}$ cannot hold for real vectors in 3D (a dyad has rank one, the identity has rank three). The intended solution is exactly the index manipulation above: *substitute $a_kc_j\to\delta_{kj}$ (Move 3) and recognize $\epsilon_{ijl}b_l$ as the skew tensor associated with $\mathbf{b}$.* If you meet this problem on an exam, write that manipulation and move on.

**(c)** The stretch is frame-indifferent: under a change of basis, $N'_i=Q_{im}N_m$ and $C'_{ij}=Q_{ik}Q_{jl}C_{kl}$, so
$$
\mathbf{N}'\cdot\mathbf{C}'\mathbf{N}'=N'_iC'_{ij}N'_j=\underbrace{Q_{im}Q_{ik}}_{\delta_{mk}}\ \underbrace{Q_{jl}Q_{jn}}_{\delta_{ln}}\ N_m\,C_{kl}\,N_n=N_kC_{kl}N_l=\mathbf{N}\cdot\mathbf{C}\mathbf{N}.\ \blacksquare
$$
(Orthogonality $Q_{ip}Q_{iq}=\delta_{pq}$ collapses each pair, then Move 3 finishes it.)

### 6.2 HW2 (Kinematics, Fall 2024)

#### HW2 Problem 1: $\boldsymbol\chi=3X_3\mathbf{e}_1-X_1\mathbf{e}_2-2X_2\mathbf{e}_3$

**(a)** $x_1=3X_3,\ x_2=-X_1,\ x_3=-2X_2$:
$$
[\mathbf{F}]=\begin{bmatrix}0&0&3\\-1&0&0\\0&-2&0\end{bmatrix}
$$
**(b)** The columns $(0,-1,0)$, $(0,0,-2)$, $(3,0,0)$ are mutually orthogonal, so $\mathbf{C}$ is diagonal:
$$
[\mathbf{C}]=\text{diag}(1,4,9),\qquad[\mathbf{U}]=\sqrt{\mathbf{C}}=\text{diag}(1,2,3)
$$
**(c)** $\mathbf{R}=\mathbf{F}\mathbf{U}^{-1}$: divide each column of $\mathbf{F}$ by its stretch:
$$
[\mathbf{R}]=\begin{bmatrix}0&0&1\\-1&0&0\\0&-1&0\end{bmatrix}
$$
Check: $\mathbf{R}^{\mathsf T}\mathbf{R}=\mathbf{I}$ ✓, $\det\mathbf{R}=+1$ ✓ (a proper rotation: trace $0\Rightarrow\cos\vartheta=-\tfrac12$, a $120^\circ$ rotation about the axis $(1,-1,1)/\sqrt3$, which $\mathbf{R}$ leaves fixed).
**(d)** $\mathbf{E}=\tfrac12(\mathbf{C}-\mathbf{I})=\tfrac12\text{diag}(0,3,8)=\text{diag}\big(0,\tfrac32,4\big)$.
**(e)** $J=\det\mathbf{F}=\lambda_1\lambda_2\lambda_3=1\cdot2\cdot3=\boxed{6}$ (direct: expanding along the first row, $3\cdot\big((-1)(-2)-0\big)=6$). The volume grows by a factor of $6$.

#### HW2 Problem 3: constant strain field and rigid-body terms

Given $[\boldsymbol\epsilon]=\text{diag}(C_1,-C_2,0)$, $\mathbf{u}=\mathbf{u}(X_1,X_2)$.

1. $\epsilon_{11}=\partial u_1/\partial X_1=C_1\Rightarrow u_1=C_1X_1+f(X_2)$.
2. $\epsilon_{22}=\partial u_2/\partial X_2=-C_2\Rightarrow u_2=-C_2X_2+g(X_1)$.
3. $\epsilon_{12}=\tfrac12\big(f'(X_2)+g'(X_1)\big)=0\Rightarrow f'(X_2)=-g'(X_1)=\text{const}=:k$. So $f=kX_2+b_1$, $g=-kX_1+b_2$.
4. $\epsilon_{13}=\tfrac12\partial u_3/\partial X_1=0$, $\epsilon_{23}=\tfrac12\partial u_3/\partial X_2=0$, $\epsilon_{33}=0$ with no $X_3$ dependence $\Rightarrow u_3=b_3$.

$$
\boxed{\mathbf{u}=C_1X_1\mathbf{e}_1-C_2X_2\mathbf{e}_2+k\,(X_2\mathbf{e}_1-X_1\mathbf{e}_2)+\mathbf{b}}
$$
Rigid-body motion terms: the **translation** $\mathbf{b}=(b_1,b_2,b_3)$ and the **rotation** $k(X_2\mathbf{e}_1-X_1\mathbf{e}_2)$ (a rotation about $\mathbf{e}_3$ by the small angle $-k$).

**(b)** The rotation term is $\mathbf{AX}$ with
$$
\mathbf{A}=\begin{bmatrix}0&k&0\\-k&0&0\\0&0&0\end{bmatrix}\ \text{(skew: }A_{12}=-A_{21},\text{ zero diagonal)},\quad\text{so}\ \ \mathbf{u}=C_1X_1\mathbf{e}_1-C_2X_2\mathbf{e}_2+\mathbf{AX}+\mathbf{b}.
$$
Finally $\nabla\mathbf{u}=\text{diag}(C_1,-C_2,0)+\mathbf{A}=\boldsymbol\epsilon+\mathbf{A}$, with $\boldsymbol\epsilon$ symmetric and $\mathbf{A}$ skew, hence $\boldsymbol\omega=\text{skw}(\nabla\mathbf{u})=\mathbf{A}$ ∎ (uniqueness of the sym/skew split). *The strain field fixes $\mathbf{u}$ only up to a rigid-body motion.*

#### HW2 Problem 4: twist of a cylinder

$x_1=X_1\cos\tau X_3-X_2\sin\tau X_3,\ x_2=X_1\sin\tau X_3+X_2\cos\tau X_3,\ x_3=X_3$.

**1. Description.** Each cross-section $X_3=\text{const}$ is rotated **rigidly** about the $\mathbf{e}_3$ axis by the angle $\tau X_3$. The angle grows linearly with $X_3$, so $\tau$ is the **twist per unit length** (angle of twist per unit length, rad/length): a **torsion** deformation.

**2. $\mathbf{F}$ and $\mathbf{C}$.** Differentiating ($c=\cos\tau X_3$, $s=\sin\tau X_3$); note $\partial x_1/\partial X_3=-\tau x_2$ and $\partial x_2/\partial X_3=\tau x_1$:
$$
[\mathbf{F}]=\begin{bmatrix}c&-s&-\tau x_2\\s&c&\tau x_1\\0&0&1\end{bmatrix}
$$
Taking inner products of the columns $(c,s,0)$, $(-s,c,0)$, $(-\tau x_2,\tau x_1,1)$ and reducing $x_1,x_2$ back to $X_1,X_2$ (e.g. $x_1s-x_2c=-X_2$, $x_2s+x_1c=X_1$):
$$
[\mathbf{C}]=\begin{bmatrix}1&0&-\tau X_2\\0&1&\tau X_1\\-\tau X_2&\tau X_1&1+\tau^2(X_1^2+X_2^2)\end{bmatrix}
$$

**3. Stretch of a fiber in the $\{\mathbf{e}_1,\mathbf{e}_2\}$ plane.** $\mathbf{N}=\cos\varphi\,\mathbf{e}_1+\sin\varphi\,\mathbf{e}_2$: $\lambda^2=C_{11}\cos^2\varphi+C_{22}\sin^2\varphi+2C_{12}\sin\varphi\cos\varphi=1\Rightarrow\boxed{\lambda=1}$ (planar fibers are unstretched). *Interpretation:* cross-sections rotate rigidly. For contrast, the axial fiber has $\lambda(\mathbf{e}_3)=\sqrt{1+\tau^2(X_1^2+X_2^2)}>1$ and stretches more with radius (outer fibers become helices).

**4. Area change for normal $\mathbf{e}_3$.** $\dfrac{da}{dA}=J\,\big|\mathbf{F}^{-\mathsf T}\mathbf{e}_3\big|$. Writing $\mathbf{F}=\begin{bmatrix}\mathbf{R}_z&\mathbf{w}\\\mathbf{0}^{\mathsf T}&1\end{bmatrix}$ with $\mathbf{w}=(-\tau x_2,\tau x_1)$, the inverse is $\mathbf{F}^{-1}=\begin{bmatrix}\mathbf{R}_z^{\mathsf T}&-\mathbf{R}_z^{\mathsf T}\mathbf{w}\\\mathbf{0}^{\mathsf T}&1\end{bmatrix}$, whose third row is $(0,0,1)$, so $\mathbf{F}^{-\mathsf T}\mathbf{e}_3=\mathbf{e}_3$. With $J=1$:
$$
\boxed{da/dA=1}\quad(\text{cross-sectional area unchanged, and the normal stays }\mathbf{e}_3).
$$

**5. Volume.** $J=\det\mathbf{F}=\det\mathbf{R}_z\cdot1=\boxed{1}$ (isochoric). (Also $\det\mathbf{C}=1+\tau^2\rho^2-\tau^2\rho^2=1$ for $\rho^2=X_1^2+X_2^2$ ✓.)

#### HW2 Problem 5: change of basis by rotation about $\mathbf{e}_3$

**(a)** $\mathbf{e}_1'=\cos\theta\,\mathbf{e}_1+\sin\theta\,\mathbf{e}_2$, $\ \mathbf{e}_2'=-\sin\theta\,\mathbf{e}_1+\cos\theta\,\mathbf{e}_2$, $\ \mathbf{e}_3'=\mathbf{e}_3$. With $Q_{ij}=\mathbf{e}_i'\cdot\mathbf{e}_j$:
$$
[\mathbf{Q}]=\begin{bmatrix}\cos\theta&\sin\theta&0\\-\sin\theta&\cos\theta&0\\0&0&1\end{bmatrix}
$$
**(b)** Rows are orthonormal: $\text{row}_1\cdot\text{row}_1=\cos^2\theta+\sin^2\theta=1$, $\text{row}_1\cdot\text{row}_2=-\cos\theta\sin\theta+\sin\theta\cos\theta=0$, $\text{row}_3\cdot\text{row}_3=1$; so $\mathbf{QQ}^{\mathsf T}=\mathbf{I}$. $\ \det\mathbf{Q}=\cos\theta\cos\theta-\sin\theta(-\sin\theta)=1$ ✓.

**(c)** $\mathbf{A}=\text{diag}(A_{11},A_{22},A_{33})$, $A^*_{ij}=Q_{ip}Q_{jq}A_{pq}$. Since $\mathbf{A}$ is diagonal only $p=q$ survives: $A^*_{ij}=\sum_pQ_{ip}Q_{jp}A_{pp}$:
$$
A^*_{11}=\cos^2\theta\,A_{11}+\sin^2\theta\,A_{22},\quad A^*_{22}=\sin^2\theta\,A_{11}+\cos^2\theta\,A_{22},\quad A^*_{12}=\sin\theta\cos\theta\,(A_{22}-A_{11}),\quad A^*_{33}=A_{33},
$$
and $A^*_{13}=A^*_{23}=0$. (These are the Mohr-circle transformation equations.) *Note:* the problem says "spherical," but a diagonal tensor with $A_{11}\ne A_{22}$ is not spherical; a truly spherical tensor ($A_{11}=A_{22}=A_{33}$) is **isotropic**, $\mathbf{A}^*=\mathbf{A}$ in every frame.

**(d)** $A_{11}=4$, $A_{22}=2$: $\ A^*_{11}=4\cos^2\theta+2\sin^2\theta=3+\cos2\theta$, $\ A^*_{12}=-2\sin\theta\cos\theta=-\sin2\theta$. Therefore
$$
\big(A^*_{11}-3\big)^2+\big(A^*_{12}\big)^2=1\quad\Rightarrow\quad\text{a circle of radius }1=\tfrac{A_{11}-A_{22}}{2}\text{ centered at }(3,0)=\big(\tfrac{A_{11}+A_{22}}{2},0\big).
$$
The point goes around the circle **twice** as $\theta$ runs $0\to2\pi$ (since $2\theta$ appears); it starts at $(4,0)$ at $\theta=0$. Rightmost point $(4,0)$, leftmost $(2,0)$ (at $\theta=\pi/2$), top $(3,1)$ at $\theta=3\pi/4$, bottom $(3,-1)$ at $\theta=\pi/4$.

#### HW2 Problem 6: eigen-decomposition and tensor log

$[\mathbf{S}]=\begin{bmatrix}4&-1\\-1&4\end{bmatrix}$.

**(a)** $\det(\mathbf{S}-\lambda\mathbf{I})=(4-\lambda)^2-1=0\Rightarrow\lambda=3,5$.
- $\lambda_1=3$: $\begin{bmatrix}1&-1\\-1&1\end{bmatrix}\mathbf{v}=\mathbf{0}\Rightarrow\mathbf{v}_1=\tfrac1{\sqrt2}(1,1)$.
- $\lambda_2=5$: $\begin{bmatrix}-1&-1\\-1&-1\end{bmatrix}\mathbf{v}=\mathbf{0}\Rightarrow\mathbf{v}_2=\tfrac1{\sqrt2}(-1,1)$ (sign chosen so $\det\mathbf{Q}=+1$).
- Check: $\mathbf{S}\mathbf{v}_1=3\mathbf{v}_1$, $\mathbf{S}\mathbf{v}_2=5\mathbf{v}_2$ ✓, $\mathbf{v}_1\cdot\mathbf{v}_2=0$ ✓ (symmetric $\Rightarrow$ orthogonal).

**(b)** $Q_{ij}=\mathbf{v}_i\cdot\mathbf{e}_j$ (rows are eigenvectors):
$$
[\mathbf{Q}]=\frac1{\sqrt2}\begin{bmatrix}1&1\\-1&1\end{bmatrix},\quad\mathbf{S}^*=\mathbf{QSQ}^{\mathsf T}:\ \ \mathbf{SQ}^{\mathsf T}=\tfrac1{\sqrt2}\begin{bmatrix}3&-5\\3&5\end{bmatrix},\ \ \mathbf{Q}(\mathbf{SQ}^{\mathsf T})=\tfrac12\begin{bmatrix}6&0\\0&10\end{bmatrix}=\begin{bmatrix}3&0\\0&5\end{bmatrix}.
$$
So $\mathbf{S}^*=\text{diag}(3,5)$, the **eigenvalues on the diagonal**. (The problem calls $\mathbf{S}^*$ "spherical"; it is *diagonal*, and spherical only if the eigenvalues coincide.)

**(c)** $\ln\mathbf{S}=\sum_i\ln(\lambda_i)\,\mathbf{v}_i\otimes\mathbf{v}_i$ (two terms in 2D). $\mathbf{v}_1\otimes\mathbf{v}_1=\tfrac12\begin{bmatrix}1&1\\1&1\end{bmatrix}$, $\ \mathbf{v}_2\otimes\mathbf{v}_2=\tfrac12\begin{bmatrix}1&-1\\-1&1\end{bmatrix}$:
$$
\ln\mathbf{S}=\frac12\begin{bmatrix}\ln3+\ln5&\ln3-\ln5\\\ln3-\ln5&\ln3+\ln5\end{bmatrix}=\frac12\begin{bmatrix}\ln15&\ln\tfrac35\\\ln\tfrac35&\ln15\end{bmatrix}\approx\begin{bmatrix}1.3540&-0.2554\\-0.2554&1.3540\end{bmatrix}.
$$
(In 3D with an unchanged $\mathbf{e}_3$ direction add $\ln1\cdot\mathbf{e}_3\otimes\mathbf{e}_3=0$.) Quick sanity check: $\exp(\ln\mathbf{S})$ must return $\mathbf{S}$, and the eigenvalues of $\ln\mathbf{S}$ are $\ln3,\ln5$ in the same eigenvectors.

#### HW2 Problem 7: extreme stretches occur along principal directions

$\mathbf{C}=\sum_{i=1}^3\lambda_i^2\,\mathbf{v}_i\otimes\mathbf{v}_i$, unit $\mathbf{N}$. Expand $\mathbf{N}$ in the eigenbasis, $N_i:=\mathbf{N}\cdot\mathbf{v}_i$, with $\sum_iN_i^2=|\mathbf{N}|^2=1$.
$$
\lambda_N^2=\mathbf{N}\cdot\mathbf{C}\mathbf{N}=\sum_i\lambda_i^2\,(\mathbf{N}\cdot\mathbf{v}_i)^2=\sum_i\lambda_i^2N_i^2.
$$
**1.** Since $\lambda_i\le\lambda_{\max}$: $\ \lambda_N^2\le\lambda_{\max}^2\sum_iN_i^2=\lambda_{\max}^2$. Equality needs $N_i=0$ for every $i$ with $\lambda_i<\lambda_{\max}$, i.e. (strict ordering $\lambda_{\max}>\lambda_3>\lambda_{\min}$) $\mathbf{N}=\pm\mathbf{v}_1$. So $\lambda_{\max}$ in the direction $\mathbf{v}_1$ strictly exceeds $\lambda_N$ in any other direction. ∎
**2.** Same argument with $\lambda_i\ge\lambda_{\min}$: $\lambda_N^2\ge\lambda_{\min}^2\sum_iN_i^2=\lambda_{\min}^2$, equality only for $\mathbf{N}=\pm\mathbf{v}_2$. ∎
*Remark:* $\lambda_3$ (the middle value) is a **saddle**: it is a maximum along some directions and a minimum along others, a stationary but not extremal value.

---

## 7. Mock exam (original problems, 100 points)

> [!question] Instructions
> Closed notes. Time yourself: 60 minutes. Show every index step. Answers follow each problem in foldable boxes. All answers were verified computationally.

### Problem M1 (40 points): Kinematics calculation

A unit cube $\mathcal B=\{0\le X_i\le1\}$ undergoes $\boldsymbol\chi=(1+\alpha)X_1\mathbf{e}_1+(X_2+\gamma X_3)\mathbf{e}_2+X_3\mathbf{e}_3$ with constants $\alpha,\gamma$.

(a) Compute $\mathbf{F}$, $\mathbf{C}$, $\mathbf{E}$, $J$. (b) Compute $\mathbf{u}$, $\nabla\mathbf{u}$, $\boldsymbol\epsilon$, $\boldsymbol\omega$. (c) Find the stretch of the fibers along $\mathbf{e}_1$ and $\mathbf{e}_3$, and the angle change between the $\mathbf{e}_2$ and $\mathbf{e}_3$ fibers, by the finite and infinitesimal routes. (d) Compute $da/dA$ for oriented areas with normals $\mathbf{e}_1,\mathbf{e}_2,\mathbf{e}_3$ and the deformed normal for $\mathbf{N}=\mathbf{e}_2$. (e) Show $\mathbf{E}-\boldsymbol\epsilon=\tfrac12(\nabla\mathbf{u})^{\mathsf T}\nabla\mathbf{u}$ for this motion and state when $\mathbf{E}\approx\boldsymbol\epsilon$.

> [!success]- Answer M1
> **(a)** $[\mathbf{F}]=\begin{bmatrix}1+\alpha&0&0\\0&1&\gamma\\0&0&1\end{bmatrix}$, $\ [\mathbf{C}]=\begin{bmatrix}(1+\alpha)^2&0&0\\0&1&\gamma\\0&\gamma&1+\gamma^2\end{bmatrix}$, $\ [\mathbf{E}]=\tfrac12\begin{bmatrix}\alpha(2+\alpha)&0&0\\0&0&\gamma\\0&\gamma&\gamma^2\end{bmatrix}$, $\ J=1+\alpha$.
> **(b)** $\mathbf{u}=\alpha X_1\mathbf{e}_1+\gamma X_3\mathbf{e}_2$. $[\nabla\mathbf{u}]=\begin{bmatrix}\alpha&0&0\\0&0&\gamma\\0&0&0\end{bmatrix}$. $[\boldsymbol\epsilon]=\begin{bmatrix}\alpha&0&0\\0&0&\gamma/2\\0&\gamma/2&0\end{bmatrix}$, $[\boldsymbol\omega]=\begin{bmatrix}0&0&0\\0&0&\gamma/2\\0&-\gamma/2&0\end{bmatrix}$.
> **(c)** $\lambda(\mathbf{e}_1)=\sqrt{C_{11}}=1+\alpha$ (infinitesimal: $1+\epsilon_{11}=1+\alpha$, exact match). $\lambda(\mathbf{e}_3)=\sqrt{C_{33}}=\sqrt{1+\gamma^2}$ (infinitesimal: $1+\epsilon_{33}=1$; differs at $O(\gamma^2)$, consistent with $\sqrt{1+\gamma^2}\approx1+\gamma^2/2$). Angle $(\mathbf{e}_2,\mathbf{e}_3)$: $\cos\theta=\dfrac{C_{23}}{\sqrt{C_{22}C_{33}}}=\dfrac{\gamma}{\sqrt{1+\gamma^2}}$, shear angle $\alpha_s=\arctan\gamma$; infinitesimal $\alpha_s\approx2\epsilon_{23}=\gamma$.
> **(d)** $\mathbf{F}^{-1}=\begin{bmatrix}1/(1+\alpha)&0&0\\0&1&-\gamma\\0&0&1\end{bmatrix}$; $\mathbf{F}^{-\mathsf T}\mathbf{N}$ is the $N$-th row of $\mathbf{F}^{-1}$ as a vector: $\mathbf{e}_1\to(\tfrac1{1+\alpha},0,0)$, $\mathbf{e}_2\to(0,1,-\gamma)$, $\mathbf{e}_3\to(0,0,1)$. So $\dfrac{da}{dA}=J|\mathbf{F}^{-\mathsf T}\mathbf{N}|$: $\mathbf{e}_1$: $\mathbf{1}$ (the face normal to the stretch direction is unchanged); $\mathbf{e}_2$: $(1+\alpha)\sqrt{1+\gamma^2}$; $\mathbf{e}_3$: $1+\alpha$. Deformed normal for $\mathbf{N}=\mathbf{e}_2$: $\mathbf{n}=\dfrac{(0,1,-\gamma)}{\sqrt{1+\gamma^2}}$.
> **(e)** $\mathbf{H}^{\mathsf T}\mathbf{H}=\text{diag}(\alpha^2,0,\gamma^2)$ (columns of $\mathbf{H}$ are $(\alpha,0,0)$, $\mathbf{0}$, $(0,\gamma,0)$), so $\mathbf{E}-\boldsymbol\epsilon=\tfrac12\text{diag}(\alpha^2,0,\gamma^2)$ ✓ matches $E_{11}=\alpha+\alpha^2/2$, $E_{33}=\gamma^2/2$. Negligible when $|\alpha|\ll1$ and $|\gamma|\ll1$.

### Problem M2 (40 points): Polar decomposition of simple shear

For $\boldsymbol\chi=(X_1+\gamma X_2)\mathbf{e}_1+X_2\mathbf{e}_2+X_3\mathbf{e}_3$ with $\gamma=1$: (a) Find the principal stretches and principal stretch directions (in the reference configuration). (b) Compute $\mathbf{U}$ and $\mathbf{R}$ explicitly and verify $\mathbf{F}=\mathbf{RU}$, $\det\mathbf{R}=1$. (c) Identify the rotation angle of $\mathbf{R}$. (d) Which fibers have the maximum and minimum stretch, and what is $\lambda(\mathbf{e}_1)$, $\lambda(\mathbf{e}_2)$? Why is $J=1$ consistent with your principal stretches?

> [!success]- Answer M2
> **(a)** $[\mathbf{C}]=\begin{bmatrix}1&1&0\\1&2&0\\0&0&1\end{bmatrix}$. In the $\{\mathbf{e}_1,\mathbf{e}_2\}$ block: $\mu=\tfrac32\pm\tfrac{\sqrt5}2$, so $\lambda=\sqrt\mu=\varphi=\tfrac{1+\sqrt5}2\approx1.618$ and $1/\varphi=\tfrac{\sqrt5-1}2\approx0.618$ (golden ratio; $\varphi^2=\varphi+1$). Third stretch $\lambda_3=1$ along $\mathbf{e}_3$. Eigenvectors: $(\mathbf{C}-\varphi^2\mathbf{I})\mathbf{N}=0\Rightarrow N_2=\varphi N_1$: $\ \mathbf{N}_{\max}=\dfrac{(1,\varphi,0)}{\sqrt{1+\varphi^2}}\approx(0.526,0.851,0)$ (at $\approx58.3^\circ$ from $\mathbf{e}_1$), $\ \mathbf{N}_{\min}=\dfrac{(-\varphi,1,0)}{\sqrt{1+\varphi^2}}\approx(-0.851,0.526,0)$.
> **(b)** $[\mathbf{U}]=\dfrac1{\sqrt5}\begin{bmatrix}2&1&0\\1&3&0\\0&0&\sqrt5\end{bmatrix}$ (check: $\mathbf{U}^2=\tfrac15\begin{bmatrix}5&5\\5&10\end{bmatrix}=\mathbf{C}$ ✓). $\ [\mathbf{R}]=\mathbf{FU}^{-1}=\dfrac1{\sqrt5}\begin{bmatrix}2&1&0\\-1&2&0\\0&0&\sqrt5\end{bmatrix}$. Verify: $\mathbf{RU}=\tfrac15\begin{bmatrix}2&1\\-1&2\end{bmatrix}\begin{bmatrix}2&1\\1&3\end{bmatrix}=\tfrac15\begin{bmatrix}5&5\\0&5\end{bmatrix}=\begin{bmatrix}1&1\\0&1\end{bmatrix}=\mathbf{F}$ ✓; $\det\mathbf{R}=\tfrac15(4+1)=1$ ✓.
> **(c)** $\mathbf{R}=\begin{bmatrix}\cos\vartheta&-\sin\vartheta\\\sin\vartheta&\cos\vartheta\end{bmatrix}$ with $\cos\vartheta=2/\sqrt5$, $\sin\vartheta=-1/\sqrt5$: $\vartheta=-\arctan(\gamma/2)=-\arctan\tfrac12\approx-26.57^\circ$ (a **clockwise** rotation). For small $\gamma$: $\vartheta\approx-\gamma/2$, matching the infinitesimal $\omega_{12}=+\gamma/2=-\vartheta$ ✓ (since $\mathbf{R}\approx\mathbf{I}+\boldsymbol\omega$ has $R_{12}\approx-\vartheta$).
> **(d)** Max-stretch fiber is $\mathbf{N}_{\max}$ ($\lambda=\varphi$), min-stretch fiber is $\mathbf{N}_{\min}$ ($\lambda=1/\varphi$). $\lambda(\mathbf{e}_1)=\sqrt{C_{11}}=1$, $\lambda(\mathbf{e}_2)=\sqrt{C_{22}}=\sqrt2\approx1.414$, both between $0.618$ and $1.618$ ✓ (HW2 P7). $J=\varphi\cdot\tfrac1\varphi\cdot1=1=\det\mathbf{F}$ ✓.

### Problem M3 (20 points): Index-notation proofs

(a) If $A_{ij}=\epsilon_{ijk}w_k$, show $\mathbf{A}$ is skew and that $w_k=\tfrac12\epsilon_{kij}A_{ij}$. (b) Show that under $\mathbf{F}^*=\mathbf{QF}$ the Green strain is unchanged, $\mathbf{E}^*=\mathbf{E}$. (c) Show that for a symmetric $\mathbf{S}$ and any tensor $\mathbf{B}$, $\mathbf{S}:\mathbf{B}=\mathbf{S}:\text{sym}(\mathbf{B})$. (d) Show that $\epsilon_{ijk}\epsilon_{ijk}=6$ and $\epsilon_{ijk}\epsilon_{ijl}=2\delta_{kl}$ from the $\epsilon$–$\delta$ identity.

> [!success]- Answer M3
> **(a)** $A_{ji}=\epsilon_{jik}w_k=-\epsilon_{ijk}w_k=-A_{ij}$ (swap two indices flips the sign). For the inverse: $\epsilon_{kij}A_{ij}=\epsilon_{kij}\epsilon_{ijl}w_l=\epsilon_{ijk}\epsilon_{ijl}w_l=2\delta_{kl}w_l=2w_k$ (cyclic permutation $\epsilon_{kij}=\epsilon_{ijk}$, then the identity from (d)). Dividing by $2$ gives $w_k$.
> **(b)** $C^*_{ij}=F^*_{ki}F^*_{kj}=Q_{kp}F_{pi}\,Q_{kq}F_{qj}=(Q_{kp}Q_{kq})F_{pi}F_{qj}=\delta_{pq}F_{pi}F_{qj}=F_{pi}F_{pj}=C_{ij}$. So $\mathbf{C}^*=\mathbf{C}$ and $\mathbf{E}^*=\tfrac12(\mathbf{C}^*-\mathbf{I})=\mathbf{E}$.
> **(c)** $\mathbf{B}=\text{sym}\,\mathbf{B}+\text{skew}\,\mathbf{B}$, so $\mathbf{S}:\mathbf{B}=\mathbf{S}:\text{sym}\,\mathbf{B}+\mathbf{S}:\text{skew}\,\mathbf{B}$, and $S_{ij}K_{ij}=S_{ji}K_{ji}=-S_{ij}K_{ij}=0$ for skew $\mathbf{K}$.
> **(d)** Contract $j$ with $l$ and $k$ with $m$ in $\epsilon_{ijk}\epsilon_{ilm}=\delta_{jl}\delta_{km}-\delta_{jm}\delta_{kl}$: $\epsilon_{ijk}\epsilon_{ijk}=\delta_{jj}\delta_{kk}-\delta_{jk}\delta_{kj}=9-3=6$. Contract only $j$ with $l$: $\epsilon_{ijk}\epsilon_{ijm}=\delta_{jj}\delta_{km}-\delta_{jm}\delta_{kj}=3\delta_{km}-\delta_{km}=2\delta_{km}$.

### Problem M4 (bonus, 20 points): Small deformations in 3D

For $\mathbf{u}=\alpha\big(X_2X_3\,\mathbf{e}_1+X_1X_3\,\mathbf{e}_2+X_1X_2\,\mathbf{e}_3\big)$ on the unit cube: (a) find $\nabla\mathbf{u}$, $\boldsymbol\epsilon$, $\boldsymbol\omega$. (b) What is the first-order volume change? (c) At the corner $\mathbf{X}=(1,1,1)$ find the principal strains and the direction of maximum extension. (d) What bound on $\alpha$ makes the infinitesimal theory valid on the whole cube? (e) Finish the notes' second example: for $\boldsymbol\epsilon=\tfrac\alpha2\begin{bmatrix}0&0&1\\0&0&1\\1&1&0\end{bmatrix}$ find the eigenvalues and the eigenvector for the maximum tensile strain.

> [!success]- Answer M4
> **(a)** $[\nabla\mathbf{u}]=\alpha\begin{bmatrix}0&X_3&X_2\\X_3&0&X_1\\X_2&X_1&0\end{bmatrix}$ is **symmetric**, so $\boldsymbol\epsilon=\nabla\mathbf{u}$ and $\boldsymbol\omega=\mathbf{0}$ (pure strain, no rotation).
> **(b)** $\text{tr}\,\boldsymbol\epsilon=0\Rightarrow\Delta V/V_0\approx0$ at first order (isochoric to first order).
> **(c)** $[\boldsymbol\epsilon]=\alpha\begin{bmatrix}0&1&1\\1&0&1\\1&1&0\end{bmatrix}$, eigenvalues $2\alpha$ with $\mathbf{v}=\tfrac1{\sqrt3}(1,1,1)$, and $-\alpha$ (double; any direction in the plane perpendicular to $(1,1,1)$). So the body-diagonal fiber lengthens by $\epsilon_N=2\alpha$ and fibers in the perpendicular plane shorten by $\alpha$. Sum $=0$ ✓ (trace).
> **(d)** $|\mathbf{H}|^2=\mathbf{H}:\mathbf{H}=2\alpha^2(X_1^2+X_2^2+X_3^2)\le6\alpha^2$ on the cube, so we need $\alpha\sqrt6\ll1$.
> **(e)** $\det(\boldsymbol\epsilon-\lambda\mathbf{I})=-\lambda\big(\lambda^2-\tfrac{\alpha^2}2\big)=0\Rightarrow\lambda=0,\pm\tfrac\alpha{\sqrt2}$. For $\lambda=+\tfrac\alpha{\sqrt2}$: $-\tfrac\alpha{\sqrt2}V_1+\tfrac\alpha2V_3=0\Rightarrow V_3=\sqrt2V_1$, and by symmetry $V_2=V_1$: $\mathbf{v}=\tfrac12(1,1,\sqrt2)$. For $\lambda=-\tfrac\alpha{\sqrt2}$: $\mathbf{v}=\tfrac12(1,1,-\sqrt2)$. For $\lambda=0$: $\mathbf{v}=\tfrac1{\sqrt2}(1,-1,0)$ (a direction of zero axial strain). These three are mutually orthogonal ✓.

---

## 8. Traps, errata, and the formula sheet

### 8.1 Errata in the lecture notes (do **not** memorize these as written)

| Where | As written | Correct |
|---|---|---|
| Summation examples | $a_ia_i=a_1^2+a_2^2+a_3^2+a_4^2\ (n=3)$ | 3 terms, no $a_4^2$ |
| Summation examples | $\sigma_{ii}=\sigma_{11}+\sigma_{22}+\sigma_{22}$ | $\sigma_{11}+\sigma_{22}+\sigma_{33}$ |
| Kronecker delta | $1$ if $j=j$ | $1$ if $i=j$ |
| Delta substitution | $x_3\delta_{x_3j}$ | $x_3\delta_{3j}$ |
| Practice problem 2d | $\delta_{ii}=\delta_{ii}=3=\mathbf{I}$ | $\delta_{ii}=3$ is a **scalar**; $\mathbf{I}$ is a tensor with components $\delta_{ij}$ |
| Cross product | $\mathbf{a}=\mathbf{u}\times\mathbf{v}=a_i\epsilon_{ijk}u_jv_k$ | $a_i=\epsilon_{ijk}u_jv_k$ |
| Change of basis | $(\mathbf{e}_j'\cdot\mathbf{e}_i')V_j'=Q_{ji}V_j'$ | $(\mathbf{e}_i\cdot\mathbf{e}_j')V_j'=Q_{ji}V_j'$ (primes on both vectors would give $\delta_{ij}$) |
| $J\epsilon_{pqr}$ | $\epsilon_{ijk}F_{ip}F_{jr}F_{kR}$ | $\epsilon_{ijk}F_{ip}F_{jq}F_{kr}$ |
| Area derivation | $\epsilon_{ijk}F_{jq}F_{kr}\,X_qdY_r$ | $\epsilon_{ijk}F_{jq}F_{kr}\,dX_qdY_r$ |
| $\det\mathbf{R}$ | $\det\mathbf{F}/\det\mathbf{U}^{-1}$ | $\det\mathbf{F}\cdot\det\mathbf{U}^{-1}=\det\mathbf{F}/\det\mathbf{U}$ |
| Small-deformation setup | $\mathbf{u}=\boldsymbol\chi(\mathbf{X})-\mathbf{x}$ | $\mathbf{u}=\boldsymbol\chi(\mathbf{X})-\mathbf{X}$ |
| Angle formula (twice) | numerator $\mathbf{N}\cdot\mathbf{C}\mathbf{N}$ | $\mathbf{N}\cdot\mathbf{C}\mathbf{M}$ |
| Small-strain angle recap | $1-(\epsilon_N-\epsilon_M)$ | $1-\epsilon_N-\epsilon_M$ |
| Green strain $E_{11}$ | last fraction has $\lvert d\mathbf{X}\rvert$ in the denominator | $\lvert d\mathbf{X}\rvert^2$ |
| Biot | $\varepsilon^1=\mathbf{U}-1$ | $\mathbf{U}-\mathbf{I}$ |
| Hencky linearization | "$\approx\mathbf{I}+\boldsymbol\epsilon-\mathbf{I}$" | $\ln(\mathbf{I}+\boldsymbol\epsilon)\approx\boldsymbol\epsilon$ (series of $\ln(1+x)$) |
| Worked example, $C_{11}$ | $(1+\alpha X_2)^2+(\alpha X_1)^2$ | $(1+\alpha X_2)^2+(2\beta X_1)^2$ |
| Worked example, $\lvert\mathbf{H}\rvert$ | $2\alpha^2+4\beta^2$ | $\sqrt{2\alpha^2+4\beta^2}$ (the square root is missing; evaluated at $X_1=X_2=1$) |
| Rigid motion proof | mixes $\mathbf{X}$ and $\mathbf{x}$ | consistent: $\boldsymbol\chi(\mathbf{X})=\mathbf{c}+\mathbf{Q}\mathbf{X}$ |

### 8.2 Common mistakes checklist

- [ ] **Free-index mismatch** (R3): check the free indices on every line.
- [ ] **Three-fold index** (R4): $a_ib_ic_i$ is not allowed.
- [ ] $\delta_{ii}=3$, **not** $\mathbf{I}$ and not $1$.
- [ ] $F_{ij}=\partial\chi_i/\partial X_j$: **first index current, second reference**. Columns of $\mathbf{F}$ are images of reference unit vectors.
- [ ] $\mathbf{C}=\mathbf{F}^{\mathsf T}\mathbf{F}$ (not $\mathbf{FF}^{\mathsf T}$, which is the *left* Cauchy–Green $\mathbf{B}$). The reference-direction formulas ($\lambda^2=\mathbf{N}\cdot\mathbf{CN}$) use $\mathbf{C}$.
- [ ] **Stretch is the square root:** $\lambda=\sqrt{\mathbf{N}\cdot\mathbf{CN}}$. $\lambda(\mathbf{e}_i)=\sqrt{C_{ii}}$, not $C_{ii}$.
- [ ] $\mathbf{E}=\tfrac12(\mathbf{C}-\mathbf{I})$: remember the $\tfrac12$ and the $\mathbf{I}$. $\mathbf{E}\ne\boldsymbol\epsilon$ in general: $\mathbf{E}=\boldsymbol\epsilon+\tfrac12\mathbf{H}^{\mathsf T}\mathbf{H}$.
- [ ] **Angle formula** uses $C_{12}/\sqrt{C_{11}C_{22}}$ for $\cos\theta$; the **shear angle** is $\pi/2-\theta$, equal to $2\epsilon_{12}$ (engineering $\gamma_{12}$) only for small deformations.
- [ ] Nanson: $d\mathbf{a}=J\mathbf{F}^{-\mathsf T}d\mathbf{A}$ uses $\mathbf{F}^{-\mathsf T}$ (inverse **transpose**), and the new normal is the *direction* of $\mathbf{F}^{-\mathsf T}\mathbf{N}$; compute $|\cdot|$ for the area ratio.
- [ ] **Order matters** in $\mathbf{AB}\ne\mathbf{BA}$; $(\mathbf{AB})^{\mathsf T}=\mathbf{B}^{\mathsf T}\mathbf{A}^{\mathsf T}$.
- [ ] $\mathbf{Q}$ conventions: $\mathbf{V}'=\mathbf{QV}$ with $Q_{ij}=\mathbf{e}'_i\cdot\mathbf{e}_j$. For tensors $\mathbf{S}'=\mathbf{QSQ}^{\mathsf T}$, **not** $\mathbf{Q}^{\mathsf T}\mathbf{SQ}$.
- [ ] Polar decomposition is $\mathbf{F}=\mathbf{RU}$ (rotation applied *after* stretch). $\mathbf{R}$ requires $\det=+1$; check it.
- [ ] Infinitesimal strain is valid only for small $|\nabla\mathbf{u}|$ (strain **and** rotation small). A rigid rotation gives zero $\mathbf{E}$ but nonzero $\boldsymbol\epsilon$.
- [ ] Eigenvectors must be **normalized** before building $\mathbf{Q}$ or $\mathbf{U}=\sum\lambda_i\mathbf{v}_i\otimes\mathbf{v}_i$.

### 8.3 One-page formula sheet

$$
\begin{aligned}
&\textbf{Index rules: }\ \delta_{ii}=3,\ \ \epsilon_{ijk}\epsilon_{ilm}=\delta_{jl}\delta_{km}-\delta_{jm}\delta_{kl},\ \ S_{ij}A_{ij}=0\ (\text{sym}\times\text{skew})\\
&\textbf{Rotation: }\ V_i'=Q_{ij}V_j,\ \ S_{ij}'=Q_{ip}Q_{jq}S_{pq},\ \ \mathbf{QQ}^{\mathsf T}=\mathbf{I},\ \det\mathbf{Q}=1,\ \ Q_{ij}=\mathbf{e}'_i\cdot\mathbf{e}_j\\
&\textbf{Eigen: }\ \det(\mathbf{A}-\lambda\mathbf{I})=0,\ \ \mathbf{S}=\sum\lambda_i\mathbf{v}_i\otimes\mathbf{v}_i,\ \ f(\mathbf{S})=\sum f(\lambda_i)\mathbf{v}_i\otimes\mathbf{v}_i\\
&\textbf{Invariants: }\ I_1=\text{tr},\ \ I_2=\tfrac12\big((\text{tr}\mathbf{A})^2-\text{tr}\mathbf{A}^2\big),\ \ I_3=\det\\
&\textbf{Kinematics: }\ F_{ij}=\tfrac{\partial\chi_i}{\partial X_j},\ \ \mathbf{C}=\mathbf{F}^{\mathsf T}\mathbf{F},\ \ \lambda^2=\mathbf{N}\cdot\mathbf{CN},\ \ \cos\theta=\tfrac{\mathbf{N}\cdot\mathbf{CM}}{\lambda_N\lambda_M}\\
&\textbf{Volume/area: }\ \tfrac{dv}{dV}=J=\det\mathbf{F},\ \ d\mathbf{a}=J\mathbf{F}^{-\mathsf T}d\mathbf{A},\ \ J\epsilon_{pqr}=\epsilon_{ijk}F_{ip}F_{jq}F_{kr}\\
&\textbf{Polar: }\ \mathbf{F}=\mathbf{RU},\ \ \mathbf{U}=\sqrt{\mathbf{C}},\ \ \mathbf{R}=\mathbf{FU}^{-1},\ \ \lambda=|\mathbf{UN}|\\
&\textbf{Frame change: }\ \mathbf{F}^*=\mathbf{QF},\ \ \mathbf{C}^*=\mathbf{C},\ \ \mathbf{U}^*=\mathbf{U},\ \ \mathbf{R}^*=\mathbf{QR}\\
&\textbf{Strains: }\ \mathbf{E}=\tfrac12(\mathbf{C}-\mathbf{I}),\ \ \boldsymbol\varepsilon^B=\mathbf{U}-\mathbf{I},\ \ \boldsymbol\varepsilon^H=\ln\mathbf{U},\ \ \boldsymbol\varepsilon^{(m)}=\tfrac1m(\mathbf{U}^m-\mathbf{I})\\
&\textbf{Small: }\ \mathbf{H}=\nabla\mathbf{u},\ \ |\mathbf{H}|\ll1,\ \ \boldsymbol\epsilon=\text{sym}\mathbf{H},\ \ \boldsymbol\omega=\text{skew}\mathbf{H},\ \ \mathbf{E}=\boldsymbol\epsilon+\tfrac12\mathbf{H}^{\mathsf T}\mathbf{H}\\
&\phantom{\textbf{Small: }}\ \lambda\approx1+\epsilon_N,\ \ \tfrac{\Delta V}{V_0}\approx\text{tr}\boldsymbol\epsilon,\ \ \alpha_{ij}\approx2\epsilon_{ij}=\gamma_{ij},\ \ \mathbf{R}\approx\mathbf{I}+\boldsymbol\omega\\
&\textbf{Mass: }\ \rho_0=\rho J
\end{aligned}
$$

### 8.4 Concept map (how everything connects)

```
motion  chi(X)  ──grad──►  F  ──F^T F──►  C  ──sqrt──►  U ◄──► principal stretches / directions
                            │               │             │
                            │               └─► stretch λ(N), angle θ(N,M)
                            ├─► J = det F  ──► volume, density (ρ0 = ρJ)
                            ├─► J F^-T    ──► area (Nanson)
                            └─► F = R U   ──► R = rigid rotation
strain:   E = ½(C − I), Biot, Hencky, Seth–Hill   ──linearize (|∇u|≪1)──►   ε = sym ∇u,  ω = skew ∇u
frame indifference:  F* = Q F  ⇒  C, U, E unchanged;  ε is not objective
indicial tools:  δ, ε, ε–δ identity, Q Q^T = I, sym×skew = 0  →  proofs for ALL of the above
```