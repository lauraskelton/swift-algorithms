//
//  Stack.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class Stack<T>: SequenceType, CustomStringConvertible {
    private var top: LLNode<T>?
    
    public var count: Int {
        guard let top = self.top else {
            return 0
        }
        
        var current = top
        var count = 1
        
        while ((current.next) != nil) {
            current = current.next!
            count++
        }
        return count
    }
    
    public func push(key: T) {
        if (top == nil) {
            top = LLNode<T>(key: key)
        } else {
            let childToUse = LLNode<T>(key: key)
            childToUse.next = top
            top = childToUse
        }
    }
    
    public func pop() -> T? {
        guard let top = self.top else {
            return nil
        }
        
        let poppedItem = top.key
        self.top = top.next
        return poppedItem
    }
    
    public func peek() -> T? {
        return top?.key
    }
    
    public func isEmpty() -> Bool {
        return top != nil
    }
    
    public func generate() -> AnyGenerator<T> {
        var current = self.top
        return anyGenerator {
            let this = current
            current = current?.next
            return this?.key
        }
    }
    
    public var description: String {
        guard let top = self.top else {
            return "Empty Stack"
        }
        
        var current = top
        
        var stringArray = [String]()
        
        while ((current.next) != nil) {
            stringArray.append(current.description)
            current = current.next!
        }
        
        let string = stringArray.joinWithSeparator(", ")
        return "Stack: [ \(string) ]"
    }
}
