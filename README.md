# Analysis of Accelerated Gradient Descent with Polyak Step Size Using Performance Estimation Toolbox (PESTO)

This is the final project for [CS-GY 9223D Algorithmic Machine Learning and Data Science](https://www.chrismusco.com/amlds2020/) at NYU Tandon: an advanced theory course exploring contemporary algorithmic techniques and recent research on computational methods that enable machine learning and data science at scale. Full report can be found [here](https://github.com/jmg764/Analysis-of-Accelerated-Gradient-Descent-with-Polyak-Step-Size-Using-Performance-Estimation-Toolbox/blob/main/AlgoML%20Final%20Project.pdf).

## Introduction

The goal of this project is to use PESTO in order to analyze the performance of the Accelerated Gradient Method (AGM) proposed by Barr, Taylor, and d’Aspremont in their Complexity Guarantees for Polyak Steps with Momentum [1]. AGM is appealing in that it does not require knowledge of the strong convexity constant  of the function being optimized. It accomplishes this through the use of the inverse Polyak step as an estimate for the strong convexity parameter. 

In optimization theory, the worst-case convergence rate of a given method is a commonly used benchmark for measuring performance compared to other methods. Performance estimation (PE), pioneered by Drori and Teboulle [2], is a systematic method of obtaining non-improvable worst-case guarantees for first-order numerical optimization schemes. However, PE requires demanding semidefinite programming modeling from the user. PESTO is a MATLAB toolbox that allows the user to code their algorithm in a natural way and automatically computes tight worst-case performance guarantees [3].

## References
1. Barré, M., Taylor, A., d’Aspremont, A. (2020). Complexity Guarantees for Polyak Steps with Momentum. arXiv preprint arXiv:2002.00915.
2. Yoel Drori and Marc Teboulle. Performance of first-order methods for smooth convex minimization: a novel approach. Mathematical Programming, 145(1-2):451–482, 2014.
3. A. B. Taylor, J. M. Hendrickx and F. Glineur, "Performance estimation toolbox (PESTO): Automated worst-case analysis of first-order optimization methods," 2017 IEEE 56th Annual Conference on Decision and Control (CDC), Melbourne, VIC, 2017, pp. 1278-1283, doi: 10.1109/CDC.2017.8263832.
