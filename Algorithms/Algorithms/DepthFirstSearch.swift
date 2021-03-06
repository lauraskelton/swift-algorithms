//
//  DepthFirstSearch.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class DepthFirstPaths {
    private var marked = [Bool]()
    private var edgeTo = [Int?]()
    private let source : Int
    
    public init(graph: Graph, source: Int) {
        self.marked = [Bool](count: graph.vertices, repeatedValue: false)
        self.edgeTo = [Int?](count: graph.vertices, repeatedValue: nil)
        self.source = source
        
        dfs(graph, v: source)
    }
    
    private func dfs(graph: Graph, v: Int) {
        marked[v] = true
        for w in graph.adj(v) {
            if !marked[w] {
                dfs(graph, v: w)
                edgeTo[w] = v
            }
        }
    }
    
    public func hasPathTo(v: Int) -> Bool {
        return marked[v]
    }
    
    public func pathTo(v: Int) -> Stack<Int>? {
        if !hasPathTo(v) {
            return nil
        }
        
        let path = Stack<Int>()
        
        for var x = v; x != source; x = edgeTo[x]! {
            path.push(x)
        }
        path.push(source)
        
        return path
    }
}
