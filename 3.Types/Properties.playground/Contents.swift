import UIKit

// PROPERTIES
// - What is a Property?
//      - Properties describe the characteristics of the real-world objects we are modelling.
//      - They preserve or report the state of objects in code (e.g. UI state).
//      - Properties can either be stored or computed.
//      - We have seen that stored properties help with keeping data concise.

class CelestialBody: NSObject {
    enum CelestialBodyTaxon: Int {
        case Unknown = 0
        case Star
        case Planet
        case Moon
        case DwarfPlanet
    }
    
    let numberOfSecondsInOneEarthDay = 86400  // Corrected the number of seconds in one Earth day
    
    // Stored Properties
    
    // The following five properties are all stored properties.
    // Note that preferCommonNames is easily recognized as a stored property because of the assignment operator (=).
    var preferCommonNames = true
    
    // Notice that properName is an implicitly unwrapped Optional String. A non-nil value must be provided after our class is initialized before it can be used.
    var properName: String!
    
    // Notice that commonName is an optional String because there may not be a common name for a given celestial body. Its value will be nil after our class is initialized, unless it is set to be non-nil during initialization.
    var commonName: String?
    
    // Notice that taxonomy is a stored property, but it is of type Optional CelestialBodyTaxon (indicated with "?"). Its value will be stored as nil until it is set as something else.
    var taxonomy: CelestialBodyTaxon? {
        
        // Property Observation
        // We can work with property observers and perform data tasks. For example, we may want to set the value of another property.
        // Notice that we use dot syntax to access and set property.
        didSet {
            self.taxonomyLastUpdated = NSDate()
            print(self.taxonomyLastUpdated!)
        }
    }
    
    var taxonomyLastUpdated: NSDate?
    
    // Computed Properties
    // The following property is a computed property.
    // The number of days since an update occurred depends on the current date and if the value was ever updated (taxonomyLastUpdated is an Optional NSDate), as it makes good sense for this value to be dynamically determined, hence the computed property.
    var taxonomyLastUpdatedDaysAgo: Double? {
        var earthDayAgo: Double?
        
        if let lastUpdated = self.taxonomyLastUpdated {
            earthDayAgo = NSDate().timeIntervalSince(lastUpdated as Date) / Double(numberOfSecondsInOneEarthDay)
        }
        return earthDayAgo
    }
    
    var name: String {
        // Getters and Setters
        
        get {
            if preferCommonNames, let name = self.commonName {
                return name
            } else {
                return properName
            }
        }
        
        set /* (newValue) */ {
            if self.commonName == nil {
                // Notice that Swift provides a newValue variable for us to use.
                self.commonName = newValue
            }
        }
    }
    
    // Lazy Stored Properties
    // The following property is a Stored Property but is lazily loaded.
    // It will be expensive (i.e., require system resources, time, and power) to calculate the distance of a given Celestial body from Earth so we don't want to load this property until we are going to actually use it.
    // Note the syntax: starts with the keyword lazy, mutable (var keyword); explicitly typed, has an assignment operator (=): assigned to a closure with () at the end so that the closure will be executed and the resulting value stored into the property.
    // Note that lazy stored properties are only calculated one time in the life of the object (when it is first accessed), so if we wanted to update the distance, we would need a new instance of the CelestialBody, or we would have to make this a computed property.
    lazy var distanceFromEarth: Double = {
        var distance: Double = 0
        // some astronomic calculations
        return distance
    }()
}

class Star: CelestialBody {
    // Access Control
    // Also notice that isSupernova is marked private. We do not want other objects to make the Star supernova. The star will follow its own lifecycle.
    private var isSupernova = false
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    override init() {
        super.init()
        self.taxonomy = .Star
    }
    
    func suckInPlanets() {
        if isSupernova {
            // destroy the planets
        }
    }
}
