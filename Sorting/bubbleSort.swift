// Bubble Sort

func bubbleSort(numbers: [Int]) -> [Int] {
    var sorted = numbers
    
    for i in 0..<numbers.count {
        for j in 0..<(numbers.count - (i + 1)) {
            let leftNumber = sorted[j]
            let rightNumber = sorted[j+1]
            if leftNumber > rightNumber {
                sorted[j] = rightNumber
                sorted[j+1] = leftNumber
            }
        }
    }
    
    return sorted
}

bubbleSort(numbers: [6,2,4,1,7,3])
bubbleSort(numbers: [])
bubbleSort(numbers: [1,2,3,4,5,6])
bubbleSort(numbers: [6,5,4,3,2,1])