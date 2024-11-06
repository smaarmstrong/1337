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
