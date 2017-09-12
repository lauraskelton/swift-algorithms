//
//  Queue.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class Queue<T>: SequenceType, CustomStringConvertible {
    private var head: LLNode<T>?
    private var tail: LLNode<T>?
    
    public func enqueue(key: T) {
        if let head = head {
            let childToUse = LLNode<T>(key: key)
            childToUse.next = head
            head.previous = childToUse
            self.head = childToUse
        } else {
            head = LLNode<T>(key: key)
            tail = head
        }
    }
    
    public func dequeue() -> T? {
        guard let tail = self.tail else {
            return nil
        }
        
        let dequeuedItem = tail.key
        if self.head === tail {
            self.head = nil
            self.tail = nil
        } else {
            self.tail = tail.previous
        }
        return dequeuedItem
    }
    
    public func isEmpty() -> Bool {
        return head == nil
    }
    
    public func generate() -> AnyGenerator<T> {
        var current = self.tail
        return anyGenerator {
            let this = current
            current = current?.previous
            return this?.key
        }
    }
    
    public var description: String {
        guard let tail = self.tail else {
            return "Empty Queue"
        }
        
        var current = tail
        
        var stringArray = [String]()
        
        while ((current.previous) != nil) {
            stringArray.append(current.description)
            current = current.previous!
        }
        
        let string = stringArray.joinWithSeparator(", ")
        return "Queue: [ \(string) ]"
    }
}
