//
//  circular-sentence.js
//  Leetcode
//
//  Created by Marc MOSCA on 02/11/2024.
//

/**
 * @param {string} sentence
 * @return {boolean}
 */
const isCircularSentence = function (sentence) {
    const words = sentence.split(' ');
    const wordsLength = words.length

    if (words[0].charAt(0) !== words[wordsLength - 1].charAt(words[wordsLength - 1].length - 1)) {
        return false;
    }

    if (wordsLength === 1) {
        return words[0].charAt(words[0].length - 1) === words[wordsLength - 1].charAt(words[wordsLength - 1].length - 1);
    }

    for (let i = 0; i < words.length - 1; i++) {
        if (words[i + 1].charAt(0) !== words[i].charAt(words[i].length - 1)) {
            return false;
        }
    }
    return true;
};
