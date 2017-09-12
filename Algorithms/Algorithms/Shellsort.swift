//
//  Shellsort.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public extension Sort {
    public static func shellsort<T:Comparable>(inout a : [T]) {
        let n = a.count
        var h = 1
        while h < n / 3 {
            h = 3 * h + 1
        }
        
        while h >= 1 {
            // h-sort the array
            for i in h..<n {
                for var j = i; j >= h; j -= h {
                    if a[j] < a[j-h] {
                        (a[j-h], a[j]) = (a[j], a[j-h])
                    } else {
                        break
                    }
                }
            }
            
            h = h / 3
        }
    }
}