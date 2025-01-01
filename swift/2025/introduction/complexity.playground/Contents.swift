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
// as data increases,
// time to run increase proportionally
// to squares of the input size.


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
