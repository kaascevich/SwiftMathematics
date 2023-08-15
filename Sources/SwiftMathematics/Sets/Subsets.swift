// Subsets.swift
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

infix operator ⊂: ComparisonPrecedence
infix operator ⊄: ComparisonPrecedence

infix operator ⊆: ComparisonPrecedence
infix operator ⊈: ComparisonPrecedence

infix operator ⊊: ComparisonPrecedence

// MARK: - Implementations

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
    ///   - subset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `subset` is a strict subset of `set`; otherwise,
    ///   `false`.
    @inlinable static func ⊂ (subset: Self, set: Self) -> Bool {
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
    ///   - subset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `subset` is not a strict subset of `set`; otherwise,
    ///   `false`.
    @inlinable static func ⊄ (subset: Self, set: Self) -> Bool {
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
    ///   - subset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `subset` is a subset of `set`; otherwise, `false`.
    @inlinable static func ⊆ (subset: Self, set: Self) -> Bool {
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
    ///   - subset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `subset` is not a subset of `set`; otherwise, `false`.
    @inlinable static func ⊈ (subset: Self, set: Self) -> Bool {
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
    ///   - subset: A set.
    ///   - set: Another set.
    ///
    /// - Returns: `true` if `subset` is a subset of `set` and is not equal to
    ///   it; otherwise, `false`.
    @inlinable static func ⊊ (subset: Self, set: Self) -> Bool {
        subset ⊂ set && subset != set
    }
}
