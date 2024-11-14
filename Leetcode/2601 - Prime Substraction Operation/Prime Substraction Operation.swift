//
//  Prime Substraction Operation.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

final class PrimeSubstractionOperationSolution {
    
    /// Determines if a given integer is a prime number.
    ///
    /// This function checks if an integer `n` is prime by testing for divisibility from 2 up to, but not including, `n`.
    ///
    /// - Parameter n: The integer to check for primality.
    ///
    /// - Returns: A Boolean value indicating whether `n` is prime (`true`) or not (`false`).
    ///
    /// - Complexity: The function has a time complexity of O(√n) in practice, due to early exits when factors are found, though the worst case checks up to `n`.
    ///
    /// - Example:
    ///   ```swift
    ///   isPrime(7) // Returns true
    ///   isPrime(10) // Returns false
    ///   ```
    func isPrime(_ n: Int) -> Bool {
        guard n > 1 else { return false }
        return !(2 ..< n).contains { n % $0 == 0 }
    }
    
    /// Modifies an array of integers by performing a "prime subtraction" operation, ensuring each element remains positive and decreases in value.
    ///
    /// This function iteratively subtracts the largest possible prime number, less than or equal to a calculated bound, from each element in the array `nums`.
    /// The goal is to make sure that each element in `nums` remains positive and strictly decreases with each operation.
    ///
    /// - Parameter nums: An array of integers to be modified by the "prime subtraction" operation.
    ///
    /// - Returns: A Boolean value indicating if the operation was successful (`true`) or not (`false`). The operation fails if any element would become non-positive or non-decreasing after subtraction.
    ///
    /// - Note: This function uses a helper `isPrime(_:)` to determine prime numbers and caches the results for efficient lookups.
    ///
    /// - Complexity: The function has a time complexity of O(n * log n) due to the prime-checking operations for each element in `nums`.
    ///
    /// - Example:
    ///   ```swift
    ///   var nums = [10, 15, 20]
    ///   primeSubOperation(&nums) // Returns true; nums might become [7, 11, 13] depending on primes found.
    ///   ```
    func primeSubOperation(_ nums: inout [Int]) -> Bool {
        let maximumElement: Int = nums.max() ?? 0
        var previousPrime: [Int] = Array(repeating: 0, count: maximumElement + 1)
        
        for i in 2 ... maximumElement {
            previousPrime[i] = isPrime(i) ? i : previousPrime[i - 1]
        }
        
        for i in 0 ..< nums.count {
            let bound = i == 0 ? nums[0] : nums[i] - nums[i - 1]
            
            guard bound > 0 else { return false }
            
            nums[i] -= previousPrime[bound - 1]
        }
        
        return true
    }
    
}
