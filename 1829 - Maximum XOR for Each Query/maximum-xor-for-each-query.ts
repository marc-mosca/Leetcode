//
//  maximum-xor-for-each-query.ts
//  Leetcode
//
//  Created by Marc MOSCA on 08/11/2024.
//

function getMaximumXor(nums: number[], maximumBit: number): number[]
{
    let answer: number[] = [];
    let xor: number = 0;
    let mask: number = (2 ** maximumBit) - 1;

    for (let i: number = 0; i < nums.length; i++)
    {
        xor ^= nums[i];
    }
    nums = nums.reverse();
    for (let i: number = 0; i < nums.length; i++)
    {
        answer[i] = xor ^ mask;
        xor ^= nums[i];
    }
    return (answer);
}

