Here are quick recaps (AI-seeded and edited) and links to additional materials for past meetings.


# Table of Contents

1.  [2026-09-14 Mon: Overall scope and Ising computing](#org4bf2f8a)
2.  [2026-09-21 Mon: More spin algorithms and V-2 model](#org38136d6)
3.  [2026-09-28 Mon: Adiabatic Quantum Computing](#orgb0e0baa)
4.  [2026-10-05 Mon: Parallelized local search](#org4fa4c20)
5.  [2026-10-12 Mon: Local searches and simulated annealing](#orgcabf760)
6.  [2026-10-19 Mon: General discussion of unconventional computing](#org3f83a6e)


<a id="org4bf2f8a"></a>

# 2026-09-14 Mon: Overall scope and Ising computing

Mikhail presented an introduction to unconventional computing by considering a problem of finding paths in bipartite directed graphs, given that such paths exist.

Mikhail demonstrated standard approaches like depth-first and breadth-first search before presenting an unconventional algorithm that represented the graph's edges as binary spins and encoded the problem as a constraint satisfaction issue.

He explained how the algorithm encodes problem data in a novel way using binary spins and respectively defined charge quantities, $Q$, then solves the problem by finding configurations that minimize the $Q$-squared energy function. The discussion covered how this approach represents a shift from conventional computing paradigms to constrained programming and unconventional computing methods.

Mikhail announced plans to explore additional algorithms and computing models in future meetings, including the V-2 model of relaxation-based dynamical Ising machines and other unconventional computing approaches. He also raised the question of recognizing computation in physical systems.

Additional details can be found [here](./topics/2026-09-14-dipath.html).


<a id="org38136d6"></a>

# 2026-09-21 Mon: More spin algorithms and V-2 model

The meeting focused on unconventional computing and how physical systems can be used to solve complex computational problems.

The problem of finding a path in a bipartite directed graph can be reformulated as finding a spin configuration that satisfies a certain condition, $Q(\boldsymbol{\sigma}) = 0$. However, seeking for spin configuration constitutes a nontrivial effort. To such a degree that, within the traditional approach, this problem can be approached as, first, mapped to the path finding problem, which then is solved using traditional algorithms like breadth-first search or depth-first search. Practical impact of unconventional computing starts when we have a backend providing means of solving (in this case) problem $Q(\boldsymbol{\sigma}) = 0$.

The challenge associated with powerful backends was illustrated by comparing analog and digital computers. Despite their historic leading positions, especially in solving complex equations, analog computers were displaced from the computing landscape by precision and scalability challenges.

In view of the tradeoff suggested by representing a problem in a completely different form, akin to $Q(\boldsymbol{\sigma}) = 0$, do we have a path for beneficial reintroducing analog computing? Can we solve complex problems by abandoning direct correspondence between physical and computational states and employing more efficient representation of certain problems?

As an example of a potential backend for solving the $Q(\boldsymbol{\sigma}) = 0$ problem, the relaxation-based dynamical Ising machines (R-DIM) driven by the V-2 model were introduced.

The session concluded by emphasizing that unconventional computing involves understanding different physical systems' computational capabilities and applying them to solve complex problems.

Additional details can be found [here](./topics/2026-09-21-v2-intro.html).


<a id="orgb0e0baa"></a>

# 2026-09-28 Mon: Adiabatic Quantum Computing

At the meeting, one of quantum-inspired motives was elaborated by presenting the concept of adiabatic quantum computing (AQC). On the surface, the adiabatic quantum computing pursues the same objective: finding a ground state of a spin Hamiltonian representing a problem. However, AQC follows a particular interesting idea based on a slow transition from a simple Hamiltonian to a complex one to find ground states.

We overviewed [the quantum adiabatic theorem](https://en.wikipedia.org/wiki/Adiabatic_theorem) and energy-time uncertainty relations, defining the theoretical foundations of AQC, while outlining practical limitations, particularly the [challenge](https://arxiv.org/abs/quant-ph/0509162) of maintaining sufficient energy gaps during the transition process. While it is [possible](https://arxiv.org/abs/1104.2349) to design such a transition from a simple to complex Hamiltonians that preserves sufficiently wide gaps, finding such a transition might be a [challenge of its own](https://quantum-journal.org/papers/q-2025-07-11-1790/).

The broader lesson for quantum-inspired unconventional computing is the value of solving a difficult problem through a gradual transition from a simple, well-understood system to the desired complex one. Implementing this strategy, however, requires designing a transition path that remains stable and computationally tractable throughout.

Additional details can be found [here](./topics/2026-09-28-aqc-intro.html).


<a id="org4fa4c20"></a>

# 2026-10-05 Mon: Parallelized local search

Previously, we saw how unconventional computing enables new algorithms and information processing techniques. Today, we focused on yet another "application": reimplementation of already known algorithms. Specifically, we looked at how an algorithm that may appear principally sequential can be recast in a parallelizable form.

We looked at the local search algorithm of looking for the maximum cut graph partition. This algorithm ensures that inverting any single spin will not increase cut, and, therefore, it is also called 1-opt local search. Local search is inherently sequential because it relies on comparing the current state with a future state after a flip, which creates race conditions in parallel execution. It was demonstrated that an attempt to ignore this may lead to a non-convergent and borderline useless algorithm.

At the same time, reformulating the maximum cut problem as finding a maximum of a polylinear function over a convex leads to a relaxation that can be executed dynamically. This relaxation converges to states that satisfy exactly the same requirements as the outcome of 1-opt local search. However, the dynamical algorithm is parallelizable since the progression for each node depends only on the present state of the network. This method demonstrates how seemingly non-parallelizable algorithms can be reformulated to allow parallel execution.

Additional details can be found [here](./topics/2026-10-05-ls-parallel.html).


<a id="orgcabf760"></a>

# 2026-10-12 Mon: Local searches and simulated annealing

The meeting focused on a broad family of local search algorithms and their limitations from the perspective of the max-cut problem. Examples of "objectively" trivial but potentially challenging for local search algorithms were presented. A typical feature of these examples is that they suggest expanding the Hamming neighborhood covered by the algorithm. In other words, these challenges are resolved by advancing $k$ in $k$-opt. However, this comes with a hefty performance penalty, as Hamming neighborhoods grow exponentially. At the meeting, the simulated annealing algorithm was introduced as an ingenious compromise between the tunnel vision of local searches and the quick growth of the search space.

A brief overview of the fundamental challenges faced by search algorithms was given. The max-cut problem is APX-hard; that is, it is hard to find an approximation beyond a certain threshold. This is a major constraint to keep in mind when approaching algorithms and techniques with too broad a scope. At the same time, this should guide us to focus on particular classes of problems rather than discourage us from using such techniques. After all, approaching an array sorting problem as a search in the space of its possible permutations also looks quite intimidating.

Additional details can be found [here](./topics/2026-10-12-ls-sa-maxcut.html).


<a id="org3f83a6e"></a>

# 2026-10-19 Mon: General discussion of unconventional computing

A freeform discussion of unconventional computing: potential implications of multiple solutions in developing new pipelines, problems with adopting quantum algorithms, the difficulty of comparing classical and quantum oracle models, potential implications of inherently isotropic phase space of R-DIMs, challenges of communicating complex scientific ideas, techniques of involving LLM-based AI to research activities.
