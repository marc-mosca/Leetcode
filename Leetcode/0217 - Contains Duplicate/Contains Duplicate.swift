//
//  Contains Duplicate.swift
//  Leetcode
//
//  Created by Marc MOSCA on 15/11/2024.
//

import Foundation

class ContainsDuplicateSolution {
    
    /// Determines if an array contains any duplicate values.
    ///
    /// This function checks whether the given array `nums` has duplicate elements by comparing the count of unique elements
    /// (using a `Set`) with the total count of elements in the array. If the counts differ, the array contains duplicates.
    ///
    /// - Parameter nums: An array of integers to check for duplicates.
    ///
    /// - Returns: A Boolean value indicating whether the array contains duplicate values (`true`) or not (`false`).
    ///
    /// - Complexity:
    ///   - Time complexity: O(n), where `n` is the number of elements in `nums`, as creating a `Set` involves iterating through the array once.
    ///   - Space complexity: O(n), due to the space required to store the unique elements in the `Set`.
    ///
    /// - Example:
    ///   ```swift
    ///   containsDuplicate([1, 2, 3, 4]) // Returns false
    ///   containsDuplicate([1, 2, 3, 1]) // Returns true
    ///   containsDuplicate([])           // Returns false
    ///   ```
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
    
}
