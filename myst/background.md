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

+++ {"tags": []}

## Background

+++

### Probability measure

+++

We consider, by default, a probability space $(\Omega, \mc{E}, P)$ where
- the set $\Omega$ is the sample space,
- the sigma algebra $\mc{E}\subseteq 2^{\Omega}$ is the collection of events, and
- the countably additive function $P\in [0,1]^{\mc{E}}$ is the probability measure.

+++

$Q\sim P$ denotes another probability measure similar to $P$ in the sense that $Q$ is a countably additive function in $[0,1]^{\mc{E}}$.

:::{note}

In other words, $Q$ is chosen from the set of probability measures on the measurable space $(\Omega, \mc{E})$.

:::

+++

$Q\ll P$ means a measure $Q$ is absolutely continuous with respect to another measure $P$, i.e., 

\begin{align}
P(A)=0\implies Q(A)=0
\end{align}

for all $A$ measurable by $P$. 

:::{note}

The support of $Q\sim P$ is $\bigcup\Set{A|Q(A)>0}$. A $Q$-null set is a measurable set $A$ non-overlapping with the support of $Q$, i.e., with $Q(A)=0$. Hence, $Q\ll P$ means

- a $Q$-null set is also a $P$-null set, or equivalently,
- the support of $Q$ is contained by the support of $P$.

:::

+++

### Random variable

+++

A letter $\R{Z}$ in upright font denotes a random variable, which is a measurable function from the measurable space $(\Omega, \mc{E})$ to another measurable space $(\Omega_{\R{Z}}, \mc{E}_{\R{Z}})$. 

:::{note}

More precisely, for $\R{Z}$ to be a random variable, $\mc{E}_{\R{Z}}$ is a sigma algebra and

\begin{align}
\sigma(\R{Z})&:=\Set{\R{Z}^{-1}(A)|A\in \mc{E}_{\R{Z}}} \subseteq \mc{E}\\
\R{Z}^{-1}(A)&:=\Set{\R{Z}^{-1}(z)|z\in A},
\end{align}

i.e., $\mc{E}_{\R{Z}}$ defines a set of events, the preimages of which through $\R{Z}$ are measurable in the original measurable space.

:::

+++

For any $Q\sim P$, $\R{Z}$ induces a probability space $(\Omega_{\R{Z}}, \mc{E}_{\R{Z}}, Q_{\R{Z}})$ where $Q_{\R{Z}}(A):=Q(\R{Z}^{-1}(A))$ for all $A\in \mc{E}_{\R{Z}}$.

:::{admonition} **Example**

$P=P_{\R{I}}$ for the identity map $\R{I}:\omega \in \Omega \mapsto \omega \in \Omega_{\R{I}}:=\Omega$ and $\mc{E}_{\R{I}}=\mc{E}$.

:::

+++

$\R{Z}'\sim \R{Z}$ denotes another random variable $\R{Z}'$ similar to $\R{Z}$ in the sense that $\R{Z}'$ maps to the same measurable space as $\R{Z}$ does, i.e., $(\Omega_{\R{Z}'}, \mc{E}_{\R{Z}'})=(\Omega_{\R{Z}}, \mc{E}_{\R{Z}})$.

+++

To specify the distribution of a random variable,

- $\R{Z}\sim Q_{\R{Z}}$ means $P_{\R{Z}}=Q_{\R{Z}}$ for any $Q\sim P$, and
- $\R{Z}'\sim P_{\R{Z}}$ means $P_{\R{Z}'}=P_{\R{Z}}$ for $\R{Z}'\sim \R{Z}$.

+++

### Mean

+++

For any random variable $\R{Z}$ that maps to a topological vector space, its expectation (mean) with respect to $Q\sim P$ is the Lebesgue integral

\begin{align}
E_Q[\R{Z}]&:=\int \R{Z} \,dQ\\
&= \int_{\mathrlap{z\in \Omega_{\R{Z}}}} \;z \,dQ_{\R{Z}}(z)
\end{align}

where the first integral can be written explicitly as the integral $\int_{\Omega} \R{Z} \,dQ$ over the entire sample space $\Omega$ for $Q$, and the second integral can be written implicitly as the integral $\int \operatorname{id}_{\Omega_{\R{Z}}} \,dQ_{\R{Z}}$ of the identity function $\operatorname{id}_{\Omega_{\R{Z}}}$ over the sample space $\Omega_{\R{Z}}$ of $\R{Z}$.

$E[\R{Z}]:=E_P[\R{Z}]$ is the expectation with respect to the default probability measure $P$.

+++

:::{note}

The subscripted expectation can be avoided with $\R{Z}'\sim Q_{\R{Z}}$, which gives

\begin{align}
E[\R{Z}'] = E_Q[\R{Z}].
\end{align}

The dummy random variable $\R{Z}'$ may be further assumed to be independent of $\R{Z}$ in cases where its dependency with $\R{Z}$ is immaterial.

:::

+++ {"tags": []}

### $f$-Divergence

+++

The set of density ratios w.r.t. $\R{Z}'$ is defined as

\begin{align}
\mc{R}_{\R{Z}'}&:=\Set{\left.r\in {[0,\infty)}^{\Omega_{\R{Z}'}} \right| E[r(\R{Z}')]=1}.
\end{align}

By the Radon-Nikodym Theorem, if $P_{\R{Z}} \ll P_{\R{Z}'}$, then

\begin{align}
P_{\R{Z}}(A)=\int_A r\,dP_{\R{Z}'} \quad \forall A\in \mc{E}_{\R{Z}'}
\end{align}

for some $r\in \mc{R}_{\R{Z}'}$ unique up to a $P_{\R{Z}'}$-null set. Such a density ratio of $P_{\R{Z}}$ with respect to $P_{\R{Z}'}$ is denoted as $\frac{dP_{\R{Z}}}{dP_{\R{Z}'}}$.

+++

For a function $f\in {(-\infty,\infty]}^{[0,\infty)}$ strictly convex with $f(1)=0$, the $f$-divergence from $P_{\R{Z}}$ to $P_{\R{Z}'}\gg P_{\R{Z}}$ is defined as

\begin{align}
D_f(P_{\R{Z}} \| P_{\R{Z}'}) 
&:=
E\left[f\left(\frac{dP_{\R{Z}}}{dP_{\R{Z}'}}(\R{Z}')\right)\right].
\end{align}

:::{admonition} **Example**

KL-divergence is the special case when $f(u) = u\log u$, in which case

\begin{align}
D(P_{\R{Z}} \| P_{\R{Z}'})&:=D_f(P_{\R{Z}} \| P_{\R{Z}'})\\
&= E\left[\frac{dP_{\R{Z}}}{dP_{\R{Z}'}}(\R{Z}')\log \frac{dP_{\R{Z}}}{dP_{\R{Z}'}}(\R{Z}')\right]\\
&= E\left[\log \frac{dP_{\R{Z}}}{dP_{\R{Z}'}}(\R{Z})\right].
\end{align}

:::

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
    \norm{r}^2_{\mc{L}^1_{\R{Z}'}} := \int \abs{r}\,dP_{\R{Z}'}.
    \end{align}

- $\mc{L}^\infty_{\R{Z}'}$ is the set of measurable functions $s$ of $\R{Z}'$ with non-degenerate $\infty$-norm w.r.t. $P_{\R{Z}'}$

    \begin{align}
    \norm{s}^2_{\mc{L}^\infty_{\R{Z}'}}:=\inf\Set{c\geq 0 \left| \forall A\in \mc{E}_{\R{Z}'},\sup_{z\in A} \abs{s(z)} \leq c \text{ or } P_{\R{Z}'}(A)=0\right.},
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

where equality holds if $F$ is convex, in which case the convex conjugation is an involution.

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

:::{admonition} **Proposition**

For any $F\in (-\infty, \infty]^{\mc{L}^1_{\R{Z}'}}$ and $G\in (-\infty, \infty]^{\mc{L}^\infty_{\R{Z}'}}$,

\begin{align}
[F + \delta_{\mc{R}}]^*[s'] 
% &= \inf_{s\in \mc{L}^\infty_{\R{Z}'}} \left[F^*[s] + \sup_{r\in \mc{R}} \langle r,s'-s  \rangle_{\R{Z}'}\right]\\
&= \inf_{s'-s\in \operatorname{Ker}(\langle \mc{R}, \cdot \rangle)} F^*[s]\\
[G + \delta_{\mc{S}}]^*[r'] 
% &= \inf_{r\in \mc{L}^1_{\R{Z}'}} \left[G^*[r] + \sup_{s\in \mc{S}} \langle r'-r,s \rangle_{\R{Z}'}\right]\\
&= \inf_{r'-r\in \operatorname{Ker}(\langle \cdot, \mc{S} \rangle)} G^*[r]
\end{align}

for any $r'\in \mc{L}^1_{\R{Z}'} \supseteq\mc{R}\subseteq $ and $s'\in \mc{L}^\infty_{\R{Z}'}\supseteq \mc{S}$.

:::

+++

:::{admonition} **Proof**

By the infimal convolution theorem,

\begin{align}
[F + \delta_{\mc{R}}]^*[s'] 
&= \inf_{s\in \mc{L}^\infty_{\R{Z}'}} \bigg[F^*[s] + \underbrace{\sup_{r\in \mc{R}} \langle r,s'-s \rangle_{\R{Z}'}}_{\mathrlap{\text{$\geq 0$ with equality iff $s'-s\in \operatorname{Ker}(\langle \mc{R}, \cdot \rangle)$}}}\bigg]\\
&= \inf_{s'-s\in \operatorname{Ker}(\langle \mc{R}, \cdot \rangle)} F^*[s]
\end{align}

Similarly,

\begin{align}
[G + \delta_{\mc{S}}]^*[r'] 
&= \inf_{r\in \mc{L}^1_{\R{Z}'}} \left[G^*[r] + \sup_{s\in \mc{S}} \langle r'-r,s \rangle_{\R{Z}'}\right]\\
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

:::{admonition} **Proof**

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

Given a field $Z$, a positive type function $K\in (-\infty, \infty)^{Z^2}$ is a reproducing kernel, which induces a reproducing kernel Hilbert space (RKHS) $\mc{H}_K\subseteq (-\infty, \infty)^{Z}$ with inner product $\langle\cdot ,\cdot\rangle_K$ (and norm $\norm{\cdot}^2_K$) satisfying the reproducing property that, for all $z\in Z$ and $t\in \mc{H}_K$,

\begin{align}
\overbrace{K(\cdot, z)}^{K_z :=} &\in \mc{H}_K\\
\langle t, K_z\rangle_K &= t(z).
\end{align}

$K_z$ is called the $z$-point evaluation embedding. It is the unique element in $\mc{H}$ such that $t\in \mc{H}_K\mapsto \langle t, K_z\rangle_K$ gives the point evaluation function $t\in \mc{H}_K \mapsto s(z)$ at $z$. The mapping from $z\in Z$ to $K_z$ is called the canonical feature map.

+++

For any $\R{Z}'$ with $Z\supseteq \Omega_{\R{Z}'}$, the restriction of $\mc{H}_K$ to $\R{Z}'$ is

\begin{align}
\mc{H}_K|_{\R{Z}'} &:=\Set{\left.t|_{\Omega_{\R{Z}'}}\right|t\in \mc{H}_K }&& \text{where}\\
t|_{\Omega_{\R{Z}'}} &: z\in \Omega_{\R{Z}'} \mapsto t(z),
\end{align}

which is the function $t$ restricted to the domain $\Omega_{\R{Z}'}$.

+++

If $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$, we define for any functional $M\in (-\infty, \infty]^{\mc{H}_K}$,

\begin{align}
M|_{\R{Z}'}[s]&:= \inf_{\substack{t\in \mc{H}_K:\\ t|_{\Omega_{\R{Z}'}}= s}} M[t]
\end{align}

for all $s\in \mc{L}^\infty_{\R{Z}'}$.

+++

:::{admonition} **Proposition**

For any $\R{Z}'$ and reproducing kernel $K\in (-\infty,\infty)^{Z^2}$ with $\Omega_{\R{Z}'}\subseteq Z$, we have  $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^\infty_{\R{Z}'}$ iff 

\begin{align}
E[K(\R{Z}', \R{Z}')] < \infty.
\end{align}

:::

+++

:::{admonition} **Proof**

By the reproducing property, the condition $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$ is equivalent to

\begin{align}
K_z|_{\Omega_{\R{Z}'}} &\in \mc{L}^{\infty}_{\R{Z}'}&& \forall z\in Z,
\end{align}

which happens iff

\begin{align}
1&=P\left[\sup_{z\in Z} K_z|_{\Omega_{\R{Z}'}}({\R{Z}'})< \infty\right] \\
&= P\bigg[\sup_{z\in Z} \underbrace{K_z({\R{Z}'})}_{
\begin{aligned}
&\langle K_z, K_{\R{Z}'}\rangle_K\\
&\leq \norm{K_{\R{Z}'}}^2_K
\end{aligned}}< \infty\bigg]\\
&= P[K(\R{Z}', \R{Z}')<\infty],
\end{align}

which holds iff $E[K(\R{Z}', \R{Z}')]<\infty$ as desired.


:::

+++

### Correlation Embedding

+++

By the Riesz representation theorem, each bounded linear functional on an RKHS has a unique embedding in the RKHS. An example is the correlation embedding defined below.

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

Suppose $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$ for some $\R{Z}'$ and reproducing kernel $K$. For all $r\in \mc{L}^1_{\R{Z}'}$ and $t\in \mc{H}_K$, 

\begin{align}
\mu_{\R{Z}'}[r] &\in \mc{H}_K \\
\langle t, \mu_{\R{Z}'}[r]\rangle_K &= \langle r, t|_{\Omega_{\R{Z}'}}\rangle_{\R{Z}'}\\
&=E[r(\R{Z}')t(\R{Z}')].
\end{align}

:::

+++

:::{admonition} **Proof**

Recall that

\begin{align}
\mu_{\R{Z}'}[r](z)&= \langle r, K_z|_{\Omega_{\R{Z}'}} \rangle_{\R{Z}'},
\end{align}

i.e., the dual pairing of $r$ with the $z$-point evaluation embedding restricted to $\Omega_{\R{Z}'}$. Since $K_z|_{\Omega_{\R{Z}'}}\in  \mc{L}^{\infty}_{\R{Z}'}$, the dual pairing is a bounded linear function of $r\in \mc{L}^1_{\R{Z}'}$, and so $\mu_{\R{Z}'}[r]\in \mc{H}_K$ as desired. Furthermore,

\begin{align}
\langle t, \mu_{\R{Z}'}[r]\rangle_K
&=\langle t, \langle r, K_z\rangle_{\R{Z}'}\rangle_K\\
&=\langle r, \langle t, K_z\rangle_K\rangle_{\R{Z}'} && \text{by linearity}\\
&=\langle r, s \rangle_{\R{Z}'} && \text{by the reproducing property},
\end{align}

which gives $E[r(\R{Z}')K_z(\R{Z}')]$ by definition.

:::

+++

### Kernel-Based Formula

+++

A consequence of the Riesz representation theorem is that, for any reproducing kernel $K$, $(\mc{H}_K, \mc{H}_K, \langle \cdot, \cdot \rangle_K)$ forms a dual system. Hence, the convex conjugate of any functional $M\in (-\infty, \infty]^{\mc{H}_K}$ can be written as

\begin{align}
M^*[u] := \sup_{t\in \mc{H}_K}\langle t, u\rangle_K - M[t]
\end{align}

for all $u\in \mc{H}_K$.

+++

:::{admonition} **Lemma**

Suppose $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$ for some $\R{Z}'$ and reproducing kernel $K$. For all $M\in (-\infty, \infty]^{\mc{H}_K}$ and $G\in (-\infty, \infty]^{\mc{L}^{\infty}_{\R{Z}'}}$,

\begin{align}
M|_{\R{Z}'}^*[r]& =  M^*[\mu_{\R{Z}'}[r]]\\
[G + M|_{\R{Z}'}]^*[r'] & = \inf_{r\in \mc{L}^1_{\R{Z}'}} G^*[r] +  M^*[\mu_{\R{Z}'}[r'-r]]
\end{align}

for all $r'\in \mc{L}^1_{\R{Z}'}$.

:::

+++

:::{admonition} **Proof**

To show the first equality:

\begin{align}
M|_{\R{Z}'}^*[r]& = \sup_{s\in \mc{L}^\infty_{\R{Z}'}} \langle r, s \rangle_{\R{Z}'} - \underbrace{M|_{\R{Z}'}[s]}_{\inf_{\substack{t\in \mc{H}_K:\\ t|_{\Omega_{\R{Z}'}}= s}} M[t]}\\
&= \sup_{t\in \mc{H}_K} \sup_{\substack{s\in \mc{L}^\infty_{\R{Z}'}:\\ t|_{\Omega_{\R{Z}'}}= s}} \langle r, s \rangle_{\R{Z}'} - M[t]\\
&= \sup_{t\in \mc{H}_K} \underbrace{\langle r, t|_{\Omega_{\R{Z}'}} \rangle_{\R{Z}'}}_{\langle t, \mu_{\R{Z}'}[r]\rangle_K} - M[t]\\
&= M^*[\mu_{\R{Z}'}[r]].
\end{align}

By the infimal convolution theorem,

\begin{align}
[G+M|_{\R{Z}'}]^*[r']
&= [G^*\square M|_{\R{Z}'}^*][r']\\
&= \inf_{r\in \mc{L}^1_{\R{Z}'}} G^*[r] + \underbrace{M|_{\R{Z}'}^*[r'-r]}_{M^*[\mu_{\R{Z}'}[r'-r]]}.
\end{align}

:::

+++

:::{admonition} **Example**

Consider for some $\lambda>0$,

\begin{align}
M[t]&:=\frac1{4\lambda} \norm{t}^2_K \\
&\xrightarrow{\lambda\to \infty} 0.
\end{align}

Then,

\begin{align}
M^*[u] 
&:= \sup_{t\in \mc{H}_K} \langle t, u\rangle_K - \underbrace{M[t]}_{\frac1{4\lambda} \norm{t}^2_K}\\
&=  \sup_{t\in \mc{H}_K} \frac{1}{4\lambda}\big(\norm{2\lambda u}_K  - \underbrace{\norm{t-2\lambda u}_K}_{\mathrlap{\text{$\geq 0$ with equality iff $t=2\lambda u$}}} \big) \\
&= \lambda\norm{u}^2_K\\
&\xrightarrow{\lambda\to \infty} \delta_{\Set{0}}[u].
\end{align}

By the above Lemma,

\begin{align}
M|_{\R{Z}'}^*[r]& =  M^*[\mu_{\R{Z}'}[r]]\\
&= \lambda\norm{\mu_{\R{Z}'}[r]}^2_K\\
&\xrightarrow{\lambda\to \infty} \delta_{\Set{0}}[\mu_{\R{Z}'}[r]]\\
[G + M|_{\R{Z}'}]^*[r'] & = \inf_{r\in \mc{L}^1_{\R{Z}'}} G^*[r] +  M^*[\mu_{\R{Z}'}[r'-r]]\\
&=\inf_{r\in \mc{L}^1_{\R{Z}'}} G^*[r] +  \lambda\norm{\mu_{\R{Z}'}[r'-r]}^2_K\\
&\xrightarrow{\lambda\to \infty} \inf_{\substack{r\in \mc{L}^1_{\R{Z}'}:\\ \mu_{\R{Z}'}[r']=\mu_{\R{Z}'}[r]}} G^*[r].
\end{align}


:::

+++

Restricting the functional in the DV lower bound to a RKHS, we obtain an alternative variational formula:

+++

:::{admonition} **Theorem** (Kernel-based formula for $f$-divergence)

For $P_{\R{Z}}\ll P_{\R{Z}'}$, a function $f\in {(-\infty,\infty]}^{[0,\infty)}$ strictly convex with $f(1)=0$, and a reproducing kernel $K\subseteq (-\infty, \infty)^{Z^2}$ such that $\mc{H}_K|_{\R{Z}'} \subseteq \mc{L}^{\infty}_{\R{Z}'}$,

\begin{align}
D_f(P_{\R{Z}}\|P_{\R{Z}'})&\geq \sup_{\lambda>0} \underbrace{\sup_{t\in \mc{H}_K} E[t(\R{Z})] - F^*[t|_{\Omega_{\R{Z}'}}] - \frac1{4\lambda} \norm{t}^2_K}_{\alpha(\lambda):=}\\
&= \sup_{\lambda>0} \overbrace{\inf_{r\in \mc{R}} E\left[(f(r(\R{Z})) \right] + \lambda\norm{E[K_{\R{Z}}]-\mu_{\R{Z}'}[r]}^2_K}^{\beta(\lambda):=}\\
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

:::{admonition} **Proof**

Consider any $r' \in\left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}$.

\begin{align}
\alpha(\lambda)&=\sup_{t\in \mc{H}_K} E[t(\R{Z})] - F^*[t|_{\Omega_{\R{Z}'}}] - \overbrace{\frac1{4\lambda} \norm{t}^2_K}^{M[t]:=}\\
&=\sup_{s\in \mc{L}^\infty_{\R{Z}'}} \sup_{\substack{t\in \mc{H}_K:\\ t|_{\Omega_{\R{Z}'}}=s}} \underbrace{E[t(\R{Z})]}_{\mathrlap{\begin{aligned}&=E[s(\R{Z})]\\&= \left\langle r', s(\R{Z}) \right\rangle_{\R{Z}'}\end{aligned}}} - F^*[\underbrace{t|_{\Omega_{\R{Z}'}}}_{s}] - \frac1{4\lambda} \norm{t}^2_K\\
&=\sup_{s\in \mc{L}^\infty_{\R{Z}'}} \left\langle r', s(\R{Z}) \right\rangle_{\R{Z}'} - F^*[s] - \underbrace{\inf_{\substack{t\in \mc{H}_K:\\ t|_{\Omega_{\R{Z}'}}=s}}\frac1{4\lambda} \norm{t}^2_K}_{M|_{\R{Z}'}[s]}\\
&=\sup_{s\in \mc{L}^\infty_{\R{Z}'}} \left\langle r', s(\R{Z}) \right\rangle_{\R{Z}'} - (F^*+M|_{\R{Z}'})[s]\\
&=[F^*+M|_{\R{Z}'}]^*[r']
\end{align}

By the above Lemma and example, 

\begin{align}
\alpha(\lambda)
%&=[F^*+M|_{\R{Z}'}]^*[r']\\
%&= [F\square M|_{\R{Z}'}^*][r']\\
&= \inf_{r\in \mc{L}^1_{\R{Z}'}} \underbrace{F[r]}_{E[f(r(\R{Z}))] + \delta_{\mc{R}}[r]} + \underbrace{M|_{\R{Z}'}^*[r'-r]}_{M^*[\underbrace{\mu_{\R{Z}'}[r'-r]}_{\underbrace{\mu_{\R{Z}'}[r']}_{E[K_{\R{Z}}]}-\mu_{\R{Z}'}[r]}]}\\
&= \inf_{r\in \mc{L}^1_{\R{Z}'}} E[f(r(\R{Z}))] + \delta_{\mc{R}}[r] + M^*[E[K_{\R{Z}}]-\mu_{\R{Z}'}[r]]\\
&= \inf_{r\in \mc{R}} E[f(r(\R{Z}))]  + \underbrace{M^*[E[K_{\R{Z}}]-\mu_{\R{Z}'}[r]]}_{\lambda \norm{E[K_{\R{Z}}]-\mu_{\R{Z}'}[r]}^2_K}\\
&= \beta(\lambda).
\end{align}

The bound is maximized with $\lambda\to \infty$, which gives

\begin{align}
\sup_{\lambda >0} \beta(\lambda)=\limsup_{\lambda\to \infty}\beta(\lambda)
%&= \inf_{r\in \mc{R}} E[f(r(\R{Z}))] + \sup_{\lambda >0} \lambda \norm*{E[K_{\R{Z}}]-\mu_{\R{Z}'}[r]}_K\\
&= \inf_{\substack{r\in \mc{R}:\\ \mu_{\R{Z}'}[r]=E[K_{\R{Z}}]}} E\left[(f(r(\R{Z})) \right]
\end{align}

as desired. The bound is tight if $r\in \mc{R}$ and $\mu_{\R{Z}'}[r]=E[K_{\R{Z}}]$ imply $r\in \left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'}$. The desired equality condition follows because

\begin{align}
r\in \mc{R} &\iff r-r' \in \mc{R}-\Set{\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}}\\
\mu_{\R{Z}'}[r]=E[K_{\R{Z}}] &\iff r-r'\in \operatorname{Ker}(\langle \cdot, \mc{H}|_{\R{Z}'} \rangle_{\R{Z'}}) \\
r\in \left[\tfrac{dP_{\R{Z}}}{dP_{\R{Z}'}}\right]_{\R{Z}'} &\iff r-r'\in \left[0\right]_{\R{Z}'}.
\end{align}

:::

+++

:::{important}

- How to train a neural network to return $t\in \mc{H}_K$? E.g.,

    \begin{align}
    t_\theta(z):=\sum_{i=1}^n a_i K_{z_i}(z)
    \end{align}
    
    where $\theta:=(a^n, z^n)$.
    
- How to train a neural network to return $r\in \mc{R}_{\R{Z}'}$? E.g.,

    \begin{align}
    r_\theta(z):= \frac{e^{u_{\theta}(z)}}{E[e^{u_{\theta}(\R{Z}')}]}.
    \end{align}
    
- Can the kernel method mitigate overfitting in sample estimates?

:::
