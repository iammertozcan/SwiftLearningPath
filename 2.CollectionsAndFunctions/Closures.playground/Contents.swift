import UIKit

// CLOSURES
// - What is a Closure?
//      - A Closure is a block of code that serves a purpose - much like Functions
//      - In fact, a Function is essentially a closure with a name.
//      - Parameter types and return types are declared the same way as for functions.
//      - Closures are reference types, so they can be passed around as an object.
// - Using Closures
//      - Some methods, like Array's sort(_:) method, take a Closure as an argument.
//      - Closures can be the right-hand side of an expression and thus stored in a variable.
// - Closures as a Callback
//      - Closures can be used as a callback mechanism.
//          - We call a Function and provide a Closure as an argument. Then the called function calls its caller's closure after it is finished doing its work.
//          - Especially helpful when performing asynchronous functions (e.g. calling a web service and waiting for a return value).

var mercury: [String: Any?] = ["Name": "Mercury", "Order": 1]
var venus: [String: Any?] = ["Name": "Venus", "Order": 2]
var earth: [String: Any?] = ["Name": "Gaea", "Moons": ["Luna"], "Order": 3]
var mars: [String: Any?] = ["Name": "Mars", "Order": 4]
var neptune: [String: Any?] = [
    "Name": "Neptune",
    "Moons": ["Triton", "Proteus", "Nereid", "Larissa", "Galatea", "Despina", "Thalassa", "Naiad", "Halimede", "Nesso", "Sao", "Laomedeia", "Psamathe", "S/2004 N1"],
    "Order": 8
]

let moonsOfNeptune = neptune["Moons"]
let planets = [mercury, venus, earth, mars, neptune]

func alphabetize(str1: String, str2: String) -> Bool {
    return str1.compare(str2) == .orderedAscending
}

if let moonsOfNeptuneArray = moonsOfNeptune as? [String] {
    // Sort moons alphabetically
    let alphabeticallySortedMoons = moonsOfNeptuneArray.sorted(by: alphabetize)
    print(alphabeticallySortedMoons)
    
    // We could also have written alphabetize as an expression...
    
    let alphabetically: (String, String) -> Bool = { (str1: String, str2: String) -> Bool in
        return str1.compare(str2) == .orderedAscending
    }
    
    let sortedMoons = moonsOfNeptuneArray.sorted(by: alphabetically)
    print(sortedMoons)
}

// listOfPlanets stores a Closure that does not take any arguments but does have a return type
let listOfPlanets = { () -> [String] in
    var planetNames = [String]()
    // This closure is able to trap the variable planets from its enclosing scope (the whole playground)
    // This is similar to how member variables are trapped by functions in a Class.
    for planet in planets {
        if let name = planet["Name"] as? String {
            planetNames.append(name)
        }
    }
    return planetNames
}

// Notice how we call the closure stored inside of listOfPlanets with the parentheses ().
let sortedPlanets = listOfPlanets().sorted(by: alphabetize)
print(sortedPlanets)

// We could alternatively write the alphabetic sort closure using the trailing closure style.
// This has the advantage that the way sorting is processed is easily visible, but this way, we do not have a variable name by which to pass this closure around.

let sortedPlanets_easilyVisible = listOfPlanets().sorted { (str1: String, str2: String) -> Bool in
    return str1.compare(str2) == .orderedAscending
}

print(sortedPlanets_easilyVisible)
