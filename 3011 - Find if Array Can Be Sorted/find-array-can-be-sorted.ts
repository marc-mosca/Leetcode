//
//  find-array-can-be-sorted.ts
//  Leetcode
//
//  Created by Marc MOSCA on 06/11/2024.
//

function countBits(num: number): number {
    let count: number = 0

    for (; num > 0; num >>= 1) {
        count += num & 1
    }

    return count
}

function canSortArray(nums: number[]): boolean {
    let maximum: number = nums[0]
    let minimum: number = nums[0]
    let previous: number = countBits(nums[0])
    let previousMaximum: number | undefined = undefined

    for (let i: number = 1; i < nums.length; i++) {
        const current: number = countBits(nums[i])

        if (current !== previous) {
            if (previousMaximum !== undefined && previousMaximum > minimum) {
                return false
            }

            previousMaximum = maximum;
            maximum = nums[i]
            minimum = nums[i]
        }
        else {
            maximum = Math.max(maximum, nums[i])
            minimum = Math.min(minimum, nums[i])
        }

        previous = current
    }

    return previousMaximum === undefined || previousMaximum <= minimum
}
