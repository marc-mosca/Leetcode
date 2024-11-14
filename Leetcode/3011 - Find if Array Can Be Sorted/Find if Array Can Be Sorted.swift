//
//  Find if Array Can Be Sorted.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

final class FindIfArrayCanBeSortedSolution {
    
    /// Counts the number of 1s in the binary representation of an integer.
    ///
    /// This function converts the integer `num` into its binary form and counts the occurrences of the character `"1"`.
    ///
    /// - Parameter num: The integer to convert to binary and evaluate.
    ///
    /// - Returns: The number of 1s in the binary representation of `num`.
    ///
    /// - Complexity: The function has a time complexity of O(log n).
    ///
    /// - Example:
    ///   ```swift
    ///   countBits(5) // Returns 2, as 5 in binary is "101"
    ///   countBits(8) // Returns 1, as 8 in binary is "1000"
    ///   ```
    func countBits(_ num: Int) -> Int {
        return String(num, radix: 2).filter { $0 == "1" }.count
    }
    
    /// Determines if an array can be sorted based on the number of 1s in each element's binary representation.
    ///
    /// This function iterates through an array of integers and checks if the array can be "sorted" by grouping elements based on the count of 1s
    /// in their binary representations. It requires that each group, identified by the same bit count, maintains increasing values across groups.
    ///
    /// - Parameter nums: An array of integers to check for sortable grouping based on binary 1-counts.
    ///
    /// - Returns: A Boolean value indicating whether the array `nums` can be sorted according to the specified criteria.
    ///
    /// - Note: This function uses a helper function `countBits(_:)` to calculate the number of 1s in each integer's binary representation.
    ///
    /// - Complexity: The function has a time complexity of O(n log m), where `n` is the length of `nums` and `m` is the largest integer in `nums`.
    ///
    /// - Example:
    ///   ```swift
    ///   canSortArray([3, 7, 8, 15]) // Returns true if the array can be sorted by 1s count
    ///   canSortArray([8, 4, 2, 1])  // Returns false as it cannot be sorted as required
    ///   ```
    func canSortArray(_ nums: [Int]) -> Bool {
        var currentMinimum: Int = nums[0]
        var currentMaximum: Int = nums[0]
        var previousMaximum: Int = Int.min
        
        for num in nums {
            if countBits(num) == countBits(currentMinimum) {
                currentMinimum = min(currentMinimum, num)
                currentMaximum = max(currentMaximum, num)
                continue
            }
            
            if currentMinimum < previousMaximum {
                return false
            }
            
            previousMaximum = currentMaximum
            currentMinimum = num
            currentMaximum = num
        }
        
        return currentMinimum > previousMaximum
    }
    
}
