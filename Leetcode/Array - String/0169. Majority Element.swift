//
//  0169. Majority Element.swift
//  Leetcode
//
//  Created by Marc MOSCA on 24/11/2024.
//

import Foundation

/*
 
 Problem 169: Majority element.
 
 Given an array nums of size n, return the majority element.
 
 The majority element is the element that appears more than ⌊n / 2⌋ times.
 You may assume that the majority element always exists in the array.
 
 Example 1:
 
 Input: nums = [3, 2, 3]
 Output: 3
 
 Example 2:
 
 Input: nums = [2, 2, 1, 1, 1, 2, 2]
 Output: 2
 
 Constraints:
 
 - n == nums.length
 - 1 <= n <= 5 * 10^4
 - -10^9 <= nums[i] <= 10^9
 
 */

extension Solution {
    
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate: Int = 0
        var count: Int = 0
        
        for num in nums {
            if count == 0 {
                candidate = num
            }
            
            count += (num == candidate) ? 1 : -1
        }
        
        return candidate
    }
    
}
