//: Bottom Up Mergesort Playground

import UIKit

public class BUMerge {
    private static let cutoff = 7
    
    public static func sort<T:Comparable>(inout a : [T]) {
        var aux = [T]()
        aux.reserveCapacity(a.count)
        
        let n = a.count
        for var size = 1; size < n; size = size + size {
            for var lo = 0; lo < n - size; lo += size + size {
                merge(&a, &aux, lo, lo + size - 1, min(lo + size + size - 1, n - 1))
            }
        }
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

func isSorted<T:Comparable>(a: [T]) -> Bool {
    for i in 0..<(a.count - 1) {
        if a[i] > a[i+1] {
            return false
        }
    }
    return true
}

var numberArray = [90, 77, -81, -32, 25, -38, 81, -83, 55, 59, -1, 20, 21, -44, 3, -90, 50, -78, 57, -91, 18, 98, 80, -4, 85, 28, 97, -47, -86, -64, 49, -23, -25, 63, -82, 74, 24, 69, -68, -93, 87, 64, 82, 33, 52, 12, -29, 54, -87, -67, -50, -63, -95, -46, 47, 8, -65, -31, 13, -98, 38, 95, -28, 2, -14, -18, -19, -6, 60, -15, 9, 93, -71, 27, 22, 31, 89, 99, -70, 15, -76, 11, -94, -51, 1, 76, -30, 58, 40, 96, 92, -77, 68, 37, -17, -8, -92, -72, -35, -22]

BUMerge.sort(&numberArray)

numberArray

isSorted(numberArray)
