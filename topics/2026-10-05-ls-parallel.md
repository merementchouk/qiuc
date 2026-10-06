# 2026-10-05 Mon: Parallelization of local search (WIP)

The PDF file with the meeting (handwritten) notes can be found [here](../assets/meetings/2026-10-05/QIUC Notes 2026-10-05.pdf).


## Reimplementation of known aglorithms

Previously, we saw how unconventional computing enables new algorithms and information processing techniques. Today, we focused on yet another "application": reimplementation of already known algorithms. Specifically, we looked at how an algorithm that may appear principally sequential can be recast in a parallelizable form.


## Maximum cut problem

The maximum cut problem simplifies many discussions related to the states of spin networks, and, therefore, it is worth proper introduction.

This problem inquires about such a partitioning of nodes in a weighted graph that delivers the maximum total weight of edges connecting nodes in different parts (cut edges). As figure below illustrates, binary spins naturally fit to describe this problem. We assign spins to individual graph nodes so that $\sigma_m = 1$ if node $m$ is in part 1, and $\sigma_m = -1$ if node $m$ is in part 2.

![img](../assets/meetings/2026-10-05/max-cut-example.png "A graph, its partition described by the spin configuration and cut edges (it's conincidentally a maximum cut partition if the all edges have weight 1)")

Given the spin distribution, we can write the cut indicator function: for edge $(m,n)$, we have $\chi_{m,n}(\boldsymbol{\sigma}) = (1 - \sigma_m \sigma_n) /2$. Indeed, if nodes $m$ and $n$ belong the same partition, then $\sigma_m \sigma_n = 1$, and we have $\chi_{m,n}(\boldsymbol{\sigma}) = 0$, and so forth.

If the graph weighted adjacency matrix is $A_{m,n}$, then the total cut weight is the weighted sum of the cut indicator

$$ C(\boldsymbol{\sigma}) = \frac{1}{4} \sum_{m,n} A_{m,n} \left( 1 - \sigma_m \sigma_n \right), $$

where the factor $1 /4$ accounts for the fact that our sum runs over all edges twice.

We see that the cut is directly related to the Ising Hamiltonian

$$ C(\boldsymbol{\sigma}) = \frac{W}{2} - \frac{1}{2} H(\boldsymbol{\sigma}), $$

where $W = \sum_{m,n} A_{m,n} /2$ is the total weight of the graph edges.

Thus, finding the maximum partition of the graph is equivalent to finding the ground state of the Ising model.


## Local search

Local search is a general purpose algorithm for heuristical solving optimization problems through improving the objective function locally until we can no longer improve. Here, we consider its version that ensures that inverting any *single* spin will not increase cut, and, therefore, it is also called 1-opt local search.

Local search work as follows. Given the spin configuration $\boldsymbol{\sigma}$, we look for such a spin that could be inverted and improve cut. Say, we are looking at the node $l$. We consider

$$ \Delta C_l(\boldsymbol{\sigma}) = C(\boldsymbol{\sigma} \vert_{\sigma_l \to -\sigma_l}) - C(\boldsymbol{\sigma}), $$

where $\boldsymbol{\sigma} \vert_{\sigma_l \to -\sigma_l}$ denotes the configuration obtained after inverting $\sigma_l$.

If there are no such spins, we are done.

Local search is inherently sequential because it relies on comparing the current state with a future state after a flip, which creates race conditions in parallel execution.

the algorithm is sequential because it requires processing spins one at a time to avoid race conditions, particularly when evaluating the effects of flipping spins.

an example involving a triangle structure where processing nodes in parallel would lead to incorrect results due to the race condition.

![img](../assets/meetings/2026-10-05/C3-bad-ls.png "Fully asynchronous local search procedures ran at each node may easily lead to meaningless transformations")

while there are potential parallelization techniques for non-overlapping graph sections, the fundamental nature of the algorithm requires sequential execution.


## Cube relaxation of the spin model

xi m that change within the interval from -1 to 1 instead of using sigma m.

replacing sigma with xi m preserves the maximum cut, which might look counterintuitive but is possible because psi m is a fully linear function.

At the same time, reformulating the maximum cut problem as finding a maximum of a polylinear function over a convex leads to a relaxation that can be executed dynamically. This relaxation converges to states that satisfy exactly the same requirements as the outcome of 1-opt local search. However, the dynamical algorithm is parallelizable since the progression for each node depends only on the present state of the network. This method demonstrates how seemingly non-parallelizable algorithms can be reformulated to allow parallel execution.

Second Derivative and Linear Functions

the second derivative vanishes and therefore we with respect to any single xi the function is linear

fully linear functions within an interval do not reach maximum values within the interval, only at the endpoints.

a three-dimensional cube where binary states are vertices, and explained that linear functions can only achieve maximum and minimum values at the sides of the cube.


## Convex Cube Maximum Value Problem

gradient descent could be used to find these maximum values.

considering perturbations in the form of differences between two functions.


## Parallelization:  Dynamics vs Decision

reformulating an algorithm as a dynamical system can make it parallelizable,

this approach could potentially parallelize other algorithms that were previously considered not parallelizable, though more work is needed to apply this principle to other optimization problems.

Details coming soon &hellip;
