//
//  minimum-changes.ts
//  Leetcode
//
//  Created by Marc MOSCA on 05/11/2024.
//

function minChanges(s: string): number {
    let counter: number = 0;

    for (let i: number = 0; i < s.length; i += 2) {
        if (s[i] !== s[i + 1]) {
            counter++;
        }
    }

    return counter;
}
