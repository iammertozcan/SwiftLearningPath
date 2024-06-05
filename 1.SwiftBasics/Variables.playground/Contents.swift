import UIKit

// TYPES, CONSTANTS, VARIABLES
// - Data Types
//      - Variables and constants have a data type
//      - Compiler knows how much memory to allocate and helps with type checking
//      - Type safety provides errors at compile time
//      - Explicit:     var age: Int32 = 16
//      - Inferred:     var strName = "Peter"
//      - Error:        age = strName   ERROR
// - Variables vs. Constants
//      - Variables change in value, constants don't
//      - Using constants improves code clarity
//      - let daysInWeek: Int = 7
//      - Good usage of constants also generate errors at compile time
//      - daysInWeek = 5   // ERROR

/*
 This is a comment
 across multiple lines
 */

// You can also use Command-/ to comment out a section of code

// ===========================================================
// Types, Constants, and Variables

// weather is a variable of type String. The type is inferred
var weather = "The weather in California is good"

// temperature is a variable explicitly declared as String
var temperature: String = "In the US we measure temperatures in Fahrenheit"

var temp = "thirty two"   // string
var temp2: String = "32"  // still a string
var temp3 = 32            // now it's an integer
var temp4: Int = 100      // explicit integer

// String concatenation
var calc = temp + temp2   // "thirty two32"

// var calc2 = temp2 + temp3    // ERROR: Cannot add string and integer

var calc3 = 10 + temp3    // 42
var calc4 = temp3 + temp4 // 132

// Constants
let meltingPoint = 32
let steamPoint: Int = 212

// steamPoint = steamPoint + 2  // ERROR: Cannot assign to let constant

// Strings can easily be concatenated
var name = "My name is "
name += "Mert. "

var job: String = "I teach at UCI and work at SmileFish"

print(name + job)  // My name is Mert. I teach at UCI and work at SmileFish

// String Interpolation
let sentence = "The melting point of ice is \(meltingPoint) and the water turns to steam at \(steamPoint)."
print(sentence)  // The melting point of ice is 32 and the water turns to steam at 212.

// NUMBERS
// - Integers
//      - Integers are numbers that don't have a decimal point. No fractions. Whole numbers.
//      - Computers store data in bits and bytes.
//      - Integers are stored as Int8, Int16, Int32, Int64
//          - print(Int64.max) is 2^63 - 1 = 9223372036854775807
//          - var i: Int32 = 92233720336854775807       // ERROR: Value is too large for Int32
//      - Operators: = , + , - , / , ++ , --, += , -= , %
//      - Careful with division
//          - 11 / 3 = 3 (with 3.666667 you might expect 4)

// - Floating Point and Double
//      - Computers store them in mantissa and exponent.
//          - Like regular math. 1.23456 * 10^5
//          - But computers use 2 as base instead of 10
//      - Swift uses Float (32-bit) and Double (64-bit)
//      - Many mathematical numbers cannot be stored accurately in this format.
//          - 1.2 is stored as 1.2000000000001
//          - Tricky with == operator.

// Integer Variables
print(Int.max)     // 9223372036854775807
print(Int32.max)   // 2147483647
print(Int32.min)   // -2147483648
print(Int64.max)   // 9223372036854775807

let a: Int16 = 10
let b: Int32 = 20

let c = Int(b) + Int(a)  // 30

let div = 11 / 3         // 3 (integer division)

// Floating Point Variable
let d: Double = 1.1
let f: Float = 1.1

// Doubles have 64-bit and floats have 32-bit precision
print(2 / d)  // 1.8181818181818181
print(2 / f)  // 1.8181818

let dd = 1.1  // Note implicit declaration creates a Double

print(2 / dd) // 1.8181818181818181

// print(d==f)          // ERROR: Cannot compare Double and Float directly
print(d == Double(f))  // true

print(12.4 / 5)  // 2.48
// print(12.4 % 5)  // ERROR: '%' is unavailable: For floating point numbers use truncatingRemainder instead
print(12.4.truncatingRemainder(dividingBy: 5))  // 2.4000000000000004

// Some tricks with integer numbers -- be careful
print(11 / 3)   // 3 (integer division, truncates the decimal part)
print(11.0 / 3.0) // 3.6666666666666665

let division: Double = round(Double(11) / 3)
print(division)  // 4.0
