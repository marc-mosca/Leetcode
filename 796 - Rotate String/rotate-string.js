//
//  rotate-string.js
//  Leetcode
//
//  Created by Marc MOSCA on 03/11/2024.
//

/**
 * @param {string} source
 * @return {string}
 */
function shift(source) {
    const char = source.at(0)
    let part = source.slice(1, source.length);
    return part.concat(char)
}

/**
 * @param {string} s
 * @param {string} goal
 * @return {boolean}
 */
const rotateString = function (s, goal) {
    // Check if the string is equal to goal by default.
    if (s === goal) {
        return true;
    }

    // Check every shift possibility to be equal to goal.
    let source = shift(s);
    while (source !== s) {
        if (source === goal) {
            return true;
        }
        source = shift(source);
    }
    return false;
};
