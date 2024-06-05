import UIKit

// ARRAYS
// - What is an Array?
//      - Arrays are an ordered list of values
//      - Each value in an Array is at a position referred to as an index, beginning with zero (index = 0)
//          - (the value at index zero is the 1st value in the array)
// - How Do We Create an Array?
//      - Declare a mutable Array using var
//      - Declare an immutable Array using let
//      - We can explicitly type an Array or use Swift's type inference
//      - There are multiple syntaxes to create an Array

// =====================================================================
// Arrays

var myArray: Array<String>      // Typed to a Swift Array that accepts instances of type String

var mySecondArray: [String]    // Typed to a Swift Array that accepts instances of type String

var romanDeitiesJohnnyFindsInteresting = ["Neptune", "Mars", "Venus", "Dionysus", "Cupid"]   // Type is inferred to be a Swift Array that accepts instances of type String

let theSolarSystem = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]    // The identities and order of the planets (arguably) will not change, so we declare this array as immutable

// Using Arrays
// - Obtain the number of items in an Array (mutable or immutable) using the .count property
// - Obtain the value at a given index in an Array by subscripting

let numberOfPlanets = theSolarSystem.count

let thirdPlanet = theSolarSystem[2]

print("Which is the 3rd planet from the Sun? Answer: \(thirdPlanet)")

// Modifying Values of Arrays
// - Add values to mutable Arrays with the append(_:) function or the += operator
// - Remove values from mutable Arrays with the remove(at:) function
// - Insert a value at a specific position in a mutable Array using the insert(_:at:) function
// - Replace a value at a given index in a mutable Array using the = operator
// - Use for-in loops to modify the values of one Array based on those of another Array

// Adding values

let newPlanet = "Pluto"

// theSolarSystem.append(newPlanet) // We cannot add planets to the solar system because it is immutable.

// The following two lines of code are equivalent...

romanDeitiesJohnnyFindsInteresting.append("Pluto")

// romanDeitiesJohnnyFindsInteresting += [newPlanet]

romanDeitiesJohnnyFindsInteresting.remove(at: 5)     // We have too many Plutos

print(romanDeitiesJohnnyFindsInteresting)

var planetsAsOf2016 = theSolarSystem

planetsAsOf2016.insert("Planet X", at: 5)

planetsAsOf2016[5] = "Juno" // We know the index of Planet X but it's not always that easy to know the index of a value, so let's get that dynamically...

// let indexOfValueToReplace = planetsAsOf2016.firstIndex(of: "Planet X")

// planetsAsOf2016[indexOfValueToReplace!] = "Juno"

print(planetsAsOf2016)

// Now let's see if any of the deities we found interesting are planets

var romanDeitiesJohnnyFindsInterestingThatAreAlsoPlanets = [String]() // Notice how we initialized this array with ()

for deity in romanDeitiesJohnnyFindsInteresting {
    if planetsAsOf2016.contains(deity) {
        romanDeitiesJohnnyFindsInterestingThatAreAlsoPlanets += [deity]
    }
}
print(romanDeitiesJohnnyFindsInterestingThatAreAlsoPlanets)

// Comparing Values of Arrays
// - Use the == operator to compare Arrays for equality
//      - Arrays are equal if their values are the same, and in the same order

var romanDeitiesTimmyFindsInteresting = ["Mars", "Neptune", "Dionysus", "Cupid", "Venus"]
var romanDeitiesTommyFindsInteresting = ["Neptune", "Mars", "Venus", "Dionysus", "Cupid"]

if romanDeitiesTimmyFindsInteresting == romanDeitiesTommyFindsInteresting {
    print("Teacher says Timmy and Tommy should work on their class project together.")
} else {
    print("Teacher says Timmy and Johnny should work on their class project together.")
}
