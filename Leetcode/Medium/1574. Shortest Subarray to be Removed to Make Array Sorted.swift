//
//  1574. Shortest Subarray to be Removed to Make Array Sorted.swift
//  Leetcode
//
//  Created by Marc MOSCA on 19/11/2024.
//

import Foundation

final class ShortestSubarrayToBeRemovedToMakeArraySorted {
    
    /// Shortests Subarray to be Removed to Make Array Sorted.
    ///
    /// Given an integer array `arr`, remove a subarray (can be empty) from `arr` such that the remaining
    /// elements in `arr` are non-decreasing.
    ///
    /// - Parameter arr: An array of integers.
    ///
    /// - Returns: The length of the shortest subarray to remove.
    ///
    /// Example:
    /// ```swift
    /// arr = [1, 2, 3, 10, 4, 2, 3, 5]
    /// findLengthOfShortestSubarray(arr) // Returns 3
    ///
    /// arr = [5, 4, 3, 2, 1]
    /// findLengthOfShortestSubarray(arr) // Returns 4
    ///
    /// arr = [1, 2, 3]
    /// findLengthOfShortestSubarray(arr) // Returns 0
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n), where n is the length of the `arr`.
    /// >
    /// > Space: O(n), where n is the length of the `arr`.
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
