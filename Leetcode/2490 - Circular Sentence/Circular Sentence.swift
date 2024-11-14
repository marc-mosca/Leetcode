//
//  Circular Sentence.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

final class CircularSentenceSolution {
    
    /// Determines if a sentence is "circular" by comparing the first and last characters and ensuring each word transition is smooth.
    ///
    /// A sentence is considered "circular" if it meets two conditions:
    /// 1. The last character of the sentence is the same as the first character.
    /// 2. For each word in the sentence, the last character of the previous word matches the first character of the next word.
    ///
    /// - Parameter sentence: A string representing the sentence to check for circularity.
    ///
    /// - Returns: A Boolean value indicating whether the sentence is circular (`true`) or not (`false`).
    ///
    /// - Note: This function assumes that words are separated by a single space. It will return `false` if a space transition does not meet the circularity condition.
    ///
    /// - Complexity: The function has a time complexity of O(n).
    ///
    /// - Example:
    ///   ```swift
    ///   isCircularSentence("she sells sea shells") // Returns true
    ///   isCircularSentence("the cat eats") // Returns false
    ///   ```
    func isCircularSentence(_ sentence: String) -> Bool {
        for i in sentence.indices {
            let previousIndex: String.Index = sentence.index(before: i)
            let nextIndex: String.Index = sentence.index(after: i)
            
            if sentence[i] == " " && sentence[previousIndex] != sentence[nextIndex] {
                return false
            }
        }
        
        return sentence.first == sentence.last
    }
    
}
