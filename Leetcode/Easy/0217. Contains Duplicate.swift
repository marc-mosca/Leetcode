//
//  0217. Contains Duplicate.swift
//  Leetcode
//
//  Created by Marc MOSCA on 18/11/2024.
//

import Foundation

final class ContainsDuplicate {
    
    /// Contains Duplicate.
    ///
    /// Given an integer array `nums`, return `true` if any value appears at least twice in the array,
    /// and return `false` if every element is distinct.
    ///
    /// - Parameter nums: An array of integers.
    ///
    /// - Returns: `true` if any value appears at least twice in the array, or `false` if every element is distinct.
    ///
    /// Example:
    /// ```swift
    /// nums = [1, 2, 3, 1]
    /// containsDuplicate(nums) // Returns true
    ///
    /// nums = [1, 2, 3, 4]
    /// containsDuplicate(nums) // Returns false
    ///
    /// nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
    /// containsDuplicate(nums) // Returns true
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n), where n is the length of the `nums`.
    /// >
    /// > Space: O(n), where n is the length of the `nums`.
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
    
}
