#!/usr/bin/env node

// https://www.cs.usfca.edu/~galles/visualization/Search.html

// O(log n) logarithmic time - Binary Search with visualization
function binarySearchWithVisualization(sortedArr, target) {
    let left = 0;
    let right = sortedArr.length - 1;
    let step = 0;

    console.log(`\nSearching for ${target} in ${JSON.stringify(sortedArr)}:`);

    while (left <= right) {
        step++;
        let mid = Math.floor((left + right) / 2);

        // Visualization of current search range
        console.log(`Step ${step}:`);
        console.log(`  Left index: ${left}, Value: ${sortedArr[left]}`);
        console.log(`  Middle index: ${mid}, Value: ${sortedArr[mid]}`);
        console.log(`  Right index: ${right}, Value: ${sortedArr[right]}\n`);

        if (sortedArr[mid] === target) {
            console.log(`Target ${target} found at index ${mid}\n`);
            return mid; // Target found at index mid
        } else if (sortedArr[mid] < target) {
            left = mid + 1; // Search in the right half
        } else {
            right = mid - 1; // Search in the left half
        }
    }
    console.log(`Target ${target} not found\n`);
    return -1; // Target not found
}

const sortedArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

// Demo 1: Target is at the beginning
console.log("Target is at the beginning.")
binarySearchWithVisualization(sortedArr, 1);

// Demo 2: Target is somewhere in the middle
console.log("Target is somewhere in the middle.")
binarySearchWithVisualization(sortedArr, 6);

// Demo 3: Target is at the end
console.log("Target is at the end.")
binarySearchWithVisualization(sortedArr, 11);

// Demo 4: Target is not in the array
console.log("Target is not in the array.")
binarySearchWithVisualization(sortedArr, 15);