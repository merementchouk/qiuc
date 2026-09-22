Here are quick recaps (AI-seeded and edited) and links to additional materials for past meetings.


# Table of Contents

1.  [2026-09-14 Mon](#org6a31fae)
2.  [2026-09-21 Mon](#org41b27ac)


<a id="org6a31fae"></a>

# 2026-09-14 Mon

Mikhail presented an introduction to unconventional computing by considering a problem of finding paths in bipartite directed graphs, given that such paths exist.

Mikhail demonstrated standard approaches like depth-first and breadth-first search before presenting an unconventional algorithm that represented the graph's edges as binary spins and encoded the problem as a constraint satisfaction issue.

He explained how the algorithm encodes problem data in a novel way using binary spins and respectively defined charge quantities, $Q$, then solves the problem by finding configurations that minimize the $Q$-squared energy function. The discussion covered how this approach represents a shift from conventional computing paradigms to constrained programming and unconventional computing methods.

Mikhail announced plans to explore additional algorithms and computing models in future meetings, including the V-2 model of relaxation-based dynamical Ising machines and other unconventional computing approaches. He also raised the question of recognizing computation in physical systems.

Additional details can be found [here](./topics/2026-09-14-dipath.html).


<a id="org41b27ac"></a>

# 2026-09-21 Mon

The meeting focused on unconventional computing and how physical systems can be used to solve complex computational problems.

The problem of finding a path in a bipartite directed graph can be reformulated as finding a spin configuration that satisfies a certain condition, $Q(\boldsymbol{\sigma}) = 0$. However, seeking for spin configuration constitutes a nontrivial effort. To such a degree that, within the traditional approach, this problem can be approached as, first, mapped to the path finding problem, which then is solved using traditional algorithms like breadth-first search or depth-first search. Practical impact of unconventional computing starts when we have a backend providing means of solving (in this case) problem $Q(\boldsymbol{\sigma}) = 0$.

The challenge associated with powerful backends was illustrated by comparing analog and digital computers. Despite their historic leading positions, especially in solving complex equations, analog computers were displaced from the computing landscape by precision and scalability challenges.

In view of the tradeoff suggested by representing a problem in a completely different form, akin to $Q(\boldsymbol{\sigma}) = 0$, do we have a path for beneficial reintroducing analog computing? Can we solve complex problems by abandoning direct correspondence between physical and computational states and employing more efficient representation of certain problems?

As an example of a potential backend for solving the $Q(\boldsymbol{\sigma}) = 0$ problem, the relaxation-based dynamical Ising machines (R-DIM) driven by the V-2 model were introduced.

The session concluded by emphasizing that unconventional computing involves understanding different physical systems' computational capabilities and applying them to solve complex problems.

Additional details can be found [here](./topics/2026-09-21-v2-intro.html).
