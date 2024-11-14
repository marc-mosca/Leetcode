//
//  Minimized Maximum of Products Distributed to Any Store.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

class MinimizedMaximumofProductsDistributedtoAnyStoreSolution {
    
    /// Determines if it is possible to distribute a set of quantities within a given limit.
    ///
    /// This function iterates over a specified number of distributions (`n`) and checks if each distribution can be kept within a limit `x`.
    /// It subtracts `x` from each quantity in `quantities` until the distribution is possible or until the quantity is depleted.
    /// If the distribution can be completed with the given limit for each element, it returns `true`.
    ///
    /// - Parameters:
    ///   - quantities: An array representing the quantities to be distributed.
    ///   - n: The total number of distributions to perform.
    ///   - x: The maximum allowable amount for each distribution.
    ///
    /// - Returns: A Boolean value indicating whether it is possible to distribute the quantities within the given limit `x`.
    ///
    /// - Complexity: This function operates in O(n).
    ///
    /// - Example:
    ///   ```swift
    ///   canDistribute(quantities: [10, 20, 30], n: 3, x: 15) // Returns true
    ///   canDistribute(quantities: [10, 20, 30], n: 3, x: 5)  // Returns false
    ///   ```
    func canDistribute(quantities: [Int], n: Int, x: Int) -> Bool {
        var j: Int = 0
        var remaining: Int = quantities[j]
        
        for i in 0 ..< n {
            if remaining > x {
                remaining -= x
                continue
            }
            
            j += 1
            
            if j == quantities.count {
                return true
            }
            
            remaining = quantities[j]
        }
        
        return false
    }
    
    /// Calculates the minimized maximum value for distributing quantities among `n` groups such that the maximum assigned quantity is minimized.
    ///
    /// This function uses binary search to determine the smallest possible maximum (`x`) for each distribution group, while ensuring all quantities
    /// in `quantities` can be distributed across `n` groups within that limit. It leverages the `canDistribute` function to verify feasibility at each
    /// midpoint (`x`) during the search.
    ///
    /// - Parameters:
    ///   - n: The total number of distribution groups.
    ///   - quantities: An array of integers representing the quantities to be distributed.
    ///
    /// - Returns: The minimized maximum distribution value for each group.
    ///
    /// - Note: This function assumes the `canDistribute` helper function to check each midpoint feasibility within the binary search.
    ///
    /// - Complexity: The function has a time complexity of O(m log k), where `m` is the number of quantities and `k` is the range of values for binary search.
    ///
    /// - Example:
    ///   ```swift
    ///   minimizedMaximum(3, [10, 20, 30]) // Returns the minimized maximum, e.g., 15 if this results in the optimal distribution
    ///   minimizedMaximum(2, [10, 20, 30]) // Returns a higher minimized maximum as fewer groups are available
    ///   ```
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
    
}

