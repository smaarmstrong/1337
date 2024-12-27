import Foundation

// for studying this, do anki deck first.
// then add one example with associated key words and definitions.
// add an anki card to go with it.

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
// demonstrate constant time with a function like this:
// 1. a function that takes an array of strings named 'names' for an argument
// 2. has an if-else sequence
// 2a. if constant 'first' equals the first element of names print the first element.
// 2b. else print 'no first name'
func checkFirstName(names: [String]) {
  if let first = names.first {
    print(first)
  } else {
    print("no first name")
  }
}

// keep working on the above cards before doing anything else.
