//
//  BreadthFirstSearch.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class BreadthFirstPaths {
    private var marked = [Bool]()
    private var edgeTo = [Int?]()
    private let source : Int
    
    public init(graph: Graph, source: Int) {
        self.marked = [Bool](count: graph.vertices, repeatedValue: false)
        self.edgeTo = [Int?](count: graph.vertices, repeatedValue: nil)
        self.source = source
        
        let queue = Queue<Int>()
        queue.enqueue(source)
        marked[source] = true
        
        while !queue.isEmpty() {
            let v = queue.dequeue()!
            for w in graph.adj(v) {
                if !marked[w] {
                    queue.enqueue(w)
                    marked[w] = true
                    edgeTo[w] = v
                }
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
