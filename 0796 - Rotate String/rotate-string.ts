//
//  rotate-string.ts
//  Leetcode
//
//  Created by Marc MOSCA on 03/11/2024.
//

function shift(source: string): string
{
    return source.slice(1, source.length).concat(source.charAt(0));
}

function rotateString(s: string, goal: string): boolean
{
    if (s === goal)
    {
        return (true);
    }
    for (let source: string = shift(s); source !== s; source = shift(s))
    {
        if (source === goal)
        {
            return (true);
        }
    }
    return (false);
}
