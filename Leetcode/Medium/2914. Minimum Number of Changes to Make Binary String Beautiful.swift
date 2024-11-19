//
//  2914. Minimum Number of Changes to Make Binary String Beautiful.swift
//  Leetcode
//
//  Created by Marc MOSCA on 19/11/2024.
//

import Foundation

final class MinimumNumberOfChangesToMakeBinaryStringBeautiful {
    
    /// Minimum Number of Changes to Make Binary String Beautiful.
    ///
    /// Given a 0-indexed binary string `s` having an even length.
    /// A string is beautiful if it's possible to partition it into one or more substrings such that :
    ///
    /// - Each substring has an even length.
    /// - Each substring contains only `1`'s or only `0`'s.
    ///
    /// You can change any character in `s` to `0` or `1`.
    ///
    /// - Parameter s: The input string to evaluate for consecutive character differences.
    ///
    /// - Returns: An integer representing the minimum number of changes required for all consecutive characters to match.
    ///
    /// Example:
    /// ```swift
    /// s = "1001"
    /// minChanges(s) // Returns 2
    ///
    /// s = "10"
    /// minChanges(s) // Returns 1
    ///
    /// s = "0000"
    /// minChanges(s) // Returns 0
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n).
    func minChanges(_ s: String) -> Int {
        let chars: [String.Element] = Array(s)
        var minimumChangesRequired: Int = 0
        
        for i in stride(from: 0, to: chars.count, by: 2) {
            if chars[i] != chars[i + 1] {
                minimumChangesRequired += 1
            }
        }
        
        return minimumChangesRequired
    }
    
}
