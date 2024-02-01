func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var apparenceDictionary = [Character: Int]()
    
    for i in 0..<ransomNote.count {
        let character = ransomNote[ransomNote.index(ransomNote.startIndex, offsetBy: i)]
        apparenceDictionary[character] = (apparenceDictionary[character] ?? 0 ) + 1
        print("entro con chard: \(character) ---- \(apparenceDictionary) ")
    }
    
    for i in 0..<magazine.count {
        let character = magazine[magazine.index(magazine.startIndex, offsetBy: i)]
        if let countInNote = apparenceDictionary[character], countInNote - 1 > 0 {
            apparenceDictionary[character] = countInNote - 1
        }
        print("entro con chard: \(character) ---- \(apparenceDictionary) ")
    }
    
    for count in apparenceDictionary.values {
        if count > 0 {
            return false
        }
    }
    
    return true
}

canConstruct("aa", "aab")



class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var apparenceDictionary = [Character: Int]()

        for i in 0..<ransomNote.count {
            let character = ransomNote[ransomNote.index(ransomNote.startIndex, offsetBy: i)]
            apparenceDictionary[character] = (apparenceDictionary[character] ?? 0 ) + 1
        }

        for i in 0..<magazine.count {
            let character = magazine[magazine.index(magazine.startIndex, offsetBy: i)]
            if let countInNote = apparenceDictionary[character], countInNote - 1 > 0 {
                apparenceDictionary[character] = countInNote - 1
            } else {
                apparenceDictionary[character] = nil
            }

            if apparenceDictionary.values.isEmpty { return true }
        }

        for count in apparenceDictionary.values {
            if count > 0 {
                return false
            }
        }

        return true
    }
}
