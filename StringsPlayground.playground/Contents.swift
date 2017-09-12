//: Strings Playground

import Foundation

func replaceWithEscapedSpaces(stringToEscape: String) -> String {
    var escapedString = ""
    
    for index in stringToEscape.characters.indices {
        let currentCharacter = "\(stringToEscape[index])"
        if currentCharacter == " " {
            escapedString += "%20"
        } else {
            escapedString += currentCharacter
        }
    }
    
    return escapedString
}

let str = "Hello, playground"

replaceWithEscapedSpaces(str)

let str2 = "Hello world how are you "

replaceWithEscapedSpaces(str2)

func hasAllUniqueCharacters(stringToCheck: String) -> Bool {
    var characterSet = Set<Character>()
    
    for index in stringToCheck.characters.indices {
        let character = stringToCheck[index]
        if characterSet.contains(character) {
            return false
        }
        characterSet.insert(character)
    }
    return true
}

hasAllUniqueCharacters(str)
hasAllUniqueCharacters(str2)

let str3 = "lk345jh"
hasAllUniqueCharacters(str3)

func reverseWords(stringToReverse: String) -> String {
    var reversedWordsArray = [String]()
    
    var wordBuffer = ""
    
    var reversedWordBuffer: String {
        return String(wordBuffer.characters.reverse())
    }
    
    for index in stringToReverse.characters.indices {
        let character = "\(stringToReverse[index])"
        if character == " " {
            // reverse word buffer and add to reversedString
            reversedWordsArray.append(reversedWordBuffer)
            wordBuffer = ""
        } else {
            wordBuffer += character
        }
    }
    
    if wordBuffer.characters.count > 0 {
        reversedWordsArray.append(reversedWordBuffer)
    }
    
    return reversedWordsArray.joinWithSeparator(" ")
}

reverseWords(str)
reverseWords(str2)
reverseWords(str3)

func stringsArePermutations(firstString: String, andOtherString otherString: String) -> Bool {
    
    func characterCountsForString(string: String) -> [ Character : Int ] {
        var characterDictionary = [ Character : Int ]()
        
        for index in string.characters.indices {
            let character = string[index]
            
            if let count = characterDictionary[character] {
                characterDictionary[character] = count + 1
            } else {
                characterDictionary[character] = 1
            }
        }
        return characterDictionary
    }
    
    if firstString.characters.count != otherString.characters.count {
        return false
    }
    
    return characterCountsForString(firstString) == characterCountsForString(otherString)
}

let first = "hello"
let second = "lleho"
let third = "hleho"

stringsArePermutations(first, andOtherString: second)
stringsArePermutations(second, andOtherString: first)
stringsArePermutations(first, andOtherString: third)
stringsArePermutations(first, andOtherString: str)
stringsArePermutations(str2, andOtherString: str)

func compressedString(string: String) -> String {
    
    var lastCharacter = String(string.characters.first!)
    
    func countCompression() -> Int {
        if string.isEmpty || string.characters.count == 0 {
            return 0
        }
        
        var count = 1
        var last = lastCharacter
        var size = 0
        
        for index in string.characters.indices {
            let character = String(string[index])
            if last == character {
                count++
            } else {
                size += 1 + "\(count)".characters.count
                last = character
                count = 1
            }
        }
        return size
    }
    
    if countCompression() >= string.characters.count {
        return string
    }
    
    var repeatCount = 1
    var compressed = ""
    
    var repeatCharacter: String {
        return "\(lastCharacter)\(repeatCount)"
    }
    
    for index in string.characters.indices {
        
        let character = String(string[index])
        
        if lastCharacter == character {
            repeatCount += 1
        } else {
            compressed += repeatCharacter
            lastCharacter = character
            repeatCount = 1
        }
    }
    
    compressed += repeatCharacter
    
    return compressed
}

compressedString(first)

let longString = "aaavbbbbbsdfsdsddddddsssssdf"
compressedString(longString)


func printJustified(string: String, colWidth : Int) {
    if string.characters.count < colWidth {
        print(string)
        return
    }
    
    // save words in array until overflows colWidth
    
    var currentLineArray = [String]()
    var wordCharCount = 0
    var lineCharCount = 0
    var wordCount = 0
    var wordBuffer = ""
    
    var minSpacesForCurrentLine : Int {
        return wordCount - 1
    }
    
    func printNoBreak(string: String) {
        print(string, terminator: "")
    }
    
    func printLineJustified(lineWords: [String], characterCount: Int, colWidth: Int) {
        let wordCount = lineWords.count
        if wordCount == 0 { return }
        
        func printSpaces(spaces: Int) {
            for _ in 0..<spaces {
                printNoBreak(" ")
            }
        }
        
        let spacesCount = colWidth - characterCount
        
        if wordCount == 1 {
            printNoBreak(lineWords.first!)
            printSpaces(spacesCount)
            print("")
            return
        }
        
        let minSpaceCount = spacesCount / (wordCount - 1)
        var extraSpacesCount = spacesCount - (minSpaceCount * (wordCount - 1))
        
        for i in 0..<(lineWords.count - 1) {
            printNoBreak(lineWords[i])
            printSpaces(minSpaceCount)
            
            if extraSpacesCount > 0 {
                printSpaces(1)
                extraSpacesCount--
            }
        }
        
        print(lineWords.last!)
    }
    
    for index in string.characters.indices {
        
        let character = String(string[index])
        
        if character != " " {
            wordBuffer += character
            wordCharCount++
        } else {
            // found complete word
            // check if we can add it to this line
            if wordCharCount + lineCharCount + minSpacesForCurrentLine + 1 < colWidth {
                // add to the current line
                currentLineArray.append(wordBuffer)
                lineCharCount += wordCharCount
                wordBuffer = ""
                wordCharCount = 0
                wordCount++
            } else {
                // otherwise print this line with justified spaces
                
                printLineJustified(currentLineArray, characterCount: lineCharCount, colWidth: colWidth)
                
                // then start a new line with this word
                
                currentLineArray = [wordBuffer]
                lineCharCount = wordCharCount
                wordCount = 1
                wordCharCount = 0
                wordBuffer = ""
            }
        }
    }
    
    currentLineArray.append(wordBuffer)
    lineCharCount += wordCharCount
    
    // print last word
    printLineJustified(currentLineArray, characterCount: lineCharCount, colWidth: colWidth)
}

let lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

printJustified(lorem, colWidth: 60)
print("")
printJustified(lorem, colWidth: 21)









