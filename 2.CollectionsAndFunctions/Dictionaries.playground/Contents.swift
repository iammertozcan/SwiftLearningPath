import UIKit

// DICTIONARIES
// - What is a Dictionary?
//      - A Dictionary is a list of key-value pairs
//      - The order of these key-value pairs is not guaranteed
//      - Each value is paired with a key
//      - We query a Dictionary for values by key (usually a String)
// - How Do We Create a Dictionary?
//      - Declare mutable Dictionaries using var
//      - Declare immutable Dictionaries using let
//      - We can explicitly type the Dictionary or use Swift's type inference
//      - Multiple syntaxes to create Dictionaries

// ===========================================================================
// Dictionaries

// The following four lines of code are essentially equivalent.

var myDictionary: Dictionary<String, String> = [:]

var mySecondDictionary = Dictionary<String, String>()

var myThirdDictionary: [String : String] = [:]

var myFourthDictionary = [String : String]()

// We can also just initialize and populate a collection at the same time...

var mercury: [String : Any] = ["Name" : "Mercury", "Order" : 1]

var venus: [String : Any] = ["Name" : "Venus", "Order" : 2]

var earth: [String : Any] = ["Name": ["Earth", "Gaea"], "Moons": ["Luna"], "Order": 3] // The type of the dictionary is inferred and the type of value is an array of String instance.

var mars: [String : Any] = ["Name" : "Mars", "Order" : 4]

// ...

var neptune: [String: Any] = ["Name": "Neptune", "Moons": ["Triton", "Proteus", "Nereid", "Larissa", "Galatea", "Despina", "Thalassa", "Naiad", "Halimede", "Nesso", "Sao", "Laomedeia", "Psamathe", "S/2004 N1"], "Order": 8]

// - Using and Modifying Dictionaries
//      - Obtain the number of key-value pairs in a Dictionary using the .count property
//      - Obtain a value in a Dictionary by key
//      - Modify the value of a given existing key using the updateValue(_:) function (gives handle to old value) or with the = operator
//      - Add a key-value pair by assigning a value to a new key
//      - Remove a key-value pair by setting the value to nil or by using the removeValueForKey(_:) function

print("We know \(mars.count) things about \(mars["Name"] as! String).")

let moonsOfNeptune = neptune["Moons"]

// Johnny and Tommy are working on their project and they just learned about the moons of Mars.

mars["Moons"] = ["Deimos", "Phobos"]

print("We know \(mars.count) things about \(mars["Name"] as! String).")

mercury["Moons"] = ["Dog", "Baseball", "Pizza"]
mercury["Moons"] = nil  // There are no moons on Mercury

let planets = [mercury, venus, mars, earth, neptune]

for planetDict in planets {
    let numberOfFacts = planetDict.count
    if let name = planetDict["Name"] as? String, let moonsArray = planetDict["Moons"] as? [String], let order = planetDict["Order"] as? Int {
        let numberOfMoons = moonsArray.count
        
        if numberOfMoons > 0 {
            let moonsList = moonsArray.joined(separator: ", ")
            var infoString: String
            
            if numberOfMoons == 1 {
                infoString = "The planet \(name) has \(numberOfMoons) moon. It is called: \(moonsList)."
            } else {
                infoString = "The planet \(name) has \(numberOfMoons) moons. They are called: \(moonsList)."
            }
            print(infoString)
        } else {
            print("The planet \(name) has \(numberOfMoons) moons.")
        }
    } else if let name = planetDict["Name"] as? String {
        print("The planet \(name) has no moons.")
    }
}

// - Properties of Dictionaries
//      - Not surprisingly, a Swift Dictionary has properties that return an array of keys and an array of values

var planetsWithMoons = [String]()

for planet in planets {
    // This works because we created these planet dictionaries with no "Moons" key-value pair, or set the value to nil, which removes the key-value pair. So planets with no moons have no key called "Moons" and contains(_:) will evaluate to false.
    if planet.keys.contains("Moons") {
        if let name = planet["Name"] as? String {
            planetsWithMoons.append(name)
        }
    }
}

print("Planets with moons: \(planetsWithMoons)")
