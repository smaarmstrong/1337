#!/usr/bin/env node

const fruits = ['apple', 'banana', 'cherry', 'date',  'elderberry'];

const index = 2;

// O(1) constant time
const fruit = fruits[index];

// O(n) linear time
function printLinear(n) {
    for (let i = 0; i < n; i++) {
	console.log(i);
    }
}

const linearTest = 5;
printLinear(linearTest);
