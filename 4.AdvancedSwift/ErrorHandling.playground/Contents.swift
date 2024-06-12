import UIKit

// ERROR HANDLING
// - Error Handling
//      - Throwing Errors
//          - Defining errors to throw
//          - Declaring a method that throws an error
//          - Throwing an error
//      - Catching Errors
//          - Do-Catch
//      - Errors as an Optional Value
//          - try?
//      - Disabling Errors
//          - try!

enum SomeError: Error {
    case BadError
    case VeryBadError(errorDescription: String)
    case SeriouslyBadError
    case UnknownError
}

func throwAnError() throws {
    let someVar = 1
    
    if someVar == 0 {
        throw SomeError.VeryBadError(errorDescription: "A Very Bad Error has occurred.")
    }
}

func throwAnotherError() throws {
    throw SomeError.BadError
}

// Simple Do-Catch (catch all)
do {
    try throwAnError()
} catch {
    print("Caught an Error!")
}

// Do-Catch specific errors
do {
    try throwAnError()
} catch SomeError.BadError {
    print("A bad error has occurred.")
} catch SomeError.VeryBadError(let errorDescription) {
    print("A very bad error has occurred: \(errorDescription).")
} catch SomeError.SeriouslyBadError {
    print("A seriously bad error has occurred.")
} catch {
    print("Catch-All, probably Unknown Error")
}

// Using try? to handle errors as optional values
let x = try? throwAnError()
if x == nil {
    print("The method must be in error")
} else {
    print("The method returned successfully")
}
