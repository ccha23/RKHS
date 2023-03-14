---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.13.8
kernelspec:
  display_name: ''
  name: ''
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

For any random variable $\R{Z}$ that maps to a topological vector space, its expectation (mean) with respect to $Q\in \mc{P}(\mc{E})$ is the Lebesgue integral
\begin{align}
E_Q[f(\R{Z})]&:=\int \R{Z} \,dQ \\
&= \int_{\mathrlap{z\in \Omega_{\R{Z}}}} \;z \,dQ_{\R{Z}}(z)
\end{align}

where the first integral can be written explicitly as the integral $\int_{\Omega} \R{Z} \,dQ$ over the entire sample space $\Omega$ for $Q$, and the second integral can be written implicitly as the integral $\int \operatorname{id}_{\Omega_{\R{Z}}} \,dQ_{\R{Z}}$ of the identity function $\operatorname{id}_{\Omega_{\R{Z}}}$ over the sample space $\Omega_{\R{Z}}$ of $\R{Z}$.

$E[\R{Z}]:=E_P[\R{Z}]$ is the expectation (with respect to the default probability measure $P$).

+++ {"tags": []}

### Divergence

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

### DV Formula for Divergence

+++

Consider the dual system $(\mc{L}^1_{\R{Z}'}, \mc{L}^\infty_{\R{Z}'}, \langle \cdot, \cdot \rangle_{\R{Z}'})$ where 

- $\mc{L}^p_{\R{Z}'}$ is the $p$-Lebesgue space with respect to measure $P_{\R{Z}'}$ where equality is up to a $P_{\R{Z}'}$-null set, and
- the non-degenerate dual pairing is

\begin{align}
\langle r, s\rangle_{\R{Z}'}&:= E[r(\R{Z}')s(\R{Z}')]&& \forall (r, s) \in \mc{L}^1_{\R{Z}'}\times \mc{L}^\infty_{\R{Z}'}.
\end{align}

Duality implies:

- $r\in \mc{L}_{\R{Z}'}^1$ and  $\langle r, \cdot \rangle_{\R{Z}'} = 0$ implies $r=0$ up to a $P_{\R{Z}'}$-null set.
- $s\in \mc{L}_{\R{Z}'}^\infty$ and  $\langle \cdot, s \rangle_{\R{Z}'} = 0$ implies $s=0$ up to a $P_{\R{Z}'}$-null set.

More explicitly:

- $\mc{L}^1_{\R{Z}'}$ is the set of measureable functions $r\in (-\infty, \infty)^Z$ with non-degenerate $1$-norm w.r.t. $P_{\R{Z}'}$

    \begin{align}
    \norm{r}_{\mc{L}^1_{\R{Z}'}} := \int \abs{r}\,dP_{\R{Z}'}.
    \end{align}

- $\mc{L}^\infty_{\R{Z}'}$ is the set of measurable functions $s\in (-\infty, \infty)^Z$ with non-degenerate $\infty$-norm w.r.t. $P_{\R{Z}'}$

    \begin{align}
    \norm{s}_{\mc{L}^\infty_{\R{Z}'}}:=\inf\Set{c\geq 0 \left| \forall A\in \mc{E}_{\R{Z}'},\sup_{z\in A} \abs{s(z)} \leq c \text{ or } P_{\R{Z}'}(A)=0\right.},
    \end{align}
    
    which is the supremum up to a $P_{\R{Z}}$-null set.

+++

For $P_{\R{Z}}\ll P_{\R{Z}'}$ and any convex set $\mc{R}$ with $\mc{R}_{\R{Z}'}\subseteq \mc{R}\subseteq \mc{L}^1_{\R{Z}'}$, the $f$-divergence can be written as 

\begin{align}
D_{f}(P_{\R{Z}}\|P_{\R{Z}'}) &= F\left[ \frac{dP_{\R{Z}}}{dP_{\R{Z}'}} \right]
\end{align}

where $F\in (-\infty, \infty]^{\mc{L}^1_{\R{Z}'}}$ is a convex function defined as

\begin{align}
F[r]&:=E\left[(f\circ r)(\R{Z}) \right] + \delta_{\mc{R}}[r] && \text{where}\\
\delta_{\mc{R}}[r] &:=
\begin{cases}
0 & r\in \mc{R}\\
\infty & \text{otherwise},
\end{cases}
\end{align}

i.e., the characteristic function of $\mc{R}$.

+++

The convex conjugate of $F\in (-\infty, \infty]^{ \mc{L}^\infty_{\R{Z}'}}$ is defined as

\begin{align}
F^*[s]&:= \sup_{r\in \mc{L}^1_{\R{Z}'}} \underbrace{\langle r,s \rangle_{\R{Z}'}}_{=E[r(\R{Z}')s(\R{Z}')]} - F[r].
\end{align}

+++

:::{admonition} **Theorem** (DV Formula)

For a function $f\in {(-\infty,\infty]}^{[0,\infty)}$ strictly convex with $f(1)=0$, 

\begin{align}
D_f(P_{\R{Z}}\|P_{\R{Z}'})&= \sup_{s\in \mc{L}^{\infty}_{\R{Z}'}} E[r(\R{Z})] - F^*[s].
\end{align}

for $P_{\R{Z}}\ll P_{\R{Z}'}$, where 

\begin{align}
F^*[s]&:= \sup_{r\in \mc{L}^1_{\R{Z}'}} \underbrace{\langle r,s \rangle_{\R{Z}'}}_{=E[r(\R{Z}')s(\R{Z}')]} - F[r]\\
F[r]&:=E\left[(f\circ r)(\R{Z}) \right] + \delta_{\mc{R}}[r]\\
\delta_{\mc{R}}[r] &:=
\begin{cases}
0 & r\in \mc{R}\\
\infty & \text{otherwise},
\end{cases}
\end{align}

for any convex set $\mc{R}$ satisfying 

\begin{align}
\mc{R}_{\R{Z}'}\subseteq \mc{R}\subseteq \mc{L}^1_{\R{Z}'}.
\end{align}


:::

+++

:::{admonition} Proof

Since $F$ is convex, and convex conjugation is an involution,

\begin{align}
F[r] &= \sup_{s\in \mc{L}^{\infty}_{\R{Z}'}} \langle r,s \rangle_{\R{Z}'} - F^*[s] 
\end{align}

which evaluates to the $f$-Divergence at $r=\frac{dP_{\R{Z}}}{dP_{\R{Z}'}}$, in which case $\langle r, s \rangle_{\R{Z}'}=E[r(\R{Z})]$.

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

### Correlation Embedding

+++

By the Riesz representation theorem, each bounded linear functional on a RKHS has a unique embedding in the RKHS.

+++

We write $\R{Z}'\sim K$ for any reproducing kernel $K\in (-\infty,\infty)^{Z^2}$ such that $Z\supseteq \Omega_{\R{Z}'}$ and

\begin{align}
\underbrace{K_z|_{\Omega_{\R{Z}'}}}_{z'\in \Omega_{\R{Z}'}\mapsto K_z(z')} &\in \mc{L}^{\infty}_{\R{Z}'}&& \forall z\in Z.
\end{align}

+++

:::{admonition} **Proposition**


Consider $\R{Z}'\sim K$ for a reproducing kernel $K$. For all $r\in \mc{L}^1_{\R{Z}'}$ and $s\in \mc{H}_K$, 

\begin{align}
\overbrace{E[r(\R{Z}')K_{\R{Z}'}]}^{\mu_{\R{Z}'}[r]:=} &\in \mc{H}_K \\
\langle s, \mu_{\R{Z}'}[r]\rangle_K &= \langle r, s\rangle_{\R{Z}'} = E[r(\R{Z}')s(\R{Z}')].
\end{align}

$\mu_{\R{Z}'}[r]$ is called the $r$-correlation embedding (with respect to the measure $P_{\R{Z}'}$), and $\mu_{\R{Z}'}$ is called the correlation map.

:::

+++

:::{admonition} Proof

Note that

\begin{align}
\mu_{\R{Z}'}[r](z)&= E[r(\R{Z}')K_z(\R{Z}')]\\
&= \langle r, K_z|_{\Omega_{\R{Z}'}} \rangle_{\R{Z}'},
\end{align}

i.e., the $r$-correlation embedding evaluated at $z$ is the dual pairing of $r$ with the $z$-point evaluation embedding restricted to $\Omega_{\R{Z}'}$. Since $K_z|_{\Omega_{\R{Z}'}}\in  \mc{L}^{\infty}_{\R{Z}'}$, the dual pairing is a bounded linear function of $r\in \mc{L}^1_{\R{Z}'}$, and so $\mu_{\R{Z}'}[r]\in \mc{H}_K$ as desired. Furthermore,

\begin{align}
\langle s, \mu_{\R{Z}'}[r]\rangle_K
&=\langle s, \langle r, K_z\rangle_{\R{Z}'}\rangle_K\\
&=\langle r, \langle s, K_z\rangle_K\rangle_{\R{Z}'} && \text{by linearity}\\
&=\langle r, s \rangle_{\R{Z}'} && \text{by the reproducing property},
\end{align}

which gives $E[r(\R{Z}')K_z(\R{Z}')]$ as desired.

:::

+++

:::{admonition} Lemma

Consider $\R{Z}'\sim K$ for a reproducing kernel $K\subseteq (-\infty,\infty)^Z$, a convex function $F\in (-\infty, \infty]^{ \mc{L}^{1}_{\R{Z}'}}$, and its convex conjugate $F^*\in (-\infty, \infty]^{ \mc{L}^{\infty}_{\R{Z}'}}$. For any $r'\in \mc{L}^{1}_{\R{Z}'}$, 

\begin{align}
F[r']
&\geq \sup_{s \in \mc{H}} \langle r, s\rangle_{\R{Z}'} - F^*[s]\\
&= \inf_{\substack{r\in \mc{L}^1_{\R{Z}'}:\\ \mathclap{\mu_{\R{Z}}[r']=\mu_{\R{Z}}[r]}}} F[r].
\end{align}

and the inequality holds with equality if $\mc{H}_{K}|_{\Omega_{\R{Z}'}}\subseteq \mc{L}^\infty_{\R{Z}'}$ is total for the dual pairing $\langle \cdot, \cdot \rangle_{\R{Z}'}$, i.e., for all $r\in \mc{L}^1_{\R{Z}'}$, we have $r'=0$ up to a $P_{\R{Z}'}$-null set if

\begin{align}
\langle r,K_z|_{\Omega_{\R{Z}'}}\rangle &= 0 && \forall z\in Z.
\end{align}

:::

+++

:::{admonition} Proof

Since convex conjugation is a convolution,

\begin{align}
F[r'] &\geq \sup_{s \in \mc{H}} \langle r', s|_{\Omega_{\R{Z}'}}\rangle_{\R{Z}'} - F^*[s]\\
&= \sup_{s \in \mc{H}} \langle r', s|_{\Omega_{\R{Z}'}}\rangle_{\R{Z}'} - \left[\sup_{r\in \mc{L}^1_{\R{Z}'}} \langle r, s|_{\Omega_{\R{Z}'}}\rangle_{\R{Z}'} - F[r]\right]\\
&=  \sup_{s \in \mc{H}}\inf_{r\in \mc{L}^1_{\R{Z}'}} \langle r'-r, s|_{\Omega_{\R{Z}'}}\rangle_{\R{Z}'} + F[r]\\
&=  \inf_{r\in \mc{L}^1_{\R{Z}'}} \sup_{s \in \mc{H}} \underbrace{\langle r'-r, s|_{\Omega_{\R{Z}'}}\rangle_{\R{Z}'}}_{=\langle s, \mu_{\R{Z}}[r'-r]\rangle_K} + F[r]\\
&=  \inf_{r\in \mc{L}^1_{\R{Z}'}} F[r] + \underbrace{\sup_{s \in \mc{H}} \langle s, \mu_{\R{Z}}[r'-r]\rangle_K}_{=\delta_{\Set{\mu_{\R{Z}}[r']}}[\mu_{\R{Z}}[r]] }\\
&= \inf_{\substack{r\in \mc{L}^1_{\R{Z}'}:\\ \mathclap{\mu_{\R{Z}}[r']=\mu_{\R{Z}}[r]}}} F[r]
\end{align}

as desired. Equality holds if $\mu_{\R{Z}}[r']=\mu_{\R{Z}}[r]$ implies $r'=r$, which is the case when $\mc{H}_{K}|_{\Omega_{\R{Z}'}}$ is total since 

\begin{align}
\mu_{\R{Z}'}[r'-r](z)&= \langle r'-r, K_z|_{\Omega_{\R{Z}'}} \rangle_{\R{Z}'}.
\end{align}

:::
