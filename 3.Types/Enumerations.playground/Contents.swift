import UIKit

// ENUMERATIONS
// - What is an Enumeration?
//      - Enumerations (enums) are a Value Type.
//      - Define a list of possible cases for instances of that enum type.
//      - Often assigned to instance variables to identify known possible cases.


// - Creating Basic Enumerations
//      - The enumeration is declared with the enum keyword followed by the name of the type (Planet).
//      - The cases and any methods or computed properties all appear inside the curly braces.

enum Planet {
    case Mercury
    case Venus
    case Earth
    case Mars
    case Jupiter
    case Saturn
    case Uranus
    case Neptune
}

// Keep in mind that the cases above only enumerate (i.e., "list out") the different possibilities.
// We still have to actually create the Planet instances.
let theSolarSystem: [Planet] = [.Mercury, .Venus, .Earth, .Mars, .Jupiter, .Saturn, .Uranus, .Neptune]

// - Creating Raw-Value Enumerations
//      - Especially helpful when comparing database or other "interpreted" values.
//      - Numeric types and String are supported.
//      - Look for:
//          - Specify value type for enums using a colon (:).
//          - Enums with a raw value type of Int can be comma delimited (consecutive numbers) or defined as separate cases with any given Int value.

// Notice that we also declared MilkyWayPlanet to be an Int value type.

enum MilkyWayPlanet: Int {
    case Mercury = 1
    case Venus
    case Earth
    case Mars
    case Jupiter
    case Saturn
    case Uranus
    case Neptune
    
    // Notice that the compiler reminds us that stored properties cannot be set on an enum type. (Uncomment to see)
    // var solarSystem: String!
    // This is a computed property, which is allowed.
    // Note that since we did not define any values for our cases, the first case defaults to Int value of 1, similar to one-based indexing.
    var order: Int {
        return self.rawValue
    }
    
    // - Using Enumeration
    //      - Use switch statements rather than if-else programming.
    //          - Switch statements are exhaustive.
    //      - Use init(rawValue:) initializer to convert raw values to defined enum case.
    //      - Type may be inferred when assigning or comparing.
    
    // We could have created arrays of moons and asked for the count of that array.
    // We could have also had a moonCount computed property to do that for us.
    // But because we cannot actually store those arrays into an instance of a planet, we would have had to type out the moon name arrays twice - once for the moon count and again for the method below which shows the names of the moons.
    // We just hard-coded in the moon counts, which may be okay if you only have a small set of data but for larger data sets, we would want to do this all in a more dynamic fashion and let the computer do more of the work for us.
    
    // Methods
    func showMoonCount() {
        switch self {
        case .Mercury:
            print("0")
        case .Venus:
            print("0")
        case .Earth:
            print("1")
        case .Mars:
            print("2")
        case .Jupiter:
            print("79")
        case .Saturn:
            print("83")
        case .Uranus:
            print("27")
        case .Neptune:
            print("14")
        }
    }
    
    func showMoonNames() {
        switch self {
        case MilkyWayPlanet(rawValue: 0)!:
            print("No moons")
        case .Venus:
            print("No moons")
        case .Earth:
            print("Luna")
        case .Mars:
            print("Deimos and Phobos")
        case .Neptune:
            print("Triton, Proteus, Nereid, Larissa, Galatea, Despina, Thalassa, Naiad, Halimede, Nesso, Sao, Lomedeia, Psamathe and S/2004 N1.")
        default:
            print("THis planet hast too many moons to list.")
        }
    }
}
