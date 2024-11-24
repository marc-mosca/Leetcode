//
//  0080. Remove Duplicates From Sorted Array II.swift
//  Leetcode
//
//  Created by Marc MOSCA on 24/11/2024.
//

import Foundation

/*
 
 Problem 80: Remove duplicates from sorted array II.
 
 Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice.
 The relative order of the elements should be kept the same.
 
 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums.
 More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result.
 It does not matter what you leave beyond the first k elements.
 
 Return k after placing the final result in the first k slots of nums.
 
 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
 
 Example 1:
 
 Input: nums = [1, 1, 1, 2, 2, 3]
 Output: 5, nums = [1, 1, 2, 2, 3, _]
 
 Example 2:
 
 Input: nums = [0, 0, 1, 1, 1, 1, 2, 3, 3]
 Output: 7, nums = [0, 0, 1, 1, 2, 3, 3, _, _]
 
 Constraints:
 
 - 1 <= nums.length <= 3 * 10^4
 - -10^4 <= nums[i] <= 10^4
 - nums is sorted in non-decreasing order.
 
 */

extension Solution {
    
    func removeDuplicatesII(_ nums: inout [Int]) -> Int {
        var numberOfRemovedValues: Int = 0
        var i: Int = 1
        
        while i < (nums.count - numberOfRemovedValues - 1) {
            if (nums[i - 1] == nums[i + 1]) {
                nums.append(nums[i])
                nums.remove(at: i)
                numberOfRemovedValues += 1
                i -= 1
            }
            i += 1
        }
        
        return nums.count - numberOfRemovedValues
    }
    
}