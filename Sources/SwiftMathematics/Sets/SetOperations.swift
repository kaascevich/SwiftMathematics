// SetOperations.swift
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

// MARK: - Intersection and Union

infix operator ∩
infix operator ∪

public extension Set {
    /// Returns a new set with the elements that are common to both of the given
    /// sets.
    ///
    /// In the following example, the `bothNeighborsAndEmployees` set is made up
    /// of the elements that are in *both* the `employees` and `neighbors` sets.
    /// Elements that are in only one or the other are left out of the result of
    /// the intersection.
    ///
    ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
    ///     let bothNeighborsAndEmployees = employees ∩ neighbors
    ///     print(bothNeighborsAndEmployees)
    ///     // Prints "["Bethany", "Eric"]"
    ///
    /// - Parameters:
    ///   - a: A set.
    ///   - b: Another set.
    ///
    /// - Returns: A new set.
    @inlinable static func ∩ (a: Self, b: Self) -> Self {
        a.intersection(b)
    }
    
    /// Returns a new set with the elements of both of the given sets.
    ///
    /// In the following example, the `attendeesAndVisitors` set is made up
    /// of the elements of the `attendees` set and the `visitors` array:
    ///
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     let visitors = ["Marcia", "Nathaniel"]
    ///     let attendeesAndVisitors = attendees ∪ visitors
    ///     print(attendeesAndVisitors)
    ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
    ///
    /// If the first set already contains one or more elements that are also
    /// in the second, the existing members are kept. If the second set
    /// contains multiple instances of equivalent elements, only the first
    /// instance is kept.
    ///
    ///     let initialIndices = Set(0..<5)
    ///     let expandedIndices = initialIndices ∪ [2, 3, 6, 6, 7, 7]
    ///     print(expandedIndices)
    ///     // Prints "[2, 4, 6, 7, 0, 1, 3]"
    ///
    /// - Parameters:
    ///   - a: A set.
    ///   - b: Another set.
    ///
    /// - Returns: A new set with the unique elements of the given sets.
    @inlinable static func ∪ (a: Self, b: Self) -> Self {
        a.union(b)
    }
}
