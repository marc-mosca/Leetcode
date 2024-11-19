//
//  2070. Most Beautiful Item For Each Query.swift
//  Leetcode
//
//  Created by Marc MOSCA on 19/11/2024.
//

import Foundation

final class MostBeautifulItemForEachQuery {
    
    /// Most Beautiful Item For Each Query.
    ///
    /// Given a 2D integer array `items` where `items[i] = [pricei, beautyi]` denotes the price and beauty of an item.
    ///
    /// You are also given a 0-indexed integer array `queries`.
    /// For each `queries[j]`, you want to determine the maximum beauty of an item whose price is less than
    /// or equal to `queries[j]`.
    /// If no such item exists, then the answer to this query is `0`.
    ///
    /// Return an array `answer` of the same length as `queries` where `answer[j]` is the answer to the j^th query.
    ///
    /// - Parameters:
    ///   - items: A two-dimensional array where each subarray represents an item, with price and beauty value.
    ///   - queries: An array of integers representing different price limits for which to find the max beauty values.
    ///
    /// - Returns: An array of integers where each element is the maximum beauty value for the corresponding price
    /// limit in `queries`.
    ///
    /// Example:
    /// ```swift
    /// items = [[1, 2], [3, 2], [2, 4], [5, 6], [3, 5]]
    /// queries = [1, 2, 3, 4, 5, 6]
    /// maximumBeauty(items, queries) // Returns [2, 4, 5, 5, 6, 6]
    ///
    /// items = [[1, 2], [1, 2], [1, 3], [1, 4]]
    /// queries = [1]
    /// maximumBeauty(items, queries) // Returns [4]
    ///
    /// items = [[10, 1000]]
    /// queries = [5]
    /// maximumBeauty(items, queries) // Returns [0]
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(log n)
    func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
        var items: [[Int]] = items.sorted { $0[0] < $1[0] }
        var maxBeauty: Int = items[0][1]
        
        for i in 0 ..< items.count {
            maxBeauty = max(maxBeauty, items[i][1])
            items[i][1] = maxBeauty
        }
        
        return queries.map { self.binarySearch(items, targetPrice: $0) }
    }
    
    /// Performs a binary search on a sorted list of items to find the maximum "beauty" within a price limit.
    ///
    /// - Parameters:
    ///   - items: A sorted two-dimensional array where each subarray contains two integers (price and beauty).
    ///   - targetPrice: The maximum price to consider for the search.
    ///
    /// - Returns: The highest beauty value for items with a price less than or equal to `targetPrice`.
    private func binarySearch(_ items: [[Int]], targetPrice: Int) -> Int {
        var left: Int = 0
        var right: Int = items.count - 1
        var maximumBeauty: Int = 0
        
        while left <= right {
            let middle: Int = (left + right) / 2
            
            if items[middle][0] > targetPrice {
                right = middle - 1
            }
            else {
                maximumBeauty = max(maximumBeauty, items[middle][1])
                left = middle + 1
            }
        }
        
        return maximumBeauty
    }
    
}
