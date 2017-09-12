//
//  Graph.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class Graph : CustomStringConvertible {
    
    private var edgesArray = [Bag<Int>]()
    
    public let vertices: Int
    
    public var edges: Int {
        var edgesCount = 0
        
        for adj in edgesArray {
            edgesCount += adj.size
        }
        
        return edgesCount / 2
    }
    
    public init(vertices: Int) {
        self.vertices = vertices
        for _ in 0..<vertices {
            edgesArray.append(Bag<Int>())
        }
    }
    
    public func addEdge(v v: Int, w: Int) {
        assert(v < vertices && w < vertices, "vertex is outside the graph bounds")
        edgesArray[v].add(w)
        edgesArray[w].add(v)
    }
    
    public func adj(v: Int) -> Bag<Int> {
        assert(v < vertices, "vertex is outside the graph bounds")
        return edgesArray[v]
    }
    
    public var description: String {
        
        var stringArray = [String]()
        
        for v in 0..<vertices {
            for w in adj(v) {
                stringArray.append("\(v)-\(w)")
            }
        }
        
        let string = stringArray.joinWithSeparator(", ")
        return "Graph: [ \(string) ]"
    }
}

public func degree(graph: Graph, v: Int) -> Int {
    var degree = 0
    for _ in graph.adj(v) {
        degree++
    }
    return degree
}

public func maxDegree(graph: Graph) -> Int {
    var max = 0
    for v in 0..<(graph.vertices) {
        if degree(graph, v: v) > max {
            max = degree(graph, v: v)
        }
    }
    return max
}

public func averageDegree(graph: Graph) -> Double {
    return 2.0 * Double(graph.edges) / Double(graph.vertices)
}

public func numberOfSelfLoops(graph: Graph) -> Int {
    var count = 0
    for v in 0..<(graph.vertices) {
        for w in graph.adj(v) {
            if v == w {
                count++
            }
        }
    }
    return count / 2
}
