//
//  0121. Best Time to Buy and Sell Stock.swift
//  Leetcode
//
//  Created by Marc MOSCA on 24/11/2024.
//

import Foundation

/*
 
 Problem 121: Best time to buy and sell stock.
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.
 
 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
 
 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 
 Example 1:
 
 Input: prices = [7, 1, 5, 3, 6, 4]
 Output: 5
 
 Example 2:
 
 Input: prices = [7, 6, 4, 3, 1]
 Output: 0
 
 Constraints:
 
 - 1 <= prices.length <= 10^5
 - 0 <= prices[i] <= 10^4
 
 */

extension Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var minimumPrice: Int = Int.max
        var maximumProfit: Int = 0
        
        for price in prices {
            minimumPrice = min(price, minimumPrice)
            maximumProfit = max(maximumProfit, price - minimumPrice)
        }
        
        return maximumProfit
    }
    
}
