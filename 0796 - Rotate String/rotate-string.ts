//
//  rotate-string.ts
//  Leetcode
//
//  Created by Marc MOSCA on 03/11/2024.
//

function shift(source: string): string {
    return source.slice(1, source.length).concat(source.charAt(0));
}

function rotateString(s: string, goal: string): boolean {
    if (s === goal) {
        return true;
    }

    let source: string = shift(s);
    while (source !== s) {
        if (source === goal) {
            return true;
        }
        source = shift(source);
    }

    return false;
}
