//
//  Quickselect.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class Select {
    private static let cutoff = 10
    
    public static func quickselect<T:Comparable>(inout a: [T], _ k: Int) -> T {
        Random.shuffle(&a) // randomly shuffle to avoid worst-case performance
        
        var lo = 0
        var hi = a.count - 1
        
        while hi > lo {
            let j = partition(&a, lo: lo, hi: hi)
            if j < k {
                lo = j + 1
            } else if j > k {
                hi = j - 1
            } else {
                return a[k]
            }
        }
        
        return a[k]
    }
    
    private static func partition<T:Comparable>(inout a: [T], lo: Int, hi: Int) -> Int {
        var i = lo
        var j = hi + 1
        
        while true {
            while a[++i] < a[lo] { // move i right until a[i] >= a[lo]
                if i == hi { // if every element is less than the partitioning element, break
                    break
                }
            }
            
            while a[lo] < a[--j] { // move j left until a[j] <= a[lo]
                //                if j == lo { // redundant, because if j == lo, then a[lo] is not less than a[j] above
                //                    break
                //                }
                continue
            }
            
            if i >= j {
                break
            }
            
            (a[i], a[j]) = (a[j], a[i])
        }
        
        // j is now pointing to an element less than the partitioning element (since we decremented j before checking its value above)
        // while all elements above the element j is pointing to are checked to be greater than the partitioning element by the above while loop.
        // so, if we swap a[lo] with a[j], a[j] will be below a[lo], and a[lo] will be above all lesser elements, and below all greater elements
        (a[lo], a[j]) = (a[j], a[lo])
        
        return j
    }
}
