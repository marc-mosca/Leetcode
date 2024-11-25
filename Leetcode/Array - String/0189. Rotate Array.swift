//
//  0189. Rotate Array.swift
//  Leetcode
//
//  Created by Marc MOSCA on 24/11/2024.
//

import Foundation

/*
 
 Problem 189: Rotate array.
 
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.
 
 Example 1:
 
 Input: nums = [1, 2, 3, 4, 5, 6, 7], k = 3
 Output: [5, 6, 7, 1, 2, 3, 4]
 
 Example 2:
 
 Input: nums = [-1, -100, 3, 99], k = 2
 Output: [3, 99, -1, -100]
 
 Constraints:
 
 - 1 <= nums.length <= 10^5
 - -2^31 <= nums[i] <= 2^31 - 1
 - 0 <= k <= 10^5
 
 */

extension Solution {
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        for _ in 0 ..< k {
            let deleted: Int = nums.removeLast()
            
            nums.insert(deleted, at: 0)
        }
    }
    
}
