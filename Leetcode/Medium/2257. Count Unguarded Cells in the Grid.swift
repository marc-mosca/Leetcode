//
//  2257. Count Unguarded Cells in the Grid.swift
//  Leetcode
//
//  Created by Marc MOSCA on 21/11/2024.
//

import Foundation

final class CountUnguardedCellsInTheGrid {
    
    /// Count Unguarded Cells in the Grid.
    ///
    /// You are given two integers `m` and `n` representing a 0-indexed `m x n` grid.
    /// You are also given two 2D integer arrays `guards` and `walls` where `guards[i] = [rowi, coli]`
    /// and `walls[j] = [rowj, colj]` represent the positions of the `ith` guard and `jth` wall respectively.
    ///
    /// A guard can see every cell in the four cardinal directions (north, east, south, or west)
    /// starting from their position unless obstructed by a wall or another guard.
    /// A cell is guarded if there is at least one guard that can see it.
    ///
    /// - Parameters:
    ///   - m: The number of rows of the grid.
    ///   - n: The number of columns of the grid.
    ///   - guards: The positions of guards in the grid.
    ///   - walls: The positions of walls in the grid.
    ///
    /// - Returns: The number of unoccupied cells that are not guarded.
    ///
    /// Example:
    /// ```swift
    /// m = 4
    /// n = 6
    /// guards = [[0, 0], [1, 1], [2, 3]]
    /// walls = [[0, 1], [2, 2], [1, 4]]
    /// countUnguarded(m, n, guards, walls) // Returns 7
    ///
    /// m = 3
    /// n = 3
    /// guards = [[1, 1]]
    /// walls = [[0, 1], [1, 0], [2, 1], [1, 2]]
    /// countUnguarded(m, n, guards, walls) // Returns 4
    /// ```
    ///
    /// > Complexity:
    /// >
    /// > Time: O(n * m), where `n` is the number of columns and `m` the number of rows.
    func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {
        var grid: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for element in (guards + walls) {
            let row: Int = element[0]
            let column: Int = element[1]
            
            grid[row][column] = 2
        }
        
        let directions: [Int] = [-1, 0, 1, 0]
        
        for element in guards {
            for i in 0 ..< directions.count {
                var x: Int = element[0]
                var y: Int = element[1]
                
                let dx: Int = directions[i % directions.count]
                let dy: Int = directions[(i + 1) % directions.count]
                
                while x + dx >= 0 && x + dx < m && y + dy >= 0 && y + dy < n && grid[x + dx][y + dy] < 2 {
                    x += dx
                    y += dy
                    grid[x][y] = 1
                }
            }
        }
        
        return grid.reduce(0) { $0 + $1.filter { $0 == 0 }.count }
    }
    
}
