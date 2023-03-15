---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.13.8
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

## Notations

+++

### Probability measure

+++

Consider a probability space $(\Omega, \mc{E}, P)$ where
- the set $\Omega$ is the sample space,
- the sigma algebra $\mc{E}\subseteq 2^{\Omega}$ is the collection of events, and
- the countably additive function $P\in [0,1]^{\mc{E}}$ is the probability measures.

+++

To consider another probability measure similar to $P$, we simply write $Q\sim P$ to denote another countably additive function $Q$ having the same domain and range as $P$.

+++

### Random variable

+++

A measurable function $\R{Z}\in (\Omega_{\R{Z}}, \mc{E}_{\R{Z}})^{(\Omega, \mc{E})}$ is a random variable, which induces a probability space $(\Omega_{\R{Z}}, \mc{E}_{\R{Z}}, Q_{\R{Z}})$ where $Q_{\R{Z}}:=Q\circ \R{Z}$, for any $Q\sim P$.

:::{note}

$P=P_{\R{I}}$ for the identity map $\R{I}$.

:::

+++

To consider another random variable similar to $\R{Z}$, we simply write $\R{Z}'\sim \R{Z}$ to denote another measureable function $\R{Z}'$ having the same domain and range as $\R{Z}$. 

To specify the distribution of a random variable, we write

- $\R{Z}\sim Q_{\R{Z}}$ to mean $P_{\R{Z}}=Q_{\R{Z}}$ for any $Q\sim P$, and
- $\R{Z}'\sim P_{\R{Z}}$ to mean $P_{\R{Z}'}=P_{\R{Z}}$ for $\R{Z}'\sim \R{Z}$. 

:::{note}

To avoid ambiguity, random variables are denoted by upright capital letters.

:::

+++

### Mean

+++

For any random variable $\R{Z}$ that maps to a topological vector space, its expectation (mean) with respect to $Q\sim P$ is the Lebesgue integral
\begin{align}
E_Q[f(\R{Z})]&:=\int \R{Z} \,dQ \\
&= \int_{\mathrlap{z\in \Omega_{\R{Z}}}} \;z \,dQ_{\R{Z}}(z)
\end{align}

where the first integral can be written explicitly as the integral $\int_{\Omega} \R{Z} \,dQ$ over the entire sample space $\Omega$ for $Q$, and the second integral can be written implicitly as the integral $\int \operatorname{id}_{\Omega_{\R{Z}}} \,dQ_{\R{Z}}$ of the identity function $\operatorname{id}_{\Omega_{\R{Z}}}$ over the sample space $\Omega_{\R{Z}}$ of $\R{Z}$.

$E[\R{Z}]:=E_P[\R{Z}]$ is the expectation (with respect to the default probability measure $P$).

+++ {"tags": []}

### $f$-Divergence

+++

The set of density ratios w.r.t. $\R{Z}'$ is defined as

\begin{align}
\mc{R}_{\R{Z}'}&:=\Set{\left.r\in {[0,\infty)}^{\Omega_{\R{Z}'}} \right| E[r(\R{Z}')]=1}.
\end{align}

By the Radon-Nikodym Theorem, if $P_{\R{Z}}$ is absolutely continuous with respect to $P_{\R{Z}'}$, denoted as $P_{\R{Z}} \ll P_{\R{Z}'}$, then

\begin{align}
P_{\R{Z}}(A)=\int_A r\,dP_{\R{Z}'} \quad \forall A\in \mc{E}_{\R{Z}'}
\end{align}

for some $r\in \mc{R}_{\R{Z}'}$ unique up to a $P_{\R{Z}'}$-null set. Such a density ratio of $P_{\R{Z}}$ with respect to $P_{\R{Z}'}$ is denoted as $\frac{dP_{\R{Z}}}{dP_{\R{Z}'}}$.

+++

For a function $f\in {(-\infty,\infty]}^{[0,\infty)}$ strictly convex with $f(1)=0$, the $f$-divergence from $P_{\R{Z}}$ to $P_{\R{Z}'}\gg P_{\R{Z}}$ is defined as

\begin{align}
D_f(P_{\R{Z}} \| P_{\R{Z}'}) 
&:=
E\left[f\left(\frac{dP_{\R{Z}}}{dP_{\R{Z}'}}(\R{Z}')\right)\right]
\end{align}

+++

### Dual Pairing

+++

For a measurable function $f$ of $\R{Z}'$, $[f]_{\R{Z}'}$ denotes the class of measurable functions $g$ of $\R{Z}'$ equivalent to $f$ up to a $P_{\R{Z}'}$-null set, i.e., for $A\in \mc{E}_{\R{Z}'}$,

\begin{align}
P_{\R{Z}'}(A) = 0 \text{ or } \forall z\in A, f(z)=g(z).
\end{align}

+++

Consider the dual system $(\mc{L}^1_{\R{Z}'}, \mc{L}^\infty_{\R{Z}'}, \langle \cdot, \cdot \rangle_{\R{Z}'})$ where 

- $\mc{L}^p_{\R{Z}'}$ is the $p$-Lebesgue space with respect to measure $P_{\R{Z}'}$ where equality is up to a $P_{\R{Z}'}$-null set, and
- $\langle \cdot, \cdot \rangle_{\R{Z}'}$ is the non-degenerate dual pairing where

    \begin{align}
    \langle r, s\rangle_{\R{Z}'}&:= E[r(\R{Z}')s(\R{Z}')]&& \forall (r, s) \in \mc{L}^1_{\R{Z}'}\times \mc{L}^\infty_{\R{Z}'},
    \end{align}
    
    namely, the correlation of $r$ and $s$ with respect to $P_{\R{Z}'}$.



:::{note}

More explicitly:

- $\mc{L}^1_{\R{Z}'}$ is the set of measureable functions $r$ of $\R{Z}'$ with non-degenerate $1$-norm w.r.t. $P_{\R{Z}'}$

    \begin{align}
    \norm{r}_{\mc{L}^1_{\R{Z}'}} := \int \abs{r}\,dP_{\R{Z}'}.
    \end{align}

- $\mc{L}^\infty_{\R{Z}'}$ is the set of measurable functions $s$ of $\R{Z}'$ with non-degenerate $\infty$-norm w.r.t. $P_{\R{Z}'}$

    \begin{align}
    \norm{s}_{\mc{L}^\infty_{\R{Z}'}}:=\inf\Set{c\geq 0 \left| \forall A\in \mc{E}_{\R{Z}'},\sup_{z\in A} \abs{s(z)} \leq c \text{ or } P_{\R{Z}'}(A)=0\right.},
    \end{align}
    
    which is the supremum up to a $P_{\R{Z}'}$-null set.
    
Duality means

- $r\in \mc{L}_{\R{Z}'}^1$ and  $\langle r, \cdot \rangle_{\R{Z}'} = 0$ implies $r\in [0]_{\R{Z}'}$.
- $s\in \mc{L}_{\R{Z}'}^\infty$ and  $\langle \cdot, s \rangle_{\R{Z}'} = 0$ implies $s \in [0]_{\R{Z}'}$.

:::

+++

For any set $\mc{R}\subseteq \mc{L}^1_{\R{Z}'}$ and $\mc{S}\subseteq \mc{L}^\infty_{\R{Z}'}$, consider the linear maps $\langle \mc{R}, \cdot \rangle_{\R{Z}'}\in ((-\infty, \infty)^{\mc{R}})^{\mc{L}^\infty_{\R{Z}'} }$ and $\langle \mc{S}, \cdot \rangle_{\R{Z}'}\in ((-\infty, \infty)^{\mc{S}})^{\mc{L}^1_{\R{Z}'} }$ where

\begin{align}
\langle \mc{R}, s \rangle_{\R{Z}'}[r]:= \langle r, s\rangle_{\R{Z}'} && \text{for $s\in \mc{L}^\infty_{\R{Z}'}$ and $r\in \mc{R}$}\\
\langle r, \mc{S} \rangle_{\R{Z}'}[s]:= \langle r, s\rangle_{\R{Z}'} && \text{for $r\in \mc{L}^1_{\R{Z}'}$ and $s\in \mc{S}$}.
\end{align}

Their kernels are

\begin{align}
\operatorname{Ker}(\langle \mc{R}, \cdot \rangle_{\R{Z'}}) &= \Set{s\in \mc{L}^\infty_{\R{Z}'} |\forall r\in\mc{R}, \langle r,s \rangle_{\R{Z'}} = 0 }\\
\operatorname{Ker}(\langle \cdot, \mc{S} \rangle_{\R{Z'}}) &= \Set{r\in \mc{L}^1_{\R{Z}'} |\forall s\in\mc{S}, \langle r,s \rangle_{\R{Z'}} = 0 }.
\end{align}

:::{admonition} Example

The duality of $\mc{L}^1_{\R{Z}'}$ and $ \mc{L}^\infty_{\R{Z}'}$ means

\begin{align}
\operatorname{Ker}(\langle \mc{L}^1_{\R{Z}'}, \cdot \rangle_{\R{Z'}}) = 
\operatorname{Ker}(\langle \cdot, \mc{L}^\infty_{\R{Z}'} \rangle_{\R{Z'}}) = \Set{[0]_{\R{Z}'}}. 
\end{align} 

:::

+++

### Convex Conjugate

+++

Using the above dual pairing, the convex conjugate of $F\in (-\infty, \infty]^{ \mc{L}^1_{\R{Z}'}}$ and $G \in (-\infty, \infty]^{ \mc{L}^\infty_{\R{Z}'}}$ are respectively

\begin{align}
[F]^*_{\mc{L}^1_{\R{Z}'}}[s]&:= \sup_{r\in \mc{L}^1_{\R{Z}'}} \langle r,s \rangle_{\R{Z}'} - F[r] && \text{for } s\in \mc{L}^\infty_{\R{Z}'}\\
[G]^*_{\mc{L}^\infty_{\R{Z}'}}[r]&:= \sup_{r\in \mc{L}^\infty_{\R{Z}'}} \langle r,s \rangle_{\R{Z}'} - G[s] && \text{for } r\in \mc{L}^1_{\R{Z}'},
\end{align}

which are convex functionals. For simplicity, we may simply write $F^*$ and $G^*$ as the convex conjugates if the parameter space for the supremum is clear from the context.

+++

:::{admonition} **Example**

The characteristic function of a set $\mc{R}$ is defined as

\begin{align}
\delta_{\mc{R}}[r] &:=
\begin{cases}
0 & r\in \mc{R}\\
\infty & \text{otherwise},
\end{cases}
\end{align}

which is convex iff $\mc{R}$ is convex. For $\mc{R}\in \mc{L}^1_{\R{Z}'}$ and $\mc{S}\in \mc{L}^\infty_{\R{Z}'}$

\begin{align}
[\delta_{\mc{R}}]^*_{\mc{L}^1_{\R{Z}'}}[s]
&:= \sup_{r\in \mc{L}^1_{\R{Z}'}} \langle r,s \rangle_{\R{Z}'} - \delta_{\mc{R}}[r] && \text{for $s\in \mc{L}^\infty_{\R{Z}'}$}\\
&= \sup_{r\in \mc{R}} \langle r,s \rangle_{\R{Z}'}\\
[\delta_{\mc{S}}]^*_{\mc{L}^\infty_{\R{Z}'}}[r]
&:= \sup_{s\in \mc{L}^\infty_{\R{Z}'}} \langle r,s \rangle_{\R{Z}'} - \delta_{\mc{S}}[s] && \text{for $r\in \mc{L}^1_{\R{Z}'}$}\\
&= \sup_{s\in \mc{S}} \langle r,s \rangle_{\R{Z}'}.
\end{align}

:::

+++

By the Frenchel inequality,

\begin{align}
F \geq [[F]^*]^*,
\end{align}

and equality holds if $F$ is convex, in which case the convex conjugation is an involution.

+++

### Infimal Convolution Theorem

+++

The infimal convolution $\square$ of two functions $f_1,f_2\in (-\infty, \infty]^X$ with the same domain $X$ is 

\begin{align}
(f_1 \square f_2)(x')
&:=\inf_{\substack{x_1, x_2\in X:\\ x_1+x_2=x'}} f_1(x_1) + f_2(x_2)&& \text{for $x'\in X$}\\
&=\inf_{x\in X} f_1(x) + f_2(x'-x).
\end{align}

+++

By the infimal convolution theorem,

\begin{align}
[F_1+F_2]^* &= F_1^* \square F_2^*\\
[F_1\square F_2]^* &= F_1^*+F_2^*
\end{align}

for $F_1, F_2$ from the same space of a dual system.

+++

:::{admonition} **Example**

For any set $r'\in \mc{L}^1_{\R{Z}'} \supseteq\mc{R}\subseteq $ and $s'\in \mc{L}^\infty_{\R{Z}'}\supseteq \mc{S}$, 

\begin{align}
[F + \delta_{\mc{R}}]^*[s'] 
&= \inf_{s\in \mc{L}^\infty_{\R{Z}'}} F^*[s] + \sup_{r\in \mc{R}} \langle r,s'-s \rangle_{\R{Z}'}\\
&= \inf_{s'-s\in \operatorname{Ker}(\langle \mc{R}, \cdot \rangle)} F^*[s]\\
[G + \delta_{\mc{S}}]^*[r'] 
&= \inf_{s\in \mc{L}^\infty_{\R{Z}'}} G^*[r] + \sup_{s\in \mc{S}} \langle r'-r,s \rangle_{\R{Z}'}\\
&= \inf_{r'-r\in \operatorname{Ker}(\langle \cdot, \mc{S} \rangle)} G^*[r].
\end{align}

:::

+++

### DV Formula

+++

The Frenchel inequality gives the variational formula for $f$-divergence below:

+++

:::{admonition} **Theorem** (DV formula for $f$-divergence)

For $P_{\R{Z}}\ll P_{\R{Z}'}$ and a function $f\in {(-\infty,\infty]}^{[0,\infty)}$ strictly convex with $f(1)=0$, 

\begin{align}
D_f(P_{\R{Z}}\|P_{\R{Z}'})&\geq \sup_{s\in \mc{L}^{\infty}_{\R{Z}'}} E[s(\R{Z})] - F^*[s],
\end{align}

where

\begin{align}
F[r]&:=E\left[f(r(\R{Z})) \right] + \delta_{\mc{R}}[r]
\end{align}

for any $\mc{R}\subseteq \mc{L}^1_{\R{Z}'}$. The lower bound for every $s$ is non-increasing in $\mc{R}$. It is tight if $\mc{R}$ is a convex set, such as $\mc{R}_{\R{Z}'}$, that intersects $\left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}$. 

:::

+++

:::{admonition} Proof

By the Frenchel inequality,

\begin{align}
F[r] &\geq \sup_{s\in \mc{L}^{\infty}_{\R{Z}'}} \langle r,s \rangle_{\R{Z}'} - F^*[s],
\end{align}

which holds with equality if $\mc{R}$ is convex. Furthermore, $F[r]$ evaluates to the $f$-Divergence at any $r$ in $\left[\frac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}\cap \mc{R}$, if the intersection is non-empty. The bound for every $s$ is non-increasing in $\mc{R}$ because $F^*[s]$ is non-decreasing in $\mc{R}$.

:::

+++

:::{admonition} **Example**

The KL-divergence 

\begin{align}
D_f(P_{\R{Z}}\|P_{\R{Z}'})&= \sup_{s\in \mc{L}^{\infty}_{\R{Z}'}} \underbrace{E[s(\R{Z})] - \log E[e^{s(\R{Z}')}]}_{\geq}\\
&= \sup_{s\in \mc{L}^{\infty}_{\R{Z}'}} \overbrace{E[s(\R{Z})] - e^{-1}E[s(\R{Z}')]},
\end{align}

where the expressions are obtained from the DV formula with $\mc{R} = \mc{R}_{\R{Z}'}$ and $\mc{R}=\mc{L}^{\infty}_{\R{Z}'}$ respectively.

:::

+++

:::{important}

- How to recover a density ratio $\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}$ from an optimal $s$ to the DV formula?
- Is it meaningful to consider $\mc{R}$ that does not overlap with $\left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}$?

:::

+++

### Reproducing Kernel Hilbert Space

+++

A positive type function $K\in (-\infty, \infty)^{Z^2}$ is a reproducing kernel, which induces a reproducing kernel Hilbert space (RKHS) $\mc{H}_K\subseteq (-\infty, \infty)^{Z}$ with inner product $\langle\cdot ,\cdot\rangle_K$ (and norm $\norm{\cdot}_K$) satisfying the reproducing property that, for all $z\in Z$ and $s\in \mc{H}_K$,

\begin{align}
\overbrace{K(\cdot, z)}^{K_z :=} &\in \mc{H}_K\\
\langle s, K_z\rangle_K &= s(z).
\end{align}

$K_z$ is called the $z$-point evaluation embedding. It is the unique element in $\mc{H}$ such such that $s\in \mc{H}_K\mapsto \langle s, K_z\rangle_K$ gives the point evaluation function $s\in \mc{H}_K \mapsto s(z)$ at $z$. The mapping from $z\in Z$ to $K_z$ is called the canonical feature map.

+++

For any $\R{Z}'$ with $Z\supseteq \Omega_{\R{Z}'}$, the restriction of $\mc{H}_K$ to $\R{Z}'$ is

\begin{align}
\mc{H}_K|_{\R{Z}'} &:=\Set{\left.s|_{\Omega_{\R{Z}'}}\right|s \in \mc{H}_K }&& \text{where}\\
s|_{\Omega_{\R{Z}'}} &: z\in \Omega_{\R{Z}'} \mapsto s(z),
\end{align}

which is the function $s$ restricted to the domain $\Omega_{\R{Z}'}$.

By the reproducing property, the condition $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$ is equivalent to

\begin{align}
K_z|_{\Omega_{\R{Z}'}} &\in \mc{L}^{\infty}_{\R{Z}'}&& \forall z\in Z.
\end{align}

+++

### Correlation Embedding

+++

By the Riesz representation theorem, each bounded linear functional on a RKHS has a unique embedding in the RKHS. An example is the correlation embedding defined below.

+++

:::{admonition} **Definition** (Correlation map)

For some reproducing kernel $K\subseteq (-\infty, \infty)^{Z^2}$ and $\R{Z}'$ such that $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$, define for all 

\begin{align}
 \mu_{\R{Z}'}[r](z)&:=\langle r, K_z|_{\Omega_{\R{Z}'}} \rangle_{\R{Z}'}\\
 &= E[r(\R{Z}')K_{\R{Z}'}(z)]
\end{align}

for all $r\in \mc{L}^1_{\R{Z}'}$ and $z\in Z$.

:::

+++

The following result, which is stated in a way analogous to the reproducing property, shows that $\mu_{\R{Z}'}[r]$ is the $r$-correlation embedding with respect to the measure $P_{\R{Z}'}$, and $\mu_{\R{Z}'}$ is the correlation map.

+++

:::{admonition} **Proposition**


Suppose $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$ for some $\R{Z}'$ and reproducing kernel $K$. For all $r\in \mc{L}^1_{\R{Z}'}$ and $s\in \mc{H}_K$, 

\begin{align}
\mu_{\R{Z}'}[r] &\in \mc{H}_K \\
\langle s, \mu_{\R{Z}'}[r]\rangle_K &= \langle r, s\rangle_{\R{Z}'}\\
&=E[r(\R{Z}')s(\R{Z}')].
\end{align}

:::

+++

:::{admonition} Proof

Recall that

\begin{align}
\mu_{\R{Z}'}[r](z)&= \langle r, K_z|_{\Omega_{\R{Z}'}} \rangle_{\R{Z}'},
\end{align}

i.e., the dual pairing of $r$ with the $z$-point evaluation embedding restricted to $\Omega_{\R{Z}'}$. Since $K_z|_{\Omega_{\R{Z}'}}\in  \mc{L}^{\infty}_{\R{Z}'}$, the dual pairing is a bounded linear function of $r\in \mc{L}^1_{\R{Z}'}$, and so $\mu_{\R{Z}'}[r]\in \mc{H}_K$ as desired. Furthermore,

\begin{align}
\langle s, \mu_{\R{Z}'}[r]\rangle_K
&=\langle s, \langle r, K_z\rangle_{\R{Z}'}\rangle_K\\
&=\langle r, \langle s, K_z\rangle_K\rangle_{\R{Z}'} && \text{by linearity}\\
&=\langle r, s \rangle_{\R{Z}'} && \text{by the reproducing property},
\end{align}

which gives $E[r(\R{Z}')K_z(\R{Z}')]$ by definition.

:::

+++

### Kernel-Based Formula

+++

:::{admonition} Lemma

Consider $\R{Z}'\sim K$ for a reproducing kernel $K\subseteq (-\infty,\infty)^Z$, a convex function $G\in (-\infty, \infty]^{ \mc{L}^{1}_{\R{Z}'}}$, and its convex conjugate $G^*\in (-\infty, \infty]^{ \mc{L}^{\infty}_{\R{Z}'}}$. For any $r'\in \mc{L}^{1}_{\R{Z}'}$, 

\begin{align}
G[r']
&\geq \sup_{s \in \mc{H}_K|_{\R{Z}'}} \langle r', s\rangle_{\R{Z}'} - G^*[s]\\
&= \inf_{\substack{r\in \mc{L}^1_{\R{Z}'}:\\ \mathclap{\mu_{\R{Z}'}[r']=\mu_{\R{Z}'}[r]}}} G[r].
\end{align}

The inequality holds with equality iff the supremum remains unchanged with $\mc{H}_K|_{\R{Z}'}$ replaced by $\mc{L}^\infty_{\R{Z}'}$. Furthermore, the infimum has a unique solution $r=r'$ iff $\mc{H}_{K}|_{\R{Z}'}\subseteq \mc{L}^\infty_{\R{Z}'}$ is total for the dual pairing $\langle \cdot, \cdot \rangle_{\R{Z}'}$, i.e., for all $r\in \mc{L}^1_{\R{Z}'}$, we have $r'=0$ up to a $P_{\R{Z}'}$-null set if

\begin{align}
\langle r,K_z|_{\Omega_{\R{Z}'}}\rangle &= 0 && \forall z\in Z.
\end{align}

:::

+++

:::{admonition} Proof

Since convex conjugation is a involution,

\begin{align}
G[r'] &= \sup_{s \in \mc{L}^\infty_{\R{Z}'}} \langle r', s\rangle_{\R{Z}'} - G^*[s]\\
&\geq \sup_{s \in \mc{H}_K|_{\R{Z}'}} \langle r', s\rangle_{\R{Z}'} - G^*[s]\\
&= \sup_{s \in \mc{H}_K|_{\R{Z}'}} \langle r', s\rangle_{\R{Z}'} - \left[\sup_{r\in \mc{L}^1_{\R{Z}'}} \langle r, s\rangle_{\R{Z}'} - G[r]\right]\\
&=  \sup_{s \in \mc{H}_K|_{\R{Z}'}}\inf_{r\in \mc{L}^1_{\R{Z}'}} \langle r'-r, s\rangle_{\R{Z}'} + G[r]\\
&=  \inf_{r\in \mc{L}^1_{\R{Z}'}} \sup_{s \in \mc{H}_K|_{\R{Z}'}} \underbrace{\langle r'-r, s\rangle_{\R{Z}'}}_{=\langle s, \mu_{\R{Z}'}[r'-r]\rangle_K} + G[r]\\
&=  \inf_{r\in \mc{L}^1_{\R{Z}'}} G[r] + \underbrace{\sup_{s \in \mc{H}_K|_{\R{Z}'}} \langle s, \mu_{\R{Z}'}[r'-r]\rangle_K}_{=\delta_{\Set{\mu_{\R{Z}'}[r']}}[\mu_{\R{Z}'}[r]] }\\
&= \inf_{\substack{r\in \mc{L}^1_{\R{Z}'}:\\ \mathclap{\mu_{\R{Z}'}[r']=\mu_{\R{Z}'}[r]}}} G[r]
\end{align}

as desired. The equality condition is obvious. $\mu_{\R{Z}'}[r']=\mu_{\R{Z}'}[r]$ implies $r'=r$ iff $\mc{H}_K|_{\R{Z}'}$ is total since 

\begin{align}
\mu_{\R{Z}'}[r'-r](z)&= \langle r'-r, K_z|_{\Omega_{\R{Z}'}} \rangle_{\R{Z}'}.
\end{align}

:::

+++

Applying the above lemma with

\begin{align}
r' &:= \frac{dP_{\R{Z}}}{dP_{\R{Z}'}}\\
G^*[s] &:= F^*[s] +  G_0^*[s]\\
G^*_0[s] &:= \frac{\norm{s}_K}{4\lambda} + \delta_{\mc{H}_K}[s]
\end{align}

and noticing that

\begin{align}
G_0[r]&:= \sup_{s\in \mc{L}^\infty_{\R{Z}'}} \langle r,s \rangle_{\R{Z}'} - G_0^*[s]\\
&= \lambda \norm{\mu_{\R{Z}'}[r]}_K \\
G[r'] &= \inf_{r\in \mc{L}^1_{\R{Z}'}} F[r] + G_0[r'-r]
\end{align}

+++

:::{admonition} **Theorem** (Kernel-based formula for $f$-divergence)

For $P_{\R{Z}}\ll P_{\R{Z}'}$, a function $f\in {(-\infty,\infty]}^{[0,\infty)}$ strictly convex with $f(1)=0$, and a reproducing kernel $K\subseteq (-\infty, \infty)^{Z^2}$ such that $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$,

\begin{align}
D_f(P_{\R{Z}}\|P_{\R{Z}'})&\geq \sup_{\lambda>0} \underbrace{\sup_{s\in \mc{H}} E[s(\R{Z})] - F^*[s] - \frac1{4\lambda} \norm{s}_K}_{\alpha(\lambda):=}\\
&= \sup_{\lambda>0} \overbrace{\inf_{r\in \mc{R}} E\left[(f(r(\R{Z})) \right] + \lambda\norm{E[K_{\R{Z}}]-\mu_{\R{Z}'}[r]}_K}^{\beta(\lambda):=}\\
&= \inf_{\substack{r\in \mc{R}:\\ \mu_{\R{Z}'}[r]=E[K_{\R{Z}}]}} E\left[(f(r(\R{Z})) \right]
\end{align}

where

\begin{align}
F[r]&:=E\left[(f(r(\R{Z})) \right] + \delta_{\mc{R}}[r]
\end{align}

for any $\mc{R}\subseteq \mc{L}^1_{\R{Z}'}$. Furthermore, $\alpha=\beta$ and the bounds are non-increasing in $\mc{R}$ and non-decreasing in $\lambda$ and $\mc{H}$. It is tight if $\mc{R}$ is a convex set, such as $\mc{R}_{\R{Z}'}$, that intersects $\left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}$, and 

\begin{align}
\operatorname{Ker}(\langle \cdot, \mc{H}|_{\R{Z}'} \rangle_{\R{Z'}}) \cap \left(\mc{R}-\left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}\right) \subseteq [0]_{\R{Z}'},
\end{align}

in which case $r\in \mc{R}$ and $\mu_{\R{Z}'}[r]=E[K_{\R{Z}}]$ implies $r\in \left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}$.

:::

+++

:::{admonition} Proof

Let 

\begin{align}
r' &\in\left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}\\
G[s]&:= 
\begin{cases}
\frac1{4\lambda} \norm{s}_K & s\in \mc{H}|_{\R{Z}'}\\
\infty & \text{otherwise}.
\end{cases}
\end{align}

Then,

\begin{align}
\alpha(\lambda)&=\sup_{s\in \mc{H}} E[s(\R{Z})] - F^*[s] - \frac1{4\lambda} \norm{s}_K\\
&=\sup_{s\in \mc{L}^\infty(\R{Z}')} \left\langle r', s(\R{Z}) \right\rangle_{\R{Z}'} - (F^*+G)[s]\\
&=[F^*+G]^*[r']
\end{align}

To compute the above convex conjugate, note that

\begin{align}
\operatorname{Ker}(\langle \cdot, \mc{H}|_{\R{Z}'} \rangle_{\R{Z'}}) &= \Set{r\in \mc{L}^1_{\R{Z}'} \left|\forall s\in\mc{H}|_{\R{Z}'}, \langle r,s \rangle_{\R{Z'}} = 0 \right.}\\
 &= \Set{r\in \mc{L}^1_{\R{Z}'} \left|\forall s\in\mc{H}|_{\R{Z}'}, \langle s,\mu_{\R{Z}'}[r] \rangle_K = 0 \right.}\\
 &= \Set{r\in \mc{L}^1_{\R{Z}'} \left|\mu_{\R{Z}'}[r] = 0 \right.}\\
G^*[r']&= \inf_{r'-r\in \operatorname{Ker}(\langle \cdot, \mc{H}|_{\R{Z}'} \rangle_{\R{Z'}})} \lambda \norm{\mu_{\R{Z}'}[r]}_K\\
&= \inf_{\substack{r\in \mc{L}^1_{\R{Z}'}:\\ \mu_{\R{Z}'}[r] =\mu_{\R{Z}'}[r']}} \lambda \norm{\mu_{\R{Z}'}[r]}_K
\end{align}

Hence,

\begin{align}
\alpha(\lambda)&=[F^*+G]^*[r']\\
&= [F\square G^*][r']\\
&= \inf_{r\in \mc{L}^1_{\R{Z}'}} F[r] + G^*[r'-r]\\
&= \inf_{r\in \mc{L}^1_{\R{Z}'}} E[f(r(\R{Z}))] + \delta_{\mc{R}}[r] + \lambda \norm{\mu_{\R{Z}'}[r'-r]}_K \\
&= \inf_{r\in \mc{R}} E[f(r(\R{Z}))] + \lambda \norm*{\underbrace{\mu_{\R{Z}'}[r']}_{=E[K_{\R{Z}}]}-\mu_{\R{Z}'}[r]}_K\\
&= \beta(\lambda)
\end{align}

\begin{align}
\sup_{\lambda >0} \beta(\lambda)
&= \inf_{r\in \mc{R}} E[f(r(\R{Z}))] + \sup_{\lambda >0} \lambda \norm*{E[K_{\R{Z}}]-\mu_{\R{Z}'}[r]}_K\\
&= \inf_{\substack{r\in \mc{R}:\\ \mu_{\R{Z}'}[r]=E[K_{\R{Z}}]}} E\left[(f(r(\R{Z})) \right]
\end{align}

The bound is tight if $r\in \mc{R}$ and $\mu_{\R{Z}'}[r]=E[K_{\R{Z}}]$ implies $r\in \left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}$. This follows from the desired equality condition because

\begin{align}
r\in \mc{R} &\iff r-r' \in \mc{R}-\Set{\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}}\\
\mu_{\R{Z}'}[r]=E[K_{\R{Z}}] &\iff r-r'\in \operatorname{Ker}(\langle \cdot, \mc{H}|_{\R{Z}'} \rangle_{\R{Z'}}) \\
r\in \left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'} &\iff r-r'\in \left[0\right]_{\R{Z}'}.
\end{align}

:::
