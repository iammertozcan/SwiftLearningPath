import UIKit

// CONTROL FLOW
// - if - then - else
//      - Programming is all about controlling the CPU's execution flow while processing data
//      - Operators: < , <= , > , >= , == , != , === , !==
//      - Result is a Boolean , which is either true or false
//          - var b: Bool = 5 < 6
//      - Boolean expressions: && (AND), || (OR), ! (NOT)
// - Ternary Operator
//      - a ? b : c (if a true then do b else do c)



// ==========================================================
// Control Flow - Conditionals

let temperature = 60
var message: String

// Nested if's
if temperature >= 212 {
    message = "water at \(temperature) is steam"
} else {
    message = "water at \(temperature) is liquid or frozen"
}

// Nested if's
if temperature >= 212 {
    message = "water at \(temperature) is steam"
} else {
    if temperature <= 32 {
        message = "water at \(temperature) is frozen"
    } else {
        message = "water at \(temperature) is liquid"
    }
}

// Else if
if temperature >= 212 {
    message = "water at \(temperature) is steam"
} else if temperature <= 32 {
    message = "water at \(temperature) is frozen"
} else {
    message = "water at \(temperature) is liquid"
}

print(message)

let b = 6 == 7
let c = (6 != 7) && (3 > 4)

// Note an old = vs == trap can't happen here

var temperature2 = 100

if temperature2 == 50 {
    print(temperature2)
}

// Ternary Operator a ? b : c
message = temperature >= 212 ? "water is steam" : "water is frozen or liquid"

// Switch
// - Similar to if/else but instead of boolean condition it matches "cases" of an integer variable
//      switch (value) {
//          case someValue:
//              // Do something
//          case someOtherValue:
//              // Do something else
//          default:
//              // Handle all the other cases
//      }

// Case Statement

let day: Int = 60

switch day {
case 1:
    print("Monday")
case 2:
    print("Tuesday")
case 3:
    print("Wednesday")
case 4:
    print("Thursday")
case 5:
    print("Friday")
case 6:
    print("Saturday")
case 7:
    print("Sunday")
default:
    print("Not really a day")
}

switch day {
case 1:
    print("Monday")
case 2:
    print("Tuesday")
case 3:
    print("Wednesday")
case 4:
    print("Thursday")
case 5:
    print("Friday")
case 6, 7:
    print("Weekend")
default:
    print("Not really a day")
}

switch day {
case 1...5:
    print("Weekday")
case 6, 7:
    print("Weekend")
default:
    print("Not really a day")
}

switch day {
case 1...5:
    print("Weekday")
case 6, 7:
    print("Weekend")
case let unknown:
    print("Unknown day \(unknown)")
default:
    print("Not really a day")
}

switch day {
case 1...5:
    print("Weekday")
case 6, 7:
    print("Weekend")
case let unknown:
    print("Unknown day \(unknown)")
    if day > 100 {
        print("really huge")
    } else {
        print("at least not bigger than 100")
    }
default:
    print("Not really a day")
}

// Tuples and Pattern Matching

let dayNumber = 4

var dayTuple: (Int, String)

switch dayNumber {
case 1:
    dayTuple = (dayNumber, "Monday")
case 2:
    dayTuple = (dayNumber, "Tuesday")
case 3:
    dayTuple = (dayNumber, "Wednesday")
case 4:
    dayTuple = (dayNumber, "Thursday")
case 5:
    dayTuple = (dayNumber, "Friday")
case 6:
    dayTuple = (dayNumber, "Saturday")
case 7:
    dayTuple = (dayNumber, "Sunday")
default:
    dayTuple = (dayNumber, "Not really a day of the week")
}

dayTuple = (4, "Thursday")

switch dayTuple {
case (1...5, _):
    print("Weekday")
case (_, "Saturday"), (_, "Sunday"):
    print("Weekend")
default:
    print("unknown day and really big")
}

// Access an element of tuple
print(dayTuple.0)
print(dayTuple.1)
