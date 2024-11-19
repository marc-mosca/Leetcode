//
//  2601. Prime Substraction Operation.swift
//  Leetcode
//
//  Created by Marc MOSCA on 19/11/2024.
//

import Foundation

final class PrimeSubstractionOperation {
    
    /// Prime Substraction Operation.
    ///
    /// Given a 0-indexed integer array `nums` of length `n`.
    /// You can perform the following operation as many times as you want:
    ///
    /// - Pick an index `i` that you haven't picked before, and pick a prime `p` strictly less than `nums[i]`,
    /// then substract `p` from `nums[i]`.
    ///
    /// - Parameter num: An array of integers to be modified by the prime subtraction operation.
    ///
    /// - Returns: `true` if you can make `nums` a strictly increasing array using the above operation and
    /// `false` otherwise.
    ///
    /// Example:
    /// ```swift
    /// nums = [4, 9, 6, 10]
    /// primeSubOperation(nums) // Returns true
    ///
    /// nums = [6, 8, 11, 12]
    /// primeSubOperation(nums) // Returns true
    ///
    /// nums = [5, 8, 3]
    /// primeSubOperation(nums) // Returns false
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(log n) due to the prime-checking operations for each elements in `nums`.
    func primeSubOperation(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        
        let maximumElement: Int = nums.max() ?? 0
        var previousPrime: [Int] = Array(repeating: 0, count: maximumElement + 1)
        var nums: [Int] = nums
        
        for i in 2 ... maximumElement {
            previousPrime[i] = self.isPrime(i) == true ? i : previousPrime[i - 1]
        }
        
        for i in 0 ..< nums.count {
            let bound: Int = i == 0 ? nums[0] : nums[i] - nums[i - 1]
            
            guard bound > 0 else { return false }
            
            nums[i] -= previousPrime[bound - 1]
        }
        
        return true
    }
    
    /// Determines if a given integer is a prime number.
    ///
    /// - Parameter n: The integer to check for primality.
    ///
    /// - Returns: `true` if `n` is prime, otherwise return `false`.
    func isPrime(_ n: Int) -> Bool {
        return n > 1 && (2 ..< n).contains(where: { n % $0 == 0 }) == false
    }
    
}
