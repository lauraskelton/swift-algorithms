//
//  Mergesort.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public extension Sort {
    private static let cutoff = 7
    
    public static func mergesort<T:Comparable>(inout a : [T]) {
        var aux = [T]()
        aux.reserveCapacity(a.count)
        sort(&a, &aux, 0, a.count - 1)
    }
    
    private static func sort<T:Comparable>(inout a: [T], inout _ aux: [T], _ lo: Int, _ hi: Int) {
        if hi <= (lo + cutoff - 1) { // too much overhead to use mergesort on tiny subarrays
            Sort.insertionSortSubarray(&a, lo, hi)
            return
        }
        
        let mid = lo + (hi - lo) / 2
        sort(&a, &aux, lo, mid)
        sort(&a, &aux, mid + 1, hi)
        
        if !(a[mid+1] < a[mid]) { // already fully sorted, no need to merge
            return
        }
        
        merge(&a, &aux, lo, mid, hi)
    }
    
    private static func merge<T:Comparable>(inout a: [T], inout _ aux: [T], _ lo: Int, _ mid: Int, _ hi: Int) {
        assert(isSorted(a, lo: lo, hi: mid))
        assert(isSorted(a, lo: mid + 1, hi: hi))
        
        if lo >= hi { return }
        
        for k in lo...hi {
            aux.insert(a[k], atIndex: k)
        }
        
        var i = lo
        var j = mid + 1
        
        for k in lo...hi {
            if i > mid { // used up left side
                //                a[k] = aux[j++] // copy over the rest of right side (unnecessary since copied from original array)
                break
            } else if j > hi { // used up right side
                a[k] = aux[i++] // copy over rest of left side
            } else if aux[j] < aux[i] {
                a[k] = aux[j++]
            } else {
                a[k] = aux[i++]
            }
        }
        
        assert(isSorted(a, lo: lo, hi: hi))
    }
    
    private static func isSorted<T:Comparable>(a: [T], lo: Int, hi: Int) -> Bool {
        if lo >= hi { return true }
        for i in lo..<(hi-1) {
            if a[i] > a[i+1] {
                return false
            }
        }
        return true
    }
}
