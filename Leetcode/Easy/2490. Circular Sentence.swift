//
//  2490. Circular Sentence.swift
//  Leetcode
//
//  Created by Marc MOSCA on 18/11/2024.
//

import Foundation

final class CircularSentence {
    
    /// Circular Sentence.
    ///
    /// A sentence is a list of words that are separated by a single space with no leading or trailing spaces.
    ///
    /// Words consist of only uppercase and lowercase English letters.
    /// Uppercase and lowercase English letters are considered different.
    ///
    /// A sentence is circular if:
    /// 1. The last character of a word is equal to the first character of the next word.
    /// 2. The last character of the last word is equal to the first character of the first word.
    ///
    /// Given a string `sentence`, return `true` if it is circular. Otherwise, return `false`.
    ///
    /// - Parameters:
    ///   - sentence: A string representing the sentence to check for circularity.
    ///
    /// - Returns: `true` if `sentence` is circular, and `false` otherwise.
    ///
    /// Example:
    /// ```swift
    /// sentence = "leetcode exercises sound delightful"
    /// isCircularSentence(sentence) // Returns true
    ///
    /// sentence = "eetcode"
    /// isCircularSentence(sentence) // Returns true
    ///
    /// sentence = "Leetcode is cool"
    /// isCircularSentence(sentence) // Returns false
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n), where n is the length of the `sentence`.
    func isCircularSentence(_ sentence: String) -> Bool {
        guard sentence.isEmpty == false else { return true }
        
        let chars: [String.Element] = Array(sentence)
        let n: Int = chars.count
        
        guard n > 1 else { return true }
        guard chars.first == chars.last else { return false }
        
        for i in 0 ..< (n - 1) where chars[i] == " " {
            let previous: String.Element = chars[i - 1]
            let next: String.Element = chars[i + 1]
            
            guard previous == next else { return false }
        }
        
        return true
    }
    
}
