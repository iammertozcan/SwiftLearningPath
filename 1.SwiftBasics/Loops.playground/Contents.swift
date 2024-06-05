import UIKit

// LOOPS
// - A lot of computer work is repetition ;-)
// - Loops are form of control flow statements
// - Loop for all values in a range:
//     - for i in 1...5 {}
// - Loop with a increment or decrement:
//     - for i in 5..<10 {}
// - Loop as long as a condition is met
//     - while money > something {
//         spend a port or the whole thing.
//     }
//     - Repeat {} while x > 100

var str = "Hello Introduction to Swift Class"

var fib = 1
var kMinus1 = 0
var kMinus2 = 0

for i in 0...20 {
    print("i = \(i), fib = \(fib), kMinus1 = \(kMinus1), kMinus2 = \(kMinus2)")
    kMinus2 = kMinus1
    kMinus1 = fib
    fib = kMinus1 + kMinus2
}

for case let j in 0...10 where j % 3 == 0 {
    print(j)
}

// Note: C-style for loops are removed in Swift 3 and later.
// Use range-based for loops as demonstrated above.

var m = 0
while m < 100 {
    m += 25
    print(m)
}

var n = 0
repeat {
    print(n)
    n += 4
} while n < 40

// Control Transfer Statements

for k in 0...20 {
    print(k)
    if k > 10 {
        continue
    }
    print("inner condition \(k)")
}

var o = 0
while o < 20 {
    o += 1
    print(o)
    if o > 10 {
        break
    }
}
