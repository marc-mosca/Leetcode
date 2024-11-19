//
//  3163. String Compression III.swift
//  Leetcode
//
//  Created by Marc MOSCA on 19/11/2024.
//

import Foundation

final class StringCompressionIII {
    
    /// String Compression III.
    ///
    /// Given a string `word`, compress it using the following algorithm :
    ///
    /// - Begin with an empty string `comp`. While `word` is not empty, use the following operation:
    ///     - Remove a maximum length prefix of `word` make of a single character `c` repeating at most 9 times.
    ///     - Append the length of the prefix followed by `c` to `comp`.
    ///
    /// - Parameter word: The input string to compress.
    ///
    /// - Returns: A compressed string where each sequence of identical characters is represented by its count followed by the character itself.
    ///
    /// Example:
    /// ```swift
    /// word = "abcde"
    /// compressedString(word) // Returns "1a1b1c1d1e"
    ///
    /// word = "aaaaaaaaaaaaaabb"
    /// compressedString(word) // Returns "9a5a2b"
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n), where `n` is the length of `word`.
    func compressedString(_ word: String) -> String {
        guard word.isEmpty == false else { return "" }
        
        let chars: [Character] = Array(word)
        
        var comp: String = ""
        var counter: Int = 1
        var character: Character = word.first!
        
        for i in 1 ..< chars.count {
            if counter < 9 && character == chars[i] {
                counter += 1
                continue
            }
            
            comp += String(counter)
            comp += String(character)
            character = chars[i]
            counter = 1
        }
        
        comp += String(counter)
        comp += String(character)
        
        return comp
    }
    
}
