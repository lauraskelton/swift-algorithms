//
//  Bag.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class Bag<T> : SequenceType, CustomStringConvertible {
    
    private var bagArray = Array<T>()
    
    public func add(item: T) {
        bagArray.append(item)
    }
    
    public func isEmpty() -> Bool {
        return bagArray.count == 0
    }
    
    public var size: Int {
        return bagArray.count
    }
    
    public func generate() -> AnyGenerator<T> {
        var i = 0
        return anyGenerator {
            if i < self.bagArray.count {
                return self.bagArray[i++]
            }
            return nil
        }
    }
    
    public var description: String {
        
        var stringArray = [String]()
        
        for item in bagArray {
            stringArray.append("\(item)")
        }
        
        let string = stringArray.joinWithSeparator(", ")
        return "Bag: [ \(string) ]"
    }
}
