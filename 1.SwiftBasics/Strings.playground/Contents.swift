import UIKit

// STRINGS
// - There is a lot more to strings
//      - Consists of Characters
//      - Characters are represented in Unicode
//      - U+0061 is the 'a'
//      - Unicode allows for internationalization.
//      - Possible to loop through the characters
//      - But to access a character you need to use indices


// ===========================================================
// Strings

var myString = "Hello Swift Programmers"

// Loop through each character in the string
for c in myString {
    print(c)
}

// Convert the string to uppercase
var d = myString.uppercased()
print(d)

// Unicode representation of a cool emoji 😎
let oneCoolDude = "\u{1F60E}"
print(oneCoolDude)

// Print the Unicode scalars of the string
for scalar in myString.unicodeScalars {
    print("\(scalar.value)")
}

// Count the number of characters in the string
var stringCount = myString.count
print(" '\(myString)' has \(stringCount) characters")

// Access specific characters in the string using indices
let start = myString.startIndex
print(start)
let fifth = myString.index(start, offsetBy: 4)
print(fifth)
print(myString[fifth])

// Extract a substring from the string
let swiftStart = myString.index(start, offsetBy: 6)
let swiftEnd = myString.index(swiftStart, offsetBy: 4)
let swift = myString[swiftStart...swiftEnd]
print(swift)
