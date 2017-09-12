//
//  LLNode.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class LLNode<T: Equatable> : CustomStringConvertible {
    public var key: T
    public var next: LLNode?
    public var previous: LLNode?
    
    public init(key: T) {
        self.key = key
    }
    
    public func appendToTail(key: T) {
        let end = LLNode<T>(key: key)
        var current = self
        while let next = current.next {
            current = next
        }
        current.next = end
    }
    
    public static func deleteNode(head: LLNode<T>, key: T) -> LLNode<T>? {
        
        if head.key == key {
            return head.next
        }
        
        var current = head
        
        while let next = current.next {
            if next.key == key {
                current.next = next.next
                return head
            }
            current = next
        }
        return head
    }
    
    public var description: String {
        if let key = key as? CustomStringConvertible {
            return key.description
        }
        return "LLNode"
    }
}