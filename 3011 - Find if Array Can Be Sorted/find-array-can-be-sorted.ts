//
//  find-array-can-be-sorted.ts
//  Leetcode
//
//  Created by Marc MOSCA on 06/11/2024.
//

function countBits(num: number): number
{
    return num.toString(2).match(/1/g).length;
}

function canSortArray(nums: number[]): boolean
{
    let currentMinimum: number = nums[0];
    let currentMaximum: number = nums[0];
    let previousMaximum: number = Number.NEGATIVE_INFINITY;

    for (let i: number = 0; i < nums.length; i++)
    {
        if (countBits(nums[i]) === countBits(currentMinimum))
        {
            currentMinimum = Math.min(currentMinimum, nums[i]);
            currentMaximum = Math.max(currentMaximum, nums[i]);
        }
        else
        {
            if (currentMinimum < previousMaximum)
            {
                return (false);
            }
            previousMaximum = currentMaximum;
            currentMinimum = nums[i];
            currentMaximum = nums[i];
        }
    }
    return (currentMinimum > previousMaximum);
}
