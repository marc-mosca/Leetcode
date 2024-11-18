//
//  DefuseTheBomb.swift
//  Leetcode
//
//  Created by Marc MOSCA on 18/11/2024.
//

import Foundation

final class DefuseTheBombSolution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n: Int = code.count
        
        guard k != 0 else { return [Int](repeating: 0, count: n) }
        
        let extendedCode: [Int] = code + code
        let absoluteK: Int = abs(k)
        
        return (0 ..< n).map { i in
            if k > 0 {
                return extendedCode[(i + 1) ... (i + absoluteK)].reduce(0, +)
            }
            
            return extendedCode[(i + n - absoluteK) ..< (i + n)].reduce(0, +)
        }
    }
}
