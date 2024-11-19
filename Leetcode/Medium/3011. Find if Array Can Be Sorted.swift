//
//  3011. Find if Array Can Be Sorted.swift
//  Leetcode
//
//  Created by Marc MOSCA on 19/11/2024.
//

import Foundation

final class FindIfArrayCanBeSorted {
    
    /// Find if Array Can Be Sorted.
    ///
    /// Given a 0-indexed array of positive integers `nums`.
    /// In one operation, you can swap any two adjecent elements if they have the same number of set bits.
    /// You are allowed to do this operation any number of times (including zero).
    ///
    /// - Parameter nums: An array of integers to check for sortable grouping based on binary 1-counts.
    ///
    /// - Returns: `true` if `nums` can be sorted, otherwise return `false`.
    ///
    /// Example:
    /// ```swift
    /// nums = [8, 4, 2, 30, 15]
    /// canSortArray(nums) // Returns true
    ///
    /// nums = [1, 2, 3, 4, 5]
    /// canSortArray(nums) // Returns true
    ///
    /// nums = [3, 16, 8, 4, 2]
    /// canSortArray(nums) // Returns false
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n log m), where `n` is the length of `nums` and `m` is the largest integer in `nums`.
    func canSortArray(_ nums: [Int]) -> Bool {
        var currentMinimum: Int = nums[0]
        var currentMaximum: Int = nums[0]
        var previousMaximum: Int = Int.min
        
        for num in nums {
            if self.countBits(num) == self.countBits(currentMinimum) {
                currentMinimum = min(currentMinimum, num)
                currentMaximum = max(currentMaximum, num)
                continue
            }
            
            guard currentMinimum >= previousMaximum else { return false }
            
            previousMaximum = currentMaximum
            currentMinimum = num
            currentMaximum = num
        }
        
        return currentMinimum > previousMaximum
    }
    
    /// Counts the number of 1s in the binary representation of an integer.
    ///
    /// - Parameter num: The integer to convert to binary and evaluate.
    ///
    /// - Returns: The number of 1s in the binary representation of `num`.
    private func countBits(_ num: Int) -> Int {
        return String(num, radix: 2).filter { $0 == "1" }.count
    }
    
}
