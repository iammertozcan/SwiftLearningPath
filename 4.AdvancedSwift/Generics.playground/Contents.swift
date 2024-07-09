import UIKit

// GENERICS
// - Problem
//      - Duplicate code/functionality where only the type is different
//      - Unsafe un-typed containers
// - Solution
//      - Swift provides a way to define 'generic' methods and containers that be may reused for more than one type.

// - Generics Syntax
//      - Angle Braces <>
//      - Type Place Holders
//      - Generics Methods and Class Properties
//      - Type Constraints
// - Generics in Action
//      - Simple Dictionary Implementation

class SimpleDictionaryItem<K: Equatable, V> {
    var key: K
    var value: V
    
    init(key: K, value: V) {
        self.key = key
        self.value = value
    }
}

class SimpleDictionary<K: Equatable, V> {
    private var items = [SimpleDictionaryItem<K, V>]()
    
    func put(key: K, value: V) {
        let item = SimpleDictionaryItem(key: key, value: value)
        items.append(item)
    }
    
    func remove(key: K) {
        if let index = items.firstIndex(where: { $0.key == key }) {
            items.remove(at: index)
        }
    }
    
    func find(key: K) -> V? {
        return items.first(where: { $0.key == key })?.value
    }
}

// Testing the SimpleDictionary
var dictionary = SimpleDictionary<String, Int>()
dictionary.put(key: "a", value: 1)
dictionary.put(key: "c", value: 2)
dictionary.put(key: "d", value: 3)
dictionary.put(key: "b", value: 4)

if let val = dictionary.find(key: "d") {
    print(val) // Outputs: 3
}

dictionary.remove(key: "d")

if let val = dictionary.find(key: "d") {
    print(val)
} else {
    print("The item has been removed")
}
