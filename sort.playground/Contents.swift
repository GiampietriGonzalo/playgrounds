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

// Merge Sort

func mergeSort(numbers: [Int]) -> [Int] {
    let n = numbers.count
    // print("---------------------------------------------")
    // print("MergeSort con: \(numbers)")
    
    guard n > 2 else {
        if n == 2 {
            if numbers[0] > numbers[1] {
                // print("result of: \(numbers) es \([numbers[1], numbers[0]])")
                return [numbers[1], numbers[0]]
            } else {
                // print("result of: \(numbers) es \(numbers)")
                return numbers
            }
        } else {
            // print("result of: \(numbers) es \(numbers)")
            return numbers
        }
    }
    
    let left = Array(numbers[0...n/2-1])
    let right = Array(numbers[(n/2)...n-1])
    // print("left: \(left)")
    // print("right: \(right)")
    let sortedLeft = mergeSort(numbers: left)
    let sortedRight = mergeSort(numbers: right)
    let sorted = merge(a: sortedLeft, b: sortedRight)
    // print("result of: \(numbers) es:  \(sorted)")
    return sorted
}

func merge(a: [Int], b: [Int]) -> [Int] {
    var longestArray: [Int]
    var shorterArray: [Int]
    var mergeResult = [Int]()

    if a.isEmpty { return b }
    if b.isEmpty { return a }
    
    if a.count >= b.count {
        longestArray = a
        shorterArray = b
    } else {
        longestArray = b
        shorterArray = a
    }


    if longestArray.count == 1 {
        //shorterArray has one element too
        if longestArray[0] > shorterArray[0] {
            return [shorterArray[0], longestArray[0]]
        } else {
            return [longestArray[0], shorterArray[0]]
        }
    }
    
    var i = 0
    var j = 0
    var next = 0
    let shouldContinue = true
    
    while i < longestArray.count && shouldContinue {
        j = next

        if j == shorterArray.count {
            break
        } else {
            while j < shorterArray.count {
                if longestArray[i] > shorterArray[j] {
                    mergeResult.append(contentsOf: [shorterArray[j]])
                    j += 1
                    next = j
                } else {
                    mergeResult.append(contentsOf: [longestArray[i]])
                    j = shorterArray.count
                }
            }
        }
        
        i+=1
    }

    if next == shorterArray.count {
        // let k = longestArray.count == shorterArray.count ? next-1 : next
        mergeResult.append(contentsOf: longestArray[i-1...longestArray.count-1])
    } else {
        mergeResult.append(contentsOf: shorterArray[next...shorterArray.count-1])
    }
    
    return mergeResult
}

print("result: \(mergeSort(numbers: [1,7,9,2,5,8]))")
print("result: \(mergeSort(numbers: [1,9,7]))")
print("result: \(mergeSort(numbers: [9,7,6]))")
print("result: \(mergeSort(numbers: [10,9,8,7,6,5,4]))")
print("result: \(mergeSort(numbers: [10,9,8,7,6,5,4,2]))")
