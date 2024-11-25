//
//  0055. Jump Game.swift
//  Leetcode
//
//  Created by Marc MOSCA on 25/11/2024.
//

import Foundation

/*
 
 Problem 55: Jump game.
 
 You are given an integer array nums.
 You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.
 
 Return true if you can reach the last index, or false otherwise.
 
 Example 1:
 
 Input: nums = [2, 3, 1, 1, 4]
 Output: true
 
 Example 2:
 
 Input: nums = [3, 2, 1, 0, 4]
 Output: false
 
 Constraints:
 
 - 1 <= nums.length <= 10^4
 - 0 <= nums[i] <= 10^5
 
 */

extension Solution {
    
    func canJump(_ nums: [Int]) -> Bool {
        var reach: Int = 0
        var i: Int = 0
        
        while i <= reach {
            reach = max(reach, nums[i] + i)
            
            if reach >= nums.count - 1 {
                return true
            }
            
            i += 1
        }
        
        return false
    }
    
}
