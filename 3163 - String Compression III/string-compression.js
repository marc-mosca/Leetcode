//
//  string-compression.js
//  Leetcode
//
//  Created by Marc MOSCA on 04/11/2024.
//

/**
 * @param {string} word
 * @return {string}
 */
const compressedString = function (word) {
    let comp = "";
    let counter = 1;

    for (let i = 0; i < word.length; i++) {
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
};
