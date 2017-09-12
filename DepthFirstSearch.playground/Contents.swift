//: Depth First Search Playground

import UIKit

import Algorithms

let graph = Graph(vertices: 13)
graph.addEdge(v: 0, w: 5)
graph.addEdge(v: 4, w: 3)
graph.addEdge(v: 0, w: 1)
graph.addEdge(v: 9, w: 12)
graph.addEdge(v: 6, w: 4)
graph.addEdge(v: 5, w: 4)
graph.addEdge(v: 0, w: 2)
graph.addEdge(v: 11, w: 12)
graph.addEdge(v: 9, w: 10)
graph.addEdge(v: 0, w: 6)
graph.addEdge(v: 7, w: 8)
graph.addEdge(v: 9, w: 11)
graph.addEdge(v: 5, w: 3)
graph.addEdge(v: 5, w: 5)

graph.edges
graph.vertices
degree(graph, v: 11)
maxDegree(graph)
averageDegree(graph)
numberOfSelfLoops(graph)

let paths = DepthFirstPaths(graph: graph, source: 0)
paths.hasPathTo(5)
paths.hasPathTo(6)
paths.hasPathTo(12)
paths.hasPathTo(7)

for v in paths.pathTo(6)! {
    print(v)
}

