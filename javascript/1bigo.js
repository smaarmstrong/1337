#!/usr/bin/env node

// set up O(1) demo
const fruits = ['apple', 'banana', 'cherry', 'date',  'elderberry'];

const index = 2;

// O(1) constant time
const fruit = fruits[index];

// O(n) linear time
// one for-loop
function printLinear(n) {
    for (let i = 0; i < n; i++) {
	console.log(i);
    }
}

const linearTest = 5;
printLinear(linearTest);

// O(n^2) quadratic time
function bubbleSort(arr) {
    let n = q_arr.length;

    // the key to identifying quadratic time:
    // two nested for-loops
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n - i - 1; j++) {
            if (q_arr[j] > q_arr[j + 1]) {
                // Swap elements
                [q_arr[j], q_arr[j + 1]] = [q_arr[j + 1], q_arr[j]];
            }
        }
    }
}

const q_arr = [5, 3, 8, 4, 2];
bubbleSort(arr);
console.log("Sorted array:", arr);


// O(n^3) cubic time
function findTriplets(c_arr, targetSum) {
    let n = c_arr.length;

    // cubic: three nested for-loops
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            for (let k = j + 1; k < n; k++) {
                if (c_arr[i] + c_arr[j] + c_arr[k] === targetSum) {
                    console.log(`Triplet: ${c_arr[i]}, ${c_arr[j]}, ${c_arr[k]}`);
                }
            }
        }
    }
}

const c_arr = [1, 2, 3, 4, 5, 6];
const targetSum = 10;
findTriplets(c_arr, targetSum);

// O(log n) logarithmic time - Binary Search
function binarySearch(sortedArr, target) {
    let left = 0;
    let right = sortedArr.length - 1;

    // The key to identifying logarithmic time:
    // The problem size is halved in each step
    while (left <= right) {
        let mid = Math.floor((left + right) / 2);

        if (sortedArr[mid] === target) {
            return mid; // Target found at index mid
        } else if (sortedArr[mid] < target) {
            left = mid + 1; // Search in the right half
        } else {
            right = mid - 1; // Search in the left half
        }
    }
    return -1; // Target not found
}

const sortedArr = [1, 3, 5, 7, 9, 11];
const targetValue = 7;
const result = binarySearch(sortedArr, targetValue);
console.log("Logarithmic time (O(log n)) example - Binary search result:", result !== -1 ? `Found at index ${result}` : "Not found");

// coefficient rule
// f(n) = n
function coef_n(n) {
    var count = 0;             // Initialize count to 0
    for (var i = 0; i < n; i++) { // Loop runs 'n' times
        count += 1;             // Increment count by 1 on each iteration
    }
    return count;               // Return the final count
}

// f(n) = 5n
function coef_5n(n) {
    var count = 0;
    for (var i = 0; i < n; i++) {
        count += 5; // Increment count by 5 on each iteration
    }
    return count;
}

// f(n) = n + 1
function coef_n_plus_1(n) {
    var count = 0;
    for (var i = 0; i < n; i++) {
        count += 1; // Increment count by 1 on each iteration
    }
    return count + 1;
}

// apply the sum rule on functions to apply the coefficient rule
function pre_summed(n) {
    var count = 0;
    for (var i = 0; i < n; i++) {
        count += 1;
    }
    for (var i = 0; i < 2 * n; i++) {
        count += 1;
    }
    return count;
}
// the first for-loop is f(n) = n, 
// whereas the second is f(n) = 2n
// sum rule: f(n) = 3n
// coefficient rule: f(n) = n

// polynomial rule
// if f(n) is a polynomial of degree k,
// then f(n) is O(n^(k))
function poly(n) {
    var count = 0;
    for (var i=0; i < n * n; i++) {
        count += 1;
    }
    return count;
}

// n*n means k = 2 (2nd power)
// polynomial rule: f(n) = n^(k) 
// therefore f(n) = n^(2)