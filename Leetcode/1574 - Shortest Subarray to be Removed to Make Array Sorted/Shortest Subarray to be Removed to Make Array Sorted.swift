//
//  Shortest Subarray to be Removed to Make Array Sorted.swift
//  Leetcode
//
//  Created by Marc MOSCA on 15/11/2024.
//

import Foundation

class Solution {
    
    /// Finds the length of the shortest subarray to remove in order to make the array sorted in ascending order.
    ///
    /// This function identifies the shortest subarray that, when removed, makes the rest of the array sorted in non-decreasing order.
    /// It uses a two-pointer approach to evaluate possible subarrays efficiently.
    ///
    /// - Parameter arr: An array of integers to evaluate.
    ///
    /// - Returns: The length of the shortest subarray that needs to be removed to make the array sorted.
    ///
    /// - Note: This function assumes the input array is non-empty. It efficiently handles cases where the array is already sorted.
    ///
    /// - Complexity:
    ///   - Time complexity: O(n), where `n` is the number of elements in `arr`, due to the single pass to find `right` and the two-pointer traversal.
    ///   - Space complexity: O(1), as it operates in-place without using additional data structures.
    ///
    /// - Example:
    ///   ```swift
    ///   findLengthOfShortestSubarray([1, 2, 3, 10, 4, 2, 3, 5]) // Returns 3
    ///   findLengthOfShortestSubarray([1, 2, 3, 4, 5])           // Returns 0 (already sorted)
    ///   findLengthOfShortestSubarray([5, 4, 3, 2, 1])           // Returns 4
    ///   ```
    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        guard arr.isEmpty == false else { return 0 }
        
        let n: Int = arr.count
        var right: Int = n - 1
        
        while right > 0 && arr[right - 1] <= arr[right] {
            right -= 1
        }
        
        guard right != 0 else { return 0 }
        
        var minimumLength: Int = right
        
        for left in 0 ..< n {
            guard left == 0 || arr[left - 1] <= arr[left] else { break }
            
            while right < n && arr[left] > arr[right] {
                right += 1
            }
            
            minimumLength = min(minimumLength, (right - left - 1))
        }
        
        return minimumLength
    }
    
}
