import UIKit

class CelestialBody: NSObject {
    enum CelestialBodyTaxon: Int {
        case Unknown = 0
        case Star
        case Planet
        case Moon
        case DwarfPlanet
    }
    
    let numberOfSecondsInOneEarthDay = 86400
    
    // Stored Properties with Default Values
    var preferCommonNames = true
    var properName: String! = "Unnamed"
    var commonName: String? = nil
    var taxonomy: CelestialBodyTaxon? {
        didSet {
            self.taxonomyLastUpdated = NSDate()
            print(self.taxonomyLastUpdated!)
        }
    }
    var taxonomyLastUpdated: NSDate?
    
    // Computed Properties
    var taxonomyLastUpdatedDaysAgo: Double? {
        if let lastUpdated = self.taxonomyLastUpdated {
            return NSDate().timeIntervalSince(lastUpdated as Date) / Double(numberOfSecondsInOneEarthDay)
        }
        return nil
    }
    
    var name: String {
        get {
            if preferCommonNames, let name = self.commonName {
                return name
            } else {
                return properName
            }
        }
        set {
            if self.commonName == nil {
                self.commonName = newValue
            }
        }
    }
    
    // Lazy Stored Properties
    lazy var distanceFromEarth: Double = {
        var distance: Double = 0
        // some astronomic calculations
        return distance
    }()
    
    // Explicit Default Initializer
    override init() {
        super.init()
    }
    
    // Custom Initializer
    init(preferCommonNames: Bool, properName: String, commonName: String? = nil) {
        self.preferCommonNames = preferCommonNames
        self.properName = properName
        self.commonName = commonName
        super.init()
    }
    
    // Failable Initializer
    init?(taxonomy: CelestialBodyTaxon) {
        self.preferCommonNames = true
        self.properName = "Unnamed"
        self.taxonomy = taxonomy
        super.init()
        
        if taxonomy == .Unknown {
            return nil
        }
    }
}

class Star: CelestialBody {
    private var isSupernova = false
    
    // Custom Initializer
    override init(preferCommonNames: Bool, properName: String, commonName: String? = nil) {
        self.isSupernova = false
        super.init(preferCommonNames: preferCommonNames, properName: properName, commonName: commonName)
        self.taxonomy = .Star
    }
    
    // Convenience Initializer
    convenience init(name: String) {
        self.init(preferCommonNames: true, properName: name)
    }
    
    func suckInPlanets() {
        if isSupernova {
            // destroy the planets
        }
    }
}

// Usage of Default Initializer
let defaultCelestialBody = CelestialBody() // Using the explicitly defined default initializer
print("Default CelestialBody properName: \(defaultCelestialBody.properName!)")

// Usage of Custom Initializer
let customStar = Star(name: "Sun")
print("Custom Star properName: \(customStar.properName!)")
