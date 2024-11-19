//
//  2064. Minimized Maximum of Products Distributed to Any Store.swift
//  Leetcode
//
//  Created by Marc MOSCA on 19/11/2024.
//

import Foundation

final class MinimizedMaximumOfProductsDistributedToAnyStore {
    
    /// Minimized Maximum of Products Distributed to Any Store.
    ///
    /// Given an integer `n` indicating there are `n` specialty retail stores.
    /// There are `m` product types of varing amounts, which are given as a 0-indexed integer array `quantities`,
    /// where `quantities[i]` represents the number of products of the `i^th` product type.
    ///
    /// You need to distribute all products to the retail stores following these rules:
    ///
    /// - A store can only be given at most one product type but can be given any amount of it.
    /// - After distribution, each store will have been given some number of products (possibly `0`).
    /// Let `x` represent the maximum number of products given to any store. You want `x` to be as small as possible,
    /// i.e., you want to minimize the maximum number of products that are given to any store.
    ///
    /// Return the minimum possible `x`.
    ///
    /// - Parameters:
    ///   - n: The total number of distribution groups.
    ///   - quantities: An array of integers representing the quantities to be distributed.
    ///
    /// - Returns: The minimized maximum distribution value for each group.
    ///
    /// Example:
    /// ```swift
    /// n = 6
    /// quantities = [11, 6]
    /// minimizedMaximum(n, quantities) // Returns 3
    ///
    /// n = 7
    /// quantities = [15, 10, 10]
    /// minimizedMaximum(n, quantities) // Returns 5
    ///
    /// n = 1
    /// quantities = [100000]
    /// minimizedMaximum(n, quantities) // Returns 100000
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(m log k), where `m` is the number of quantities and `k` is the range of values for binary search.
    func minimizedMaximum(_ n: Int, _ quantities: [Int]) -> Int {
        guard quantities.count > 1 else { return quantities.first ?? 0 }
        
        var left: Int = 0
        var right: Int = quantities.max() ?? 0
        
        while left < right {
            var middle: Int = (left + right) / 2
            
            if self.canDistribute(quantities: quantities, n: n, x: middle) == true {
                right = middle
            }
            else {
                left = middle + 1
            }
        }
        
        return left
    }
    
    /// Determines if it is possible to distribute a set of quantities within a given limit.
    ///
    /// - Parameters:
    ///   - quantities: An array representing the quantities to be distributed.
    ///   - n: The total number of distributions to perform.
    ///   - x: The maximum allowable amount for each distribution.
    ///
    /// - Returns: `true` if it is possible to distribute the quantities within the given limit `x`, otherwise `false`.
    private func canDistribute(quantities: [Int], n: Int, x: Int) -> Bool {
        var j: Int = 0
        var remaining: Int = quantities[j]
        
        for i in 0 ..< n {
            if remaining > x {
                remaining -= x
                continue
            }
            
            j += 1
            
            guard j != quantities.count else { return true }
            
            remaining = quantities[j]
        }
        
        return false
    }
    
}
