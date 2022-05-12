import UIKit

func validateBracket(_ bracket: String) -> String {
    // declare variable "validity" and "arrayOfBracket" which is an array of all strings given as parameter - bracket
    var validity = "invalid"
    var arrayOfBracket = Array(bracket)
    
    // declare tuples of all bracket types - open and close
    let roundBracketTuple = ("(", ")")
    let squareBracketTuple = ("[", "]")
    let curlyBracketTuple = ("{", "}")
    
    // return invalid when it is a single character of string given cos a complete bracket has to be in pairs
    if bracket.count == 1 {
        return "invalid"
    }
    
    // a function to check if count in between 2 complete bracket is even or odd
    func countOfStringInbetweenIsOdd( _ tup: (String, String)) -> Bool {
        var validity1 = false
        for (index,str) in arrayOfBracket.enumerated() {
            if str == Character(tup.0) {
                if let theIndex = arrayOfBracket.firstIndex(of: Character(tup.1)) {
                    let count = (theIndex - index) - 1
                    if count % 2 == 1 {
                        validity1 = true
                    }
                }
            }
        }
        return validity1
    }
    
    // a function to check and remove all complete sets of bracket
    func checkAndRemoveAllCompleteSetOfBracketIn(_ tup: (String, String) ) {
        if arrayOfBracket.contains(Character(tup.0)) && arrayOfBracket.contains(Character(tup.1)){
            if let theIndex = arrayOfBracket.firstIndex(of: Character(tup.0)) {
                arrayOfBracket.remove(at: theIndex)
            }
            if let oppIndex = arrayOfBracket.firstIndex(of: Character(tup.1)) {
                arrayOfBracket.remove(at: oppIndex)
            }
        }
    }
    
    // If we have an odd number in between a complete set of bracket, return invalid, cos then, chain of bracket would have been broken
    if countOfStringInbetweenIsOdd(roundBracketTuple) || countOfStringInbetweenIsOdd(curlyBracketTuple) || countOfStringInbetweenIsOdd(squareBracketTuple) {
        return "invalid"
    }
    
    // check and remove all complete sets of bracket in our "arrayOfBracket"
    checkAndRemoveAllCompleteSetOfBracketIn(roundBracketTuple)
    checkAndRemoveAllCompleteSetOfBracketIn(squareBracketTuple)
    checkAndRemoveAllCompleteSetOfBracketIn(curlyBracketTuple)
    
    // after checking, count what's left in the arrayOfBracket
    // would be empty if they contain complete set of bracket
    // and if empty, it means it is valid
    if arrayOfBracket.isEmpty {
        validity = "valid"
    }
    
    return validity
}

validateBracket("[]")
validateBracket("[()]")
validateBracket("[](){}")
validateBracket("[)")
validateBracket("()")
validateBracket("{}")
validateBracket("([)]")
validateBracket("{")
