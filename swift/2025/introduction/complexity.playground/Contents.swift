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
  guard !array.isEmpty else { return false }
  let middleIndex = array.count / 2
  if value <= array[middleIndex] { // Narrow search to the left half if the value is less than or equal to the middle.
    for index in 0 ... middleIndex {
      if array[index] == value {
        return true
      }
    }
  } else { // Otherwise, narrow search to the right half.
    for index in middleIndex ..< array.count {
      if array[index] == value {
        return true
      }
    }
  }
  return false
}

// work on the above cards before advancing further
