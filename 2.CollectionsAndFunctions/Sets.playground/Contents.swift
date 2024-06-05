import UIKit

// Sets
var myGymFriends: Set<String>?

var mySchoolFriends = Set<String>()

// Then insert values
mySchoolFriends.insert("Lindsey")
mySchoolFriends.insert("Devin")
mySchoolFriends.insert("Efrain")

// Or initialize the Set using an Array literal
let myWorkFriends: Set<String> = ["Rudy", "David", "Ralf", "Vinson", "Frank"]

let uncategorizedFriends: Set<String> = ["Mark", "Joey", "Lindsey", "Frank"]

// Using Modifying Sets
// Combine multiple Sets to make larger Sets and duplicates will be eliminated for us
let allMyFriends = mySchoolFriends.union(myWorkFriends).union(uncategorizedFriends)

// We might want to create an Array for my speed dial, but even though Arrays can contain duplicate values, it wouldn't make sense for a speed dial list.
var speedDialList = [String]()

speedDialList.append(contentsOf: mySchoolFriends)
speedDialList.append(contentsOf: myWorkFriends)
speedDialList.append(contentsOf: uncategorizedFriends)

// Remove duplicates by converting the array to a set and back to an array
let cleanSpeedDialList = Array(Set(speedDialList))

// Use of Sets
// Suppose someone has some friends they are inviting to their wedding.
// We want friends who have someone in common to sit together at the reception.

let hometownFriends: Set<String> = ["Barbara", "John", "Trina", "Justin"]
let tokyoFriends: Set<String> = ["Justin", "Yusuke", "Naomi", "Yuya"]

let commonFriends = hometownFriends.intersection(tokyoFriends)
var tableGuests: Set<String>? // The order of people at a dining table is unimportant, so a Set is useful here

if !commonFriends.isEmpty {
    tableGuests = hometownFriends.union(tokyoFriends)
}

// Let's say our wedding planner heard Katie cannot make it.
var unseatedGuestsOfBride: Set<String> = ["Katie", "Taylor", "Zach", "Blake"]
var unseatedGuestsOfGroom: Set<String> = ["Kathie", "Tyler", "Zane", "Blair"]

var table2Guests: Set<String>?

if unseatedGuestsOfGroom.isDisjoint(with: unseatedGuestsOfBride) {
    table2Guests = unseatedGuestsOfGroom.union(unseatedGuestsOfBride)
}

table2Guests?.remove("Katie")
