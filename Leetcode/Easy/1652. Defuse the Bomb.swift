//
//  1652. Defuse the Bomb.swift
//  Leetcode
//
//  Created by Marc MOSCA on 18/11/2024.
//

import Foundation

final class DefuseTheBomb {
    
    /// Defuse the Bomb.
    ///
    /// You have a bomb to defuse, and your time is running out!
    /// Your informer will provide you with a circular array `code` of length `n` and a key `k`.
    ///
    /// To decrypt the code, you must replace every number. All the numbers are replaced simultaneously.
    ///
    /// - If `k > 0`, replace the i^th number with the sum of the next `k` numbers.
    /// - If `k < 0`, replace the i^th number with the sum of the previous `k` numbers.
    /// - If `k == 0`, replace the i^th number with `0`.
    ///
    /// As `code` is circular, the next element of `code[n - 1]` is `code[0]`,
    /// and the previous element of `code[0]` is `code[n - 1]`.
    ///
    /// Given the circular array `code` and an integer key `k`, return the decrypted code to defuse the bomb!
    ///
    /// - Parameters:
    ///   - code: A circular array of integers.
    ///   - k: The key to defuse the bomb.
    ///
    /// - Returns: An array of integers corresponding to the decrypted code.
    ///
    /// Example:
    /// ```swift
    /// code = [5, 7, 1, 4]
    /// k = 3
    /// decrypt(code, k) // Returns [12, 10, 16, 13]
    ///
    /// code = [1, 2, 3, 4]
    /// k = 0
    /// decrypt(code, k) // Returns [0, 0, 0, 0]
    ///
    /// code = [2, 4, 9, 3]
    /// k = -2
    /// decrypt(code, k) // Returns [12, 5, 6, 13]
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n), where n is the length of the `sentence`.
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n: Int = code.count
        var result: [Int] = Array(repeating: 0, count: n)
        
        guard k != 0 else { return result }
        
        let start: Int = k > 0 ? 1 : (n + k)
        let end: Int = k > 0 ? k : (n - 1)
        
        var sum: Int = 0
        
        for i in start ... end {
            sum += code[i % n]
        }
        
        for i in 0 ..< n {
            result[i] = sum
            sum -= code[(start + i) % n]
            sum += code[(end + i + 1) % n]
        }
        
        return result
    }
    
}
