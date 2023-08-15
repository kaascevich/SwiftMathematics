// Sets.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

// MARK: - Constants

/// The empty set.
///
/// The character representing this constant is not the actual empty set
/// symbol (`∅`), as Swift treats it as an operator character. The similar
/// "o with stroke" symbol (`ø`) is used instead. On US English keyboard
/// layouts, it can be entered using ⌥O.
public let ø: Set<AnyHashable> = []

// MARK: - Membership

infix operator ∈: ComparisonPrecedence
infix operator ∉: ComparisonPrecedence
infix operator ∋: ComparisonPrecedence
infix operator ∌: ComparisonPrecedence

public extension Set {
    /// Returns a Boolean value that indicates whether the given element exists
    /// in the given set.
    ///
    /// This example uses the `∈` operator to test whether an integer is a member
    /// of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7]
    ///     let x = 5
    ///     if x ∈ primes {
    ///         print("\(x) is prime!")
    ///     } else {
    ///         print("\(x). Not prime.")
    ///     }
    ///     // Prints "5 is prime!"
    ///
    /// - Parameters:
    ///    - element: An element to look for in the set.
    ///    - set: A set.
    /// - Returns: `true` if `element` exists in the set; otherwise, `false`.
    ///
    /// - Complexity: O(1)
    static func ∈ (element: Element, set: Self) -> Bool {
        set.contains(element)
    }
    
    /// Returns a Boolean value that indicates whether the given element does not
    /// exist in the given set.
    ///
    /// This example uses the `∉` operator to test whether an integer is a member
    /// of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7]
    ///     let x = 4
    ///     if x ∉ primes {
    ///         print("\(x). Not prime.")
    ///     } else {
    ///         print("\(x) is prime!")
    ///     }
    ///     // Prints "5. Not prime."
    ///
    /// - Parameters:
    ///    - element: An element to look for in the set.
    ///    - set: A set.
    /// - Returns: `true` if `element` does not exist in the set; otherwise, `false`.
    ///
    /// - Complexity: O(1)
    static func ∉ (element: Element, set: Self) -> Bool {
        !(element ∈ set)
    }
    
    /// Returns a Boolean value that indicates whether the given element exists
    /// in the given set.
    ///
    /// This example uses the `∋` operator to test whether an integer is a member
    /// of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7]
    ///     let x = 5
    ///     if primes ∋ x {
    ///         print("\(x) is prime!")
    ///     } else {
    ///         print("\(x). Not prime.")
    ///     }
    ///     // Prints "5 is prime!"
    ///
    /// - Parameters:
    ///    - set: A set.
    ///    - element: An element to look for in the set.
    /// - Returns: `true` if `element` exists in the set; otherwise, `false`.
    ///
    /// - Complexity: O(1)
    static func ∋ (set: Self, element: Element) -> Bool {
        set.contains(element)
    }
    
    /// Returns a Boolean value that indicates whether the given element does not
    /// exist in the given set.
    ///
    /// This example uses the `∌` operator to test whether an integer is a member
    /// of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7]
    ///     let x = 4
    ///     if primes ∌ x {
    ///         print("\(x). Not prime.")
    ///     } else {
    ///         print("\(x) is prime!")
    ///     }
    ///     // Prints "5. Not prime."
    ///
    /// - Parameters:
    ///    - set: A set.
    ///    - element: An element to look for in the set.
    /// - Returns: `true` if `element` does not exist in the set; otherwise, `false`.
    ///
    /// - Complexity: O(1)
    static func ∌ (set: Self, element: Element) -> Bool {
        !(set ∋ element)
    }
}

// MARK: - Subsets

infix operator ⊂: ComparisonPrecedence
infix operator ⊄: ComparisonPrecedence
infix operator ⊆: ComparisonPrecedence
infix operator ⊈: ComparisonPrecedence
infix operator ⊊: ComparisonPrecedence

public extension Set {
    /// Returns a Boolean value that indicates whether the first set is a strict
    /// subset of the second.
    ///
    /// Set *A* is a strict subset of another set *B* if every member of *A* is
    /// also a member of *B* and *B* contains at least one element that is not a
    /// member of *A*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(attendees ⊂ employees)
    ///     // Prints "true"
    ///
    ///     // A set is never a strict subset of itself:
    ///     print(attendees ⊂ attendees)
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - subset: A set of elements. `subset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `subset` is a strict subset of `set`; otherwise,
    ///   `false`.
    static func ⊂ (subset: Self, set: Self) -> Bool {
        subset.isStrictSubset(of: set)
    }
    
    /// Returns a Boolean value that indicates whether the set is not a strict
    /// subset of the given sequence.
    ///
    /// Set *A* is a strict subset of another set *B* if every member of *A* is
    /// also a member of *B* and *B* contains at least one element that is not a
    /// member of *A*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(attendees ⊄ employees)
    ///     // Prints "false"
    ///
    ///     // A set is never a strict subset of itself:
    ///     print(attendees ⊄ attendees)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - subset: A set of elements. `subset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `subset` is not a strict subset of `set`; otherwise,
    ///   `false`.
    static func ⊄ (subset: Self, set: Self) -> Bool {
        !(subset ⊂ set)
    }
    
    /// Returns a Boolean value that indicates whether the first set is a subset
    /// of the second.
    ///
    /// Set *A* is a subset of another set *B* if every member of *A* is also a
    /// member of *B*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(attendees ⊆ employees)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - subset: A set of elements. `subset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `subset` is a subset of `set`; otherwise, `false`.
    static func ⊆ (subset: Self, set: Self) -> Bool {
        subset.isSubset(of: set)
    }
    
    /// Returns a Boolean value that indicates whether the first set is not a
    /// subset of the second.
    ///
    /// Set *A* is a subset of another set *B* if every member of *A* is also a
    /// member of *B*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(attendees ⊈ employees)
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - subset: A set of elements. `subset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `subset` is not a subset of `set`; otherwise, `false`.
    static func ⊈ (subset: Self, set: Self) -> Bool {
        !(subset ⊆ set)
    }
    
    /// Returns a Boolean value that indicates whether the first set is a subset
    /// of, but not equal to, the second.
    ///
    /// Set *A* is a subset of another set *B* if every member of *A* is also a
    /// member of *B*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(attendees ⊊ employees)
    ///     // Prints "true"
    ///
    ///     print(attendees ⊊ attendees)
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - subset: A set of elements. `subset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `subset` is a subset of `set` and is not equal to
    ///   it; otherwise, `false`.
    static func ⊊ (subset: Self, set: Self) -> Bool {
        subset ⊂ set && subset != set
    }
}

// MARK: - Supersets

infix operator ⊃: ComparisonPrecedence
infix operator ⊅: ComparisonPrecedence
infix operator ⊇: ComparisonPrecedence
infix operator ⊉: ComparisonPrecedence
infix operator ⊋: ComparisonPrecedence

public extension Set {
    /// Returns a Boolean value that indicates whether the first set is a strict
    /// superset of the second.
    ///
    /// Set *A* is a strict superset of another set *B* if every member of *B* is
    /// also a member of *A* and *A* contains at least one element that is not a
    /// member of *B*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(employees ⊃ attendees)
    ///     // Prints "true"
    ///
    ///     // A set is never a strict superset of itself:
    ///     print(employees ⊃ employees)
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - superset: A set of elements. `superset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `superset` is a strict superset of `set`; otherwise,
    ///   `false`.
    static func ⊃ (superset: Self, set: Self) -> Bool {
        superset.isStrictSuperset(of: set)
    }
    
    /// Returns a Boolean value that indicates whether the set is not a strict
    /// superset of the given sequence.
    ///
    /// Set *A* is a strict superset of another set *B* if every member of *B* is
    /// also a member of *A* and *A* contains at least one element that is not a
    /// member of *B*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(employees ⊅ attendees)
    ///     // Prints "false"
    ///
    ///     // A set is never a strict superset of itself:
    ///     print(employees ⊅ employees)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - superset: A set of elements. `superset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `superset` is not a strict superset of `set`; otherwise,
    ///   `false`.
    static func ⊅ (superset: Self, set: Self) -> Bool {
        !(superset ⊃ set)
    }
    
    /// Returns a Boolean value that indicates whether the first set is a superset
    /// of the second.
    ///
    /// Set *A* is a superset of another set *B* if every member of *B* is also a
    /// member of *A*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(employees ⊇ attendees)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - superset: A set of elements. `superset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `superset` is a superset of `set`; otherwise, `false`.
    static func ⊇ (superset: Self, set: Self) -> Bool {
        superset.isSuperset(of: set)
    }
    
    /// Returns a Boolean value that indicates whether the set is not a superset
    /// of the given sequence.
    ///
    /// Set *A* is a superset of another set *B* if every member of *B* is also a
    /// member of *A*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(employees ⊉ attendees)
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - superset: A set of elements. `superset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `superset` is not a superset of `set`; otherwise, `false`.
    static func ⊉ (superset: Self, set: Self) -> Bool {
        !(superset ⊇ set)
    }
    
    /// Returns a Boolean value that indicates whether the first set is a superset
    /// of, but not equal to, the second.
    ///
    /// Set *A* is a superset of another set *B* if every member of *B* is also a
    /// member of *A*.
    ///
    ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     print(employees ⊋ attendees)
    ///     // Prints "true"
    ///
    ///     print(employees ⊋ employees)
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - superset: A set of elements. `superset` must be finite.
    ///   - set: A set of elements. `set` must be finite.
    /// - Returns: `true` if `superset` is a superset of `set` and is not equal to
    ///   it; otherwise, `false`.
    static func ⊋ (superset: Self, set: Self) -> Bool {
        superset ⊃ set && superset != set
    }
}
