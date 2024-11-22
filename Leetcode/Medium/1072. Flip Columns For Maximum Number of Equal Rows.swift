//
//  1072. Flip Columns For Maximum Number of Equal Rows.swift
//  Leetcode
//
//  Created by Marc MOSCA on 22/11/2024.
//

import Foundation

final class FlipColumnsForMaximumNumberOfEqualRows {
    
    /// Flip Columns For Maximum Number of Equal Rows.
    ///
    /// You are given an `m x n` binary matrix `matrix`. You can choose any number of columns in the matrix
    /// and flip every cell in that column (i.e., Change the value of the cell from `0` to `1` or vice versa).
    ///
    /// - Parameter matrix: An 2D array of integers.
    ///
    /// - Returns: The maximum number of rows that have all values equal after some number of flips.
    ///
    /// Example:
    /// ```swift
    /// matrix = [[0, 1], [1, 1]]
    /// maxEqualRowsAfterFlips(matrix) // Returns 1
    ///
    /// matrix = [[0, 1], [1, 0]]
    /// maxEqualRowsAfterFlips(matrix) // Returns 2
    ///
    /// matrix = [[0, 0, 0], [0, 0, 1], [1, 1, 0]]
    /// maxEqualRowsAfterFlips(matrix) // Returns 2
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n*m)
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        guard matrix.isEmpty == false else { return 0 }
        
        var patternFrequences: [String: Int] = [:]
        
        for row in matrix {
            var pattern: String = ""
            
            if row[0] == 0 {
                pattern = row.map(String.init).joined()
            }
            else {
                pattern = row.map({ String($0 ^ 1) }).joined()
            }
            
            patternFrequences[pattern, default: 0] += 1
        }
        
        return patternFrequences.values.max() ?? 0
    }
    
}
