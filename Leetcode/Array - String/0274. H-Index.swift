//
//  0274. H-Index.swift
//  Leetcode
//
//  Created by Marc MOSCA on 04/12/2024.
//

import Foundation

/*
 
 Problem 274: H-Index.
 
 Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return the researcher's h-index.
 
 According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h such that the given researcher has published at least h papers that have each been cited at least h times.
 
 Example 1:
 
 Input: citations = [3,0,6,1,5]
 Output: 3
 
 Example 2:
 
 Input: citations = [1,3,1]
 Output: 1
 
 Constraints:
 
 - n == citations.length
 - 1 <= n <= 5000
 - 0 <= citations[i] <= 1000
 
 */

extension Solution {
    
    func hIndex(_ citations: [Int]) -> Int {
        guard citations.isEmpty == false else { return 0 }
        
        var citations: [Int] = citations.sorted(by: >)
        var h: Int = 0
        
        for (index, citation) in citations.enumerated() {
            guard citation >= index + 1 else { break }
            
            h = index + 1
        }
        
        return h
    }
    
}
