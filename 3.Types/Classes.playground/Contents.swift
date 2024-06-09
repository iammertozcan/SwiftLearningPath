import UIKit

// CLASSES
// - What is a Class?
//      - Classes are Reference Types
//      - Classes encapsulate data and behavior into a cohesive unit (i.e., an object).
//      - Classes are more powerful as a model of real-world objects because...
//          - They can hold stored properties (similar to structs).
//          - They can accept initializers.
//          - They can inherit from other classes.
//      - In an application, we normally put a Class into its own source file for organization.

class HeavenlyBody {
    enum CelestialBodyTaxon: Int {
        case Unknown = 0
        case Star
        case Planet
        case Moon
        case DwarfPlanet
    }
    
    var taxonomy: CelestialBodyTaxon?
    var name: String
    
    init(taxonomy: Int, name: String = "Unnamed") {
        self.taxonomy = CelestialBodyTaxon(rawValue: taxonomy)
        self.name = name
    }
    
    // Methods
    // - For Classes, methods that modify properties do not need to be marked with `mutating`.
    
    func changeTaxonomy(taxon: CelestialBodyTaxon) {
        self.taxonomy = taxon
    }
}

// Comment init(taxonomy:) for use these
// let aBody = HeavenlyBody()
// let aSpecificBody = HeavenlyBody(taxonomy: .Planet, name: "XR9123-a")

let unknownBody = HeavenlyBody(taxonomy: 1) // Notice that attempting to create an instance of HeavenlyBody with an invalid taxonomy still returns an instance, but .taxonomy is nil because it is optional. Decide what is right for your implementation.

print("Name: \(unknownBody.name)")
if let taxonomy = unknownBody.taxonomy {
    print("Taxonomy: \(taxonomy)")
} else {
    print("Taxonomy: Unknown")
}

let pluto = HeavenlyBody(taxonomy: 1, name: "Pluto")

pluto.changeTaxonomy(taxon: .DwarfPlanet)

if let taxonomy = pluto.taxonomy {
    print("Name: \(pluto.name)")
    print("Taxonomy: \(taxonomy)")
} else {
    print("Name: \(pluto.name)")
    print("Taxonomy: Unknown")
}
