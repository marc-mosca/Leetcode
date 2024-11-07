//
//  circular-sentence.ts
//  Leetcode
//
//  Created by Marc MOSCA on 02/11/2024.
//

function isCircularSentence(sentence: string): boolean
{
    const words: string[] = sentence.split(' ');
    const length: number = words.length - 1;

    if (words.length === 1)
    {
        return (words[0].charAt(0) === words[0].charAt(-1));
    }
    if (words[0].charAt(0) !== words[length].charAt(-1))
    {
        return (false);
    }
    for (let i: number = 0; i < length; i++)
    {
        if (words[i].charAt(-1) !== words[i + 1].charAt(0))
        {
            return (false);
        }
    }
    return (true);
}
