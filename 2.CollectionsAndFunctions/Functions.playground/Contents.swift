import UIKit

// FUNCTIONS
// - What is a Function?
//      - Functions are named blocks of code that perform a purpose
//      - The name of well-named functions describes this purpose
//      - Some (but not all) functions require input data in order to perform this purpose
//      - A function may produce ("return") a value
//      - In order to perform the function, a caller must invoke ("call") the function

var mercury: [String : Any?] = ["Name" : "Mercury", "Order" : 1]
var venus: [String : Any?] = ["Name" : "Venus", "Order" : 2]
var earth: [String : Any?] = ["Name" : "Gaea", "Moons" : ["Luna"], "Order" : 3]
var mars: [String : Any?] = ["Name" : "Mars", "Order" : 4]
var neptune: [String : Any?] = [
    "Name" : "Neptune",
    "Moons" : ["Triton", "Proteus", "Nereid", "Larissa", "Galatea", "Despina", "Thalassa", "Naiad", "Halimede", "Nesso", "Sao", "Laomedeia", "Psamathe", "S/2004 N1"],
    "Order" : 8
]

let moonsOfNeptune = neptune["Moons"]

// Functions
// - The func keyword declares that we are writing a Function.
// - The parentheses enclose any function arguments (even if there are no arguments)
// - The curly braces enclose the body of the function.

func showMoonsOfNeptune() {
    if let moons = moonsOfNeptune as? [String] {
        print("The moons of Neptune are: \(moons.joined(separator: ", "))")
    } else {
        print("Neptune has no moons.")
    }
}

// In order for the function to be executed, we must invoke ("call") the function.
// IMPORTANT: remember to include the parentheses () when invoking a function even if it takes no arguments!

showMoonsOfNeptune()

// - Function with Parameters
//      - Often Functions require information to perform their task
//      - These inputs are referred to as parameters or arguments of the Functions
//      - Notice the syntax of our argument declaration inside the parentheses.
//      - There is one argument named planet and it is of type Dictionary<String, Any?>
//      - The name of the arguments is lowercase and followed by a colon (:)
//      - The colon (:) is followed by the name of that argument.

func showMoonsOf(planet: [String : Any?]) {
    if let name = planet["Name"] as? String {
        if let moonsArray = planet["Moons"] as? [String] {
            let numberOfMoons = moonsArray.count
            
            if numberOfMoons > 0 {
                let moonsList = moonsArray.enumerated().map { (index, moon) in
                    if index == moonsArray.count - 1 && moonsArray.count > 1 {
                        return "and \(moon)"
                    } else {
                        return moon
                    }
                }.joined(separator: ", ")
                
                let infoString = numberOfMoons == 1 ? "The only moon of planet \(name) is called: \(moonsList)." : "The moons of planet \(name) are called: \(moonsList)."
                print(infoString)
            } else {
                print("The planet \(name) has no moons.")
            }
        } else {
            print("No information available for the names of the moons of planet \(name).")
        }
    }
}

showMoonsOf(planet: neptune)
showMoonsOf(planet: earth)

func showInfo(p: [String : Any?], showsNumberOfMoons: Bool, showsMoonNames: Bool) {
    print("\n") // We just print a line break every time for the function called to make the output easier to read.
    
    let planetName = p["Name"] as? String
    
    if showsNumberOfMoons {
        if let moonsArray = p["Moons"] as? [AnyObject] {
            let numberOfMoons = moonsArray.count
            
            if numberOfMoons > 0 {
                let moonsString = numberOfMoons > 1 ? "moons" : "moon"
                print("The planet \(planetName ?? "unknown") has \(numberOfMoons) \(moonsString).")
            }
        }
    }
    
    if showsMoonNames {
        showMoonsOf(planet: p) // Notice how we can pass the value of this function's argument into the argument of another function.
    }
}

showInfo(p: mars, showsNumberOfMoons: true, showsMoonNames: true)
showInfo(p: earth, showsNumberOfMoons: false, showsMoonNames: true)

func showInfoOfPlanet(planet p: [String : Any?], showsNumberOfMoons: Bool, showsMoonNames: Bool) {
    print("\n-showInfoOfPlanet():")
    
    let planetName = p["Name"] as? String
    print("Here's the information you asked for about the planet \(planetName ?? "unknown"):")
    
    if showsNumberOfMoons {
        if let numberOfMoons = numberOfMoons(ofPlanet: p) {
            let moonsString = numberOfMoons > 1 ? "moons" : "moon"
            print("The planet \(planetName ?? "unknown") has \(numberOfMoons) \(moonsString).")
        } else {
            print("No information available for the number of moons of planet \(planetName ?? "unknown").")
        }
    }
    if showsMoonNames {
        showMoonsOf(planet: p)
    }
}

showInfoOfPlanet(planet: venus, showsNumberOfMoons: true, showsMoonNames: true)

// We can set some default values for our function so that it has a default behavior if the caller does not specify how much information should be shown.
// Use the assignment operator (=) in the argument declaration to set a default value.
func showDefaultInfoOfPlanet(planet p: [String : Any?], showsNumberOfMoons: Bool = true, showsMoonNames: Bool = true) {
    print("\n-showDefaultInfoOfPlanet():")
    
    let planetName = p["Name"] as? String
    print("Here's the information you asked for about the planet \(planetName ?? "unknown"):")
    
    if showsNumberOfMoons {
        if let numberOfMoons = numberOfMoons(ofPlanet: p) {
            let moonsString = numberOfMoons > 1 ? "moons" : "moon"
            print("The planet \(planetName ?? "unknown") has \(numberOfMoons) \(moonsString).")
        } else {
            print("No information available for the number of moons of planet \(planetName ?? "unknown").")
        }
    }
    if showsMoonNames {
        showMoonsOf(planet: p)
    }
}

// Notice how we can call the function omitting arguments with default values.
showDefaultInfoOfPlanet(planet: mars)
showDefaultInfoOfPlanet(planet: mars, showsNumberOfMoons: false)
showDefaultInfoOfPlanet(planet: mars, showsNumberOfMoons: true, showsMoonNames: false)
showDefaultInfoOfPlanet(planet: mars, showsMoonNames: false)

// Functions That Return a Value (or Values)
// - A function may return a value in order to...
//      - To tell whether or not it was successful in performing its task
//      - Or that may be the sole purpose of the function

// It's wasteful and in fact dangerous to constantly calculate the numberOfMoons over and over. To avoid bugs caused by updating this code in one function, but not in another, let's refactor so that only one function performs that calculation. Then we call that function when we need the count.
// SYNTAX: This function will return a value to its caller. Functions with return types are declared with an arrow (->) followed by the type of the return value.
// Note: Our return value is an Optional Int (Int?) because the planet dictionary may not contain a value for the key "Moons". If this is the case, we should return nil to let the caller know that information is unavailable.

func numberOfMoons(ofPlanet p: [String : Any?]) -> Int? {
    if let moonsArray = p["Moons"] as? [AnyObject] {
        return moonsArray.count
    }
    return nil
}

// Now we can refactor our existing functions to use this Function to determine the numbers of moons (if any) by passing in their planet.

func showDefaultInfoOfPlanet_Refactored(planet p: [String : Any?], showsNumberOfMoons: Bool = true, showsMoonNames: Bool = true) {
    print("\n-showInfoOfPlanet_Refactored():")
    
    let planetName = p["Name"] as? String
    print("Here's the information you asked for about the planet \(planetName ?? "unknown"):")
    
    if showsNumberOfMoons {
        if let numberOfMoons = numberOfMoons(ofPlanet: p) {
            let moonsString = numberOfMoons > 1 ? "moons" : "moon"
            print("The planet \(planetName ?? "unknown") has \(numberOfMoons) \(moonsString).")
        } else {
            print("No information available for the number of moons of planet \(planetName ?? "unknown").")
        }
    }
    if showsMoonNames {
        showMoonsOf(planet: p)
    }
}

showDefaultInfoOfPlanet_Refactored(planet: venus)

// It would be convenient to receive multiple pieces of information back about a planet from a single function. Luckily, Swift allows us to return tuple values.
// Note: we created all the planets so we know they all have a name and order but in real application, this might not be guaranteed. Consider using an optional return value.

func nameAndOrder(ofPlanet p: [String : Any?]) -> (name: String, order: Int)? {
    guard let name = p["Name"] as? String, let order = p["Order"] as? Int else {
        return nil
    }
    return (name, order)
}

// Now we can call this function and ask for the appropriate value by name of the return value in the tuple

if let earthInfo = nameAndOrder(ofPlanet: earth) {
    print(earthInfo.name)
    print(earthInfo.order)
}

// - Scope
//      - The Function's body is denoted by {}
//      - These "curly braces" define the scope of a funtion
//      - Nested functions trap variables that exist within their enclosing scope
// We could have written the numberOfMoons function as a nested function (but this has the disadvanteage that it would only useable inside the scope of the outer function).

func showDefaultInfoOfPlanet_Nested(planet p: [String : Any?], showsNumberOfMoons: Bool = true, showsMoonNames: Bool = true) {
    print("\n-showInfoOfPlanet_Nested():")
    let planetName = p["Name"] as? String
    print("Here's the information you asked for about the planet \(planetName ?? "unknown"):")
    func numberOfMoons() -> Int? {
        var numberOfMoons: Int?
        if let moonsArray = p["Moons"] as? [AnyObject] {
            // Notice that the variable p is not a parameter this nested function; it is "trapped" by this function from its enclosing scope.
            numberOfMoons = moonsArray.count
        }
        return numberOfMoons
    }
    
    if showsNumberOfMoons {
        if let numberOfMoons = numberOfMoons() {
            let moonsString = numberOfMoons > 1 ? "moons" : "moon"
            print("The planet \(planetName ?? "unknown") has \(numberOfMoons) \(moonsString).")
        } else {
            print("No information available for the number of moons of planet \(planetName ?? "unknown").")
        }
    }
    if showsMoonNames {
        showMoonsOf(planet: p)
    }
}

showDefaultInfoOfPlanet_Nested(planet: venus)

// - Protecting Functions from Improper Conditions
//      - Prevent your function from executing if proper conditions are not met with a guard statement
//          - Return out of the function or return a default "safe" value
//      - Especially helpful to ensure trapped values or parameter values are valid before proceeding to run the function
// Let's enchance the code to use a guard statement to reduce the number of if statements and still protect aganist nil if a dictionary does not contain a requested key-value pair.

func showDefaultInfoOfPlanet_Guarded(planet p: [String : Any?], showsNumberOfMoons: Bool = true, showsMoonNames: Bool = true) {
    print("\n-showInfoOfPlanet_Guarded():")
    
    guard let moons = p["Moons"] else {
        print("No information available.")
        return
    }
    
    let planetName = p["Name"] as? String
    print("Here's the information you asked for about the planet \(planetName ?? "unknown"):")
    
    func numberOfMoons() -> Int? {
        var numberOfMoons: Int?
        if let moonsArray = p["Moons"] as? [AnyObject] {
            // Notice that the variable p is not a parameter this nested function; it is "trapped" by this function from its enclosing scope.
            numberOfMoons = moonsArray.count
        }
        return numberOfMoons
    }
    if showsNumberOfMoons {
        if let numberOfMoons = numberOfMoons() {
            let moonsString = numberOfMoons > 1 ? "moons" : "moon"
            print("The planet \(planetName ?? "unknown") has \(numberOfMoons) \(moonsString).")
        } else {
            print("No information available for the number of moons of planet \(planetName ?? "unknown").")
        }
    }
    if showsMoonNames {
        showMoonsOf(planet: p) // Notice that even thow showMoonOfPlanet() protects itself if it cannot find the "Moons" key in its planet dictionary, guard prevents it from even being called so we don't have waste cycles calling that function.
    }
}

showDefaultInfoOfPlanet_Guarded(planet: venus)
