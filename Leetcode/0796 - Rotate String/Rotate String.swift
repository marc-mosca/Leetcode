//
//  Rotate String.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

class Solution {
    
    /// Checks if a string can be rotated to match a target string.
    ///
    /// This function determines whether the given string `s` can be rotated in such a way that it becomes identical to the string `goal`.
    ///
    /// - Parameters:
    ///   - s: The original string to be rotated.
    ///   - goal: The target string to match by rotation of `s`.
    ///
    /// - Returns: Returns `true` if `goal` can be obtained by rotating `s`, and `false` otherwise.
    ///
    /// - Note: If `s` and `goal` are not of the same length, the function immediately returns `false`.
    ///
    /// - Complexity: The function has a time complexity of O(n).
    ///
    /// - Example:
    ///   ```swift
    ///   rotateString("abcde", "cdeab") // Returns true
    ///   rotateString("abcde", "abced") // Returns false
    ///   ```
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        return (s + s).contains(goal)
    }
    
}
