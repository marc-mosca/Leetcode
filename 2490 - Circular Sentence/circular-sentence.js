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

    // Check if the first letter of the sentence is equal to the last letter.
    if (words[0].at(0) !== words[words.length - 1].at(-1)) {
        return false;
    }

    // If the sentence contains only one word, check if the first letter of the word is equal to the last letter.
    if (words.length === 1) {
        return words[0].at(-1) === words[words.length - 1].at(-1);
    }

    // Check for every word in the sentence.
    for (let i = 0; i < words.length - 1; i++) {
        if (words[i].at(-1) !== words[i + 1].at(0)) {
            return false;
        }
    }

    return true;
};
