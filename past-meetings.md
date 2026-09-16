# Past Meetings

Here, recaps and additional materials for past meetings are presented.


# 2026-09-14 Mon

The PDF file with the meeting (handwritten) notes can be found [here](./assets/meetings/2026-09-14/QIUC Notes 2026-09-14.pdf)


## Quick recap

Mikhail presented an introduction to unconventional computing by considering a problem of finding paths in bipartite directed graphs, given that such paths exist.

Mikhail demonstrated standard approaches like depth-first and breadth-first search before presenting an unconventional algorithm that represented the graph's edges as binary spins and encoded the problem as a constraint satisfaction issue.

He explained how the algorithm encodes problem data in a novel way using binary spins and respectively defined charge quantities, $Q$, then solves the problem by finding configurations that minimize the $Q$-squared energy function. The discussion covered how this approach represents a shift from conventional computing paradigms to constrained programming and unconventional computing methods.

Mikhail announced plans to explore additional algorithms and computing models in future meetings, including the V-2 model of relaxation-based dynamical easing machines and other unconventional computing approaches. He also raised the question of recognizing computation in physical systems.


## Details

To illustrate a distinction between conventional and unconventional computing, we consider a problem of finding a path in a bipartite directed graph.

As a brief reminder, a graph $\mathcal{G} = \left\{ \mathcal{V}, \mathcal{E} \right\}$, with the set of $N$ nodes $\mathcal{V}$ and the set of $M$ nodes $\mathcal{E}$, is called *bipartite*, if its set of edges is partitioned into two parts $\mathcal{V} = \mathcal{V}^{(1)} \sqcup \mathcal{V}^{(2)}$, such that there are edges with endpoints in different partitions, but there are no edges with endpoints in the same partition. A graph is directed if edges have a direction: the respective pairs of incident nodes are ordered, and one pair can be regarded as the head and the other one as the tail.

Finally, we consider simple graphs: there is at most one edge connecting any two nodes.

An example of a bipartite directed graph may look like this

![img](./assets/meetings/2026-09-14/path-graph.png "Find the valid path from node 1 to node 5 in this bipartite directed graph")

It is known that there is a path from node 1 to node 5. How to find it?


### Depth-first algorithm

We can employ a version of the depth-first search (DFS) and check one-by-one available options for continuing a path starting from node 1.

One such search may result in the path $1 \to 6 \to 2 \to 8 \to 1$ that returns us to the beginning. We can choose a different outgoing edge in node 8, which results in the path $1 \to 6 \to 2 \to 8 \to 3$ that cannot be continued.

After a few more attempts, we will arrive to the path $1 \to 7 \to 4 \to 10 \to 5$ that solves the problem.


### Spin algorithm/representation

We can represent the path finding problem in a completely different manner. This representation may appear as coming from nowhere, and this is on purpose: the objective is to demonstrate how unusual may look algorithms emerging within different areas of unconventional computing. Later, we will see how this representation may be derived as branching out from studying a different problem (discrete tomography).

We represent edges of the original graph by spin (binary) variables, $\sigma_m \in \left\{ -1, 1 \right\}$, with the sign chosen depending on the direction of the respective edge: if the edge goes from a node in $\mathcal{V}^{(1)}$ to a node in $\mathcal{V}^{(2)}$, we take $\sigma_m = -1$ and vice versa. For example, for the graph shown above, we have

$$\boldsymbol{\sigma} = \left\{ -1, -1, 1, 1, -1, 1, 1, 1, 1, -1, -1, -1, 1 \right\} ,$$

where $\boldsymbol{\sigma} = \left\lbrace \sigma_1, \ldots, \sigma_{M} \right\rbrace$ denotes the whole collection of the spin variables.

For node $r \in 1, \ldots, N$, we define a charge

$$Q(r; \boldsymbol{\sigma}) = \sum_{m \in \mathcal{I}(r)} \sigma_m + q_0(r)\sigma_0.$$

Here, $\mathcal{I}(r)$ denotes the set of edges incident to node $r$, $\sigma_0 \equiv 1$ is the auxiliary spin, and $q_0(r)$ is defined in such a way that

$$Q(r; \boldsymbol{\sigma}) = \begin{cases} 0, & \qquad \text{if $r$ is not a path terminal point} \\ \pm 2, & \qquad \text{if $r$ is a path terminal point}\end{cases} $$

For the terminal points, the sign of $Q(r; \boldsymbol{\sigma})$ is chosen as follows:

$$\mathrm{sign}[Q(r; \boldsymbol{\sigma})] = s_1 s_2,$$

where $s_1 = 1$, if $r \in \mathcal{V}^{(2)}$, and $s_1 = -1$, otherwise; and $s_2 = 1$, if $r$ is the starting point, and $s_2 = -1$, otherwise.

For example, for the graph shown above all $Q(r; \boldsymbol{\sigma}) = 0$, except for $Q(1; \boldsymbol{\sigma}) = -2$ and $Q(5; \boldsymbol{\sigma}) = 2$.

Next, let $\boldsymbol{\sigma}'$ be such spin configuration that $Q(r; \boldsymbol{\sigma}') = 0$, for *all* nodes $r$.

Finally, we consider the set of edges of the original graph $\mathcal{T} = \lbrace m \in \mathcal{E} : \sigma_m \sigma'_m = -1\rbrace$, that is edges corresponding to spins that were inverted in order to obtain $Q(r; \boldsymbol{\sigma}') = 0$. Then $\mathcal{T}$ contains the directed path connecting the start and end points, possibly with directed cycles. Traversing this set and eliminating encountered cycles produces the desired path.


### Why this representation works

Let's consider, for concreteness, $r \in \mathcal{V}^{(1)}$. The first term in $Q(r; \boldsymbol{\sigma})$ is the number of edges entering $r$ minus the number of edges exiting $r$. Thus, inverting an edge incident to $r$ decreases $Q(r)$ by twice the direction of the edge as encoded by the respective spin variable.

For example, if we invert edge $1$ in the graph shown above, then $Q(1)$ will increase by $2$. Notice, that after that $Q(1; \boldsymbol{\sigma}') = 0$, but now $Q(6; \boldsymbol{\sigma}') = 2$. In order to restore $Q(6) = 0$, we need to invert $\sigma_3$ and so on. This shows how directed paths may emerge in this representation.

It can be seen that inverting spins along a directed cycle does not change the charge, $Q(r; \boldsymbol{\sigma}') = Q(r; \boldsymbol{\sigma})$, in all nodes along the cycle. Thus, to turn to zero charges at two given points, there should be a directed path that starts at one point and terminates at another.


### Is this really an algorithm?

The spin representation may be regarded as a formulation of the path finding problem within the [constraint programming](https://en.wikipedia.org/wiki/Constraint_programming). We set a problem, imposed the constraint, $Q(r; \boldsymbol{\sigma}') = 0$ for all $r$, and once the constraint is met, we read out the solution. But how do we ensure the constraint? How do we find such spin configuration $\boldsymbol{\sigma}'$ that turns all the charges to zero? Don't we need to go back to BFS and DFS or other rather *conventional* algorithms?


### Ising machines

It turns out we can approach the problem of satisfying various kinds of constraints from a completely different unifying perspective. The problem of finding spin configuration annihilating all the charges can be posed as a problem about finding a minimum of

$$ H(\boldsymbol{\sigma}) = \frac{1}{4} \sum_{r} Q^2(r; \boldsymbol{\sigma}), $$

a Hamiltonian of an Ising model on a specially constructed weighted graph. This brings the notion of Ising machines into the context.

We will go into more detail later, and, in particular, we will see that the sole fact that we rewrote a problem in an Ising form does not really answer the question "How do we solve *this* problem?" However, we will see that a further reformulation of the problem for a continuous relaxation of binary spins and making the system of relaxed spins evolving driven by specially selected dynamical model does move us quite far ahead in answering the question "How do we solve *this* problem?"

In view of such specialized Ising machines, we indeed have **unconventional computing** with unconventional algorithms that goes beyond disguising standard algorithms.
