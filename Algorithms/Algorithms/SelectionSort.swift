//
//  SelectionSort.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public extension Sort {
    public static func selectionSort<T:Comparable>(inout a : [T]) {
        let n = a.count
        for i in 0..<n {
            var min = i
            for j in (i+1)..<n {
                if a[j] < a[min] {
                    min = j
                }
            }
            (a[i], a[min]) = (a[min], a[i])
        }
    }
}
