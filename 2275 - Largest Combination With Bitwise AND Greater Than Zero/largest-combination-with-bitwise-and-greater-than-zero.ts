//
//  largest-combination-with-bitwise-and-greater-than-zero.ts
//  Leetcode
//
//  Created by Marc MOSCA on 07/11/2024.
//

const MAXIMUM_BITS: number = 32;

function largestCombination(candidates: number[]): number
{
    let result: number = 0;
    let count: number = 0;

    for (let i: number = 0; i < MAXIMUM_BITS; i++)
    {
        count = 0;

        for (let j: number = 0; j < candidates.length; j++)
        {
            if ((1 << i) & candidates[j])
            {
                count += 1;
            }
            result = Math.max(result, count);
        }
    }
    return (result);
}
