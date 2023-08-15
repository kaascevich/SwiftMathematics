// Supersets.swift
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

// MARK: - Operators

infix operator ⊃: ComparisonPrecedence
infix operator ⊅: ComparisonPrecedence

infix operator ⊇: ComparisonPrecedence
infix operator ⊉: ComparisonPrecedence

infix operator ⊋: ComparisonPrecedence

// MARK: - Implementations

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
    ///   - superset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `superset` is a strict superset of `set`; otherwise,
    ///   `false`.
    @inlinable static func ⊃ (superset: Self, set: Self) -> Bool {
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
    ///   - superset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `superset` is not a strict superset of `set`; otherwise,
    ///   `false`.
    @inlinable static func ⊅ (superset: Self, set: Self) -> Bool {
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
    ///   - superset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `superset` is a superset of `set`; otherwise, `false`.
    @inlinable static func ⊇ (superset: Self, set: Self) -> Bool {
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
    ///   - superset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `superset` is not a superset of `set`; otherwise, `false`.
    @inlinable static func ⊉ (superset: Self, set: Self) -> Bool {
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
    ///   - superset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `superset` is a superset of `set` and is not equal to
    ///   it; otherwise, `false`.
    @inlinable static func ⊋ (superset: Self, set: Self) -> Bool {
        superset ⊃ set && superset != set
    }
}
