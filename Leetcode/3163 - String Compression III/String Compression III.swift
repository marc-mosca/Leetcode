//
//  String Compression III.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

final class StringCompressionIIISolution {
    
    /// Compresses a string by counting consecutive identical characters and representing them as a count followed by the character.
    ///
    /// This function takes a `word` and compresses it by replacing consecutive identical characters with a single instance of the character
    /// prefixed by the count of its occurrences. The count for any character group is limited to 9 for simplicity.
    ///
    /// - Parameter word: The input string to compress.
    ///
    /// - Returns: A compressed string where each sequence of identical characters is represented by its count followed by the character itself.
    ///
    /// - Note: This function limits each character count to 9, so groups larger than 9 will reset the count for that character group.
    ///
    /// - Complexity: The function has a time complexity of O(n).
    ///
    /// - Example:
    ///   ```swift
    ///   compressedString(word: "aaabbbcc") // Returns "3a3b2c"
    ///   compressedString(word: "ab")       // Returns "1a1b"
    ///   ```
    func compressedString(word: String) -> String {
        var comp: String = ""
        var counter: Int = 1
        
        for i in word.indices {
            let nextIndex: String.Index = word.index(after: i)
            
            if (counter < 9 && word[i] == word[nextIndex]) {
                counter += 1
                continue
            }
            
            comp += String(counter)
            comp += String(word[i])
            counter = 1
        }
        
        return comp
    }
    
}
