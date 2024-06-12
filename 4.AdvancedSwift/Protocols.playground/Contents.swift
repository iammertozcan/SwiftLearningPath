import UIKit

// PROTOCOLS
// - Problem
//      - Poor communication
//          - Many implementations doing the same tasks, but having different interfaces
// - Solution
//      - Better communication through well-defined, concrete interfaces shared by all implementations

// - Protocols as a Type

// Define a protocol named `SomeProtocol`
protocol SomeProtocol {
    
    // - Protocol Syntax
    //      - Properties, Methods and a Note on Mutating Methods
    
    // Properties
    var mustBeSettable: Int { get set }  // Read-write property
    var doesNotNeedToBeSettable: Int { get }  // Read-only property
    
    // Methods
    func someMethodReturnNothing()  // Method that returns nothing
    func someMethodReturnsInt() -> Int  // Method that returns an Int
}

// - Protocol Conformance
//      - Types that subscribe to a protocol are considered conforming to that protocol

// A class conforming to `SomeProtocol`
class SomeClass: SomeProtocol {
    // Properties
    var mustBeSettable: Int = 0
    var doesNotNeedToBeSettable: Int = 0
    
    // Methods
    func someMethodReturnNothing() {
        // Implementation of the method
    }
    
    func someMethodReturnsInt() -> Int {
        return 0
    }
}

// - Protocol Inheritance
//      - Protocols can inherit from other protocols

// Define another protocol that inherits from `SomeProtocol`
protocol AnotherProtocol: SomeProtocol {
    func anotherProtocolMethod()
}

// A class conforming to `AnotherProtocol`
class AnotherClass: AnotherProtocol {
    
    var mustBeSettable: Int = 0
    private(set) var doesNotNeedToBeSettable: Int = 0
    
    func someMethodReturnNothing() {
        doesNotNeedToBeSettable = 100
        print("The property is settable internally \(doesNotNeedToBeSettable)")
    }
    
    func someMethodReturnsInt() -> Int {
        return 0
    }
    
    func anotherProtocolMethod() {
        // Implementation of the method
    }
}

var someClass = SomeClass()
someClass.someMethodReturnNothing()

// - Protocol in Action
//      - Data Sources
//          - Many different open-source and commercial data sources (SQL Server, Oracle, MySQL)
//          - All have different implementations (SQL vs No SQL)
//          - All have similar use at the developer library level
//      - Data Reader
//          - Demonstrate the purpose and use of Protocols as a Type

enum DataSourceType {
    case sqlServer
    case oracle
}

// CRUD - create, read, update, delete
// Define a protocol for data source operations
protocol DataSourceProtocol {
    func create(record: Record)
    func getReader() -> DataReaderProtocol
    func update(record: Record)
    func delete(record: Record)
}

// Define a protocol for data reading operations
protocol DataReaderProtocol {
    func read() -> [Record]
}

// Record model
class Record {
    var recordID: String = UUID().uuidString
    var name: String?
    var phone: String?
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}

// In-memory storage for SQL Server and Oracle databases
var sqlServerDB: [Record] = []
var oracleDB: [String: Record] = [:]

// Implement a data reader for SQL Server
class SqlServerDataReader: DataReaderProtocol {
    func read() -> [Record] {
        return sqlServerDB
    }
}

// Implement a data reader for Oracle
class OracleDataReader: DataReaderProtocol {
    func read() -> [Record] {
        return Array(oracleDB.values)
    }
}

// Implement a data source for SQL Server
class SqlServerDataSource: DataSourceProtocol {
    func create(record: Record) {
        sqlServerDB.append(record)
    }
    
    func getReader() -> DataReaderProtocol {
        return SqlServerDataReader()
    }
    
    func update(record: Record) {
        for (index, currentRecord) in sqlServerDB.enumerated() {
            if record.recordID == currentRecord.recordID {
                sqlServerDB[index] = record
                break
            }
        }
    }
    
    func delete(record: Record) {
        sqlServerDB.removeAll { $0.recordID == record.recordID }
    }
}

// Implement a data source for Oracle
class OracleDataSource: DataSourceProtocol {
    func create(record: Record) {
        oracleDB[record.recordID] = record
    }
    
    func getReader() -> DataReaderProtocol {
        return OracleDataReader()
    }
    
    func update(record: Record) {
        oracleDB[record.recordID] = record
    }
    
    func delete(record: Record) {
        oracleDB.removeValue(forKey: record.recordID)
    }
}

let dataSource = SqlServerDataSource()

let mickeyRecord = Record(name: "Mickey Mouse", phone: "123-555-4567")
dataSource.create(record: mickeyRecord)

let donaldRecord = Record(name: "Donald Duck", phone: "123-555-QUAK")
dataSource.create(record: donaldRecord)

print("Before update...")
var reader = dataSource.getReader()
for record in reader.read() {
    print("\(record.recordID), \(record.name!), \(record.phone!)")
}

mickeyRecord.phone = "123-555-MCKY"
dataSource.update(record: mickeyRecord)

print("After update...")
reader = dataSource.getReader()
for record in reader.read() {
    print("\(record.recordID), \(record.name!), \(record.phone!)")
}

// Define a protocol named `ChapterProtocol` with mutating methods to set different chapters
protocol ChapterProtocol {
    mutating func setChapterOne()
    mutating func setChapterTwo()
    mutating func setChapterThree()
}

// Define an enum `Chapter` that conforms to `ChapterProtocol`
enum Chapter: ChapterProtocol {
    case one
    case two
    case three
    
    // Implement the mutating methods to set the respective chapters
    mutating func setChapterOne() {
        self = .one
    }
    
    mutating func setChapterTwo() {
        self = .two
    }
    
    mutating func setChapterThree() {
        self = .three
    }
}

var currentChapter: Chapter = .one

currentChapter.setChapterTwo()
print(currentChapter)  // Output: two

currentChapter.setChapterThree()
print(currentChapter)  // Output: three

currentChapter.setChapterOne()
print(currentChapter)  // Output: one
