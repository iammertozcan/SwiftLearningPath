import UIKit

// STRUCTURES
// - What is a Structure (struct)?
//      - Structures are a Value Type
//      - Structs encapsulate data into a cohesive unit (i.e., an object).
//      - Structures are more powerful as a model of real-world objects because...
//          - They can hold stored properties (as opposed to enums, which cannot).
//          - They can accept initializers.
// - Creating Structures
//      - In an application, we normally put a Struct into its own source file for organization.

struct HeavenlyBody {
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
    // - For Struct, Methods (Functions) that modify properties of an instance of the Struct must be marked with the keyword: mutating.
    
    mutating func changeTaxonomy(taxon: CelestialBodyTaxon) {
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

var pluto = HeavenlyBody(taxonomy: 1, name: "Pluto")

pluto.changeTaxonomy(taxon: .DwarfPlanet)

if let taxonomy = pluto.taxonomy {
    print("Name: \(pluto.name)")
    print("Taxonomy: \(taxonomy)")
} else {
    print("Name: \(pluto.name)")
    print("Taxonomy: Unknown")
}
