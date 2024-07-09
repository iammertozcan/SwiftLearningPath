import UIKit

// EXTENSIONS
// - Extensions
//      - Retroactive Modeling
//          - Add functionality to existing class, structure, enumeration, or protocol type
//          - Cannot override existing functionality

// - Extending Properties (Double class)

extension Double {
    var celsius: Double { return self }
    var fahrenheit: Double { return (self * 1.8) + 32 }
}

let temperature: Double = 30

print("Temperature in Celsius: \(temperature.celsius)")
print("Temperature in Fahrenheit: \(temperature.fahrenheit)")

// - Extending Methods

extension Double {
    func multiply(by multiplier: Double) -> Double {
        return self * multiplier
    }
}

let value: Double = 2
let product = value.multiply(by: 13)
print("Product of \(value) multiplied by 13 is \(product)")

// - Protocol Extensions

// Define a protocol with some requirements
protocol Describable {
    var description: String { get }
}

// Extend the protocol to provide a default implementation
extension Describable {
    var description: String {
        return "This is a Describable object."
    }
}

// Conform a class to the protocol
class ExampleClass: Describable {
    var customDescription: String
    
    init(customDescription: String) {
        self.customDescription = customDescription
    }
    
    // Optionally, you can override the default implementation
    var description: String {
        return customDescription
    }
}

let example = ExampleClass(customDescription: "This is an example class.")
print(example.description)

// Conform another type to the protocol without overriding
struct AnotherExample: Describable {}

let anotherExample = AnotherExample()
print(anotherExample.description)
