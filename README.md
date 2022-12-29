# Schelling Segregation Model
This repo contains code for implementing the Schelling (1969) agent-based model of segregation using the Java-based programming environment
[Processing](https://processing.org).
There are two types of agents (red and blue), which are initially placed randomly on a grid of cells. Agents have a tolerance level 
regarding the share of their neighbors that are of the respective other type. If this share increases beyond the tolerance level, 
agents relocate to the nearest empty cell.

For some agents, the initial share of neighbors of the respective other type will happen to exceed their tolerance, thus prompting
them to relocate. However, this relocation may prompt neighboring agents in the new location to relocate, which leads to further 
relocation etc. As a result, over time agents sort themselves into areas only containing either red or blue agents.

## References
Schelling, T.C. (1969), Models of segregation, *American Economic Review* 59, 488-493.  [http://www.jstor.org/stable/1823701](http://www.jstor.org/stable/1823701)
