//
//  Sort.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class Sort {
    public static func isSorted<T:Comparable>(a: [T]) -> Bool {
        for i in 0..<(a.count - 1) {
            if a[i] > a[i+1] {
                return false
            }
        }
        return true
    }
}
