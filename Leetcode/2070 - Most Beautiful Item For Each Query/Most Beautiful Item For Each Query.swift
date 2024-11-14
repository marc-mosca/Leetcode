//
//  Most Beautiful Item For Each Query.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

class MostBeautifulItemForEachQuerySolution {
    
    /// Performs a binary search on a sorted list of items to find the maximum "beauty" within a price limit.
    ///
    /// This function uses binary search to find the maximum "beauty" value within a list of items, given a specific `targetPrice`.
    /// Each item is represented by an array of two integers, where the first integer is the price and the second integer is the "beauty" value.
    ///
    /// - Parameters:
    ///   - items: A sorted two-dimensional array where each subarray contains two integers. The first integer is the price, and the second is the "beauty" value of the item.
    ///   - targetPrice: The maximum price to consider for the search.
    ///
    /// - Returns: An integer representing the highest beauty value for items with a price less than or equal to `targetPrice`.
    ///
    /// - Complexity: The function has a time complexity of O(log n).
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [[2, 4], [5, 8], [10, 15]]
    ///   let maxBeauty = binarySearch(items, targetPrice: 5) // Returns 8
    ///   ```
    func binarySearch(_ items: [[Int]], targetPrice: Int) -> Int {
        var left: Int = 0
        var right: Int = items.count - 1
        var maxBeauty: Int = 0
        
        while left <= right {
            let middle: Int = (left + right) / 2
            
            if items[middle][0] > targetPrice {
                right = middle - 1
            }
            else {
                maxBeauty = max(maxBeauty, items[middle][1])
                left = middle + 1
            }
        }
        
        return maxBeauty
    }
    
    /// Determines the maximum "beauty" value for each price query in a list of items.
    ///
    /// Given a list of items where each item is represented by a price and a beauty value, this function answers multiple queries to
    /// find the highest beauty value available within a given price limit. The list of items is sorted and preprocessed for efficient querying.
    ///
    /// - Parameters:
    ///   - items: A two-dimensional array where each subarray represents an item, with the first integer as the price and the second as the beauty value.
    ///   - queries: An array of integers representing different price limits for which to find the maximum beauty values.
    ///
    /// - Returns: An array of integers where each element is the maximum beauty value for the corresponding price limit in `queries`.
    ///
    /// - Complexity: The function has a time complexity of O(n log n).
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [[2, 4], [5, 8], [10, 15]]
    ///   let queries = [5, 10]
    ///   let results = maximumBeauty(items, queries) // Returns [8, 15]
    ///   ```
    func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
        var items: [[Int]] = items.sorted { $0[0] < $1[0] }
        var maxBeauty: Int = items[0][1]
        
        for i in 0 ..< items.count {
            maxBeauty = max(maxBeauty, items[i][1])
            items[i][1] = maxBeauty
        }
        
        return queries.map { binarySearch(items, targetPrice: $0) }
    }
    
}
