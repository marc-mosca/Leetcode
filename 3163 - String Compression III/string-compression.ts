//
//  string-compression.js
//  Leetcode
//
//  Created by Marc MOSCA on 04/11/2024.
//

function compressedString(word: string): string {
    let comp: string = "";
    let counter: number = 1;

    for (let i: number = 0; i < word.length; i++) {
        if (counter < 9 && word[i] === word[i + 1]) {
            counter += 1;
        }
        else {
            comp += String(counter)
            comp += word[i]
            counter = 1;
        }
    }

    return comp;
}
