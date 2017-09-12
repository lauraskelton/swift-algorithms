//
//  InsertionSort.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public extension Sort {
    public static func insertionSort<T:Comparable>(inout a : [T]) {
        let n = a.count
        for i in 0..<n {
            if i < 1 { continue }
            for j in (1...i).reverse() {
                if a[j] < a[j-1] {
                    (a[j-1], a[j]) = (a[j], a[j-1])
                } else {
                    break
                }
            }
        }
    }
    
    public static func insertionSortSubarray<T:Comparable>(inout a : [T], _ lo: Int, _ hi: Int) {
        for i in lo...hi {
            if i < lo + 1 { continue }
            for j in ((lo + 1)...i).reverse() {
                if a[j] < a[j-1] {
                    (a[j-1], a[j]) = (a[j], a[j-1])
                } else {
                    break
                }
            }
        }
    }
}
