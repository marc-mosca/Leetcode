//
//  Minimum Number of Changes to Make Binary String Beautiful.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

final class MinimumNumberofChangestoMakeBinaryStringBeautifulSolution {
    
    /// Calculates the minimum number of changes required to make consecutive characters in a string identical.
    ///
    /// This function iterates through each character in the string `s` and counts how many times two consecutive characters are different.
    /// The count represents the minimum number of changes needed to make all consecutive characters in the string the same.
    ///
    /// - Parameter s: The input string to evaluate for consecutive character differences.
    ///
    /// - Returns: An integer representing the minimum number of changes required for all consecutive characters to match.
    ///
    /// - Note: This function assumes that `s` has at least one character. It will throw an error if `s` is empty due to the out-of-bounds access.
    ///
    /// - Complexity: The function has a time complexity of O(n).
    ///
    /// - Example:
    ///   ```swift
    ///   minChanges("abbbaa") // Returns 3
    ///   minChanges("abcde") // Returns 4
    ///   ```
    func minChanges(_ s: String) -> Int {
        var minimumChangesRequired: Int = 0
        
        for i in s.indices {
            let nextIndex: String.Index = s.index(after: i)
            
            if s[i] != s[nextIndex] {
                minimumChangesRequired += 1
            }
        }
        
        return minimumChangesRequired
    }
    
}
