import Foundation

// for studying this, do anki deck first.
// then add one code example with associated key words and definitions.

// anki card 1
// what is time complexity?
// time to run an algorithm as input size increases.

// anki card 2
// what is O(1) also known as?
// constant time.

// anki card 3
// why is it called constant time?
// constant time because it has the same running time regardless of input.

// anki card 4
// demonstrate constant time with a function
func checkFirstName(names: [String]) {
  print(names.first ?? "no first name")
}

// keep working on the above cards before doing anything else.

// anki card 5
// what is O(n) also known as?
// linear time.

// anki card 6
// why is it called linear time?
// as data increases, time to run increases by the same amount.

// anki card 7
// O(2n + 6) can be said to be 2 O(n) and 6 O(1). is it O(n) or O(1)?
// we can drop constants to make it O(n) on a high level.

// anki card 8
// demonstrate linear time with a function
func printTheNames(theNames: [String]) {
  for name in theNames {
    print(name)
  }
}

// keep working on the above cards before doing anything else.

// anki card 9
// what is O(n^2) also known as?
// quadratic time.

// anki card 10
// why is it called quadratic time?
// as input increases,
// time to run increases
// by input squared.

// anki card 11
// demonstrate quadratic time with a function and include sample output
func printQuadraticNames(names: [String]) {
  for _ in names {
    for name in names {
      print(name)
    }
  }
}

// sean
// alicia
// gemma
// sean
// alicia
// gemma
// sean
// alicia
// gemma

// anki card 12
// No matter how poorly optimized an O(n) algorithm is,
// it always performs better than an O(n^2) algorithm.
// True or False?
// True.

// keep working on the above cards before doing anything else.

// anki card 13
// what is O(log n) also known as?
// logarithmic time.

// anki card 14
// why is it called logarithmic time?
// as input increases, the time to execute the algorithm
// increases at a slow, logarithmic proportional rate.

// anki card 15
// where does O(log n) compare with other algorithms?
// O(log n) is between O(1) and O(n).

// anki card 16
// suppose a set of numbers
// let numbers = [2, 15, 60, 70, 72, 85, 100, 110, 460]
// check if number 451 exists using linear time
// and explain how the solution is linear
func naiveLinearContains(_ value: Int, in array: [Int]) -> Bool {
  for element in array { // Iterate through every element, checking if any matches the target value.
    if element == value {
      return true
    }
  }
  return false
}

// anki card 17
// suppose a set of numbers
// let numbers = [2, 15, 60, 70, 72, 85, 100, 110, 460]
// check if number 451 exists using logarithmic time
// and explain how the solution is logarithmic
func naiveLogContains(_ value: Int, in array: [Int]) -> Bool {
  var lowerBound = 0
  var upperBound = array.count - 1

  while lowerBound <= upperBound {
    let middleIndex = (lowerBound + upperBound) / 2

    if array[middleIndex] == value {
      return true
    } else if array[middleIndex] < value {
      lowerBound = middleIndex + 1
    } else {
      upperBound = middleIndex - 1
    }
  }

  return false
}

// work on the above cards before advancing further

// anki card 19
// what is O(n log n) also known as?
// quasilinear time.

// anki card 20
// why is it called quasilinear time?
// it is called quasilinear time because it is the product
// of linear and logarithmic time.

// anki card 21
// how does quasilinear time compare to linear time?
// it is worse than linear time but better than many other complexities.

// anki card 22
// what is recursion?
// it's when a function calls itself
// to solve smaller instances of the same problem.

// anki card 23
// what does the _ in recursiveSum(_ array: [Int]) -> Int do? also,
// demonstrate how functions are called with _ and without _
// it allows you to omit the external parameter name when calling a function.
// with _: recursiveSum([1, 2, 3])
// without _: recursiveSum(array: [1, 2, 3])

// anki card 24
// what does the -> in recursiveSum(_ array: [Int]) -> Int do?
// it specifies the data type of the value being returned.

// anki card 25
// what is the term for a no value data type returned in a function?
// void data type.

// anki card 26
// demonstrate a quasilinear function through recursive power-of-two summation.
// also, mark O(1) 3 times, O(n) 2 times, and O(log n) where they appear.
// 1. If the array has 1 or no elements, return its sum directly
// 2. Divide the array into two halves
// 3. Recursively sum the left and right halves
// 4. Combine the results
func recursiveSum(_ array: [Int]) -> Int {
  // 1
  guard array.count > 1 else { return array.first ?? 0 } // O(1)

  // 2
  let middleIndex = array.count / 2 // O(1)

  let leftArray = Array(array[..<middleIndex]) // O(n)
  let rightArray = Array(array[middleIndex...]) // O(n)

  // 3
  let leftSum = recursiveSum(leftArray) // O(log n)
  let rightSum = recursiveSum(rightArray) // O(log n)

  // 4
  return leftSum + rightSum // O(1)
}

// anki card 27
// What is space complexity?
// Space complexity measures the memory needed to run an algorithm.

// anki card 28
// Write a function with space complexity of O(n).
func printSorted(_ array: [Int]) {
  let sorted = array.sorted()
  for element in sorted {
    print(element)
  }
}

// anki card 29
// What does the reserved key word guard signify?
// guard lets you do early exits from functions and loops
// if conditions aren't met.

// anki card 30
// Given this function:

// func printSorted(_ array: [Int]) {
//  let sorted = array.sorted()
//  for element in sorted {
//    print(element)
//  }
// }

// How can we optimize the space complexity from O(n) to O(1)? Demonstrate an example below.

// 1. Check for the case if the array is empty. If it is, there’s nothing to print.
//
// 2. currentCount keeps track of the number of print statements made. minValue stores the last printed value.
//
// 3. The algorithm begins by printing out all values matching the minValue, and updates the currentCount according to the number of print statements made.
//
// 4. Using the while loop, the algorithm finds the lowest value bigger than minValue and stores it in currentValue.
//
// 5. The algorithm then prints all values of currentValue inside the array while updating currentCount.
//
// 6. minValue is set to currentValue so the next iteration will try to find the next minimum value.

func optimizedPrintSorted(_ array: [Int]) {
  // 1
  guard !array.isEmpty else { return }

  // 2
  var currentCount = 0
  var minValue = Int.min

  // 3
  for value in array {
    if value == minValue {
      print(value)
      currentCount += 1
    }
  }

  // 4
  while currentCount < array.count {
    var currentValue = array.max()!
    for value in array {
      if value < currentValue, value > minValue {
        currentValue = value
      }
    }

    // 5
    for value in array {
      if value == currentValue {
        print(value)
        currentCount += 1
      }
    }

    // 6
    minValue = currentValue
  }
}

// work on the above cards before advancing further
