//
//  Rotate String.swift
//  Leetcode
//
//  Created by Marc MOSCA on 14/11/2024.
//

import Foundation

class Solution {
    
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        return (s + s).contains(goal)
    }
    
}
