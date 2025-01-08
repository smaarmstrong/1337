func optimizedPrintSorted(_ array: [Int]) {
  guard !array.isEmpty else { return }
  
  var currentCount: Int = 0
  var minValue: Int = Int.min
  
  for value in array {
    if value == minValue {
      print(value)
      currentCount += 1
    }
  }
  
  while currentCount < array.count {
    var currentValue: Int = array.max()!
    for value in array {
      if value < currentValue, value > minValue {
        currentValue = value
      }
    }
    
    for value in array {
      if value == currentValue {
        print(value)
        currentCount += 1
      }
    }
    
    minValue = currentValue
  }
}
