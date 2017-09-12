//
//  Shuffle.swift
//  Algorithms
//
//  Created by Laura Skelton on 12/14/15.
//  Copyright © 2015 Laura Skelton. All rights reserved.
//

import Foundation

public class Random {
    public static func shuffle<T:Comparable>(inout a : [T]) {
        let n = a.count
        for i in 0..<n {
            let r = Int(arc4random_uniform(UInt32(i + 1)))
            (a[i], a[r]) = (a[r], a[i])
        }
    }
}
