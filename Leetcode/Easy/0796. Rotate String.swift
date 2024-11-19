//
//  0796. Rotate String.swift
//  Leetcode
//
//  Created by Marc MOSCA on 18/11/2024.
//

import Foundation

final class RotateString {
    
    /// Rotate String.
    ///
    /// Given two strings `s` and `goal`, return `true` if and only if `s` can become `goal` after some number shifts
    /// on `s`, otherwise return `false`.
    ///
    /// A shift on `s` consists of moving the leftmost character of `s` to the rightmost position.
    ///
    /// - Parameters:
    ///   - s: The original string to be rotated.
    ///   - goal: The target string to match by rotation of `s`.
    ///
    /// - Returns: `true` if `goal` can be obtained by rotating `s`, and `false` otherwise.
    ///
    /// Example:
    /// ```swift
    /// s = "abcde"
    /// goal = "cdeab"
    /// rotateString(s, goal) // Returns true
    ///
    /// s = "abcde"
    /// goal = "abced"
    /// rotateString(s, goal) // Returns false
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n), where n is the length of the `s`.
    func rotateString(_ s: String, _ goal: String) -> Bool {
        return s.count == goal.count && (s + s).contains(goal)
    }
    
}
