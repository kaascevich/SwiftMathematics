// Comparison.swift
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

infix operator ≤ : ComparisonPrecedence
infix operator ≥ : ComparisonPrecedence
infix operator ⋜ : ComparisonPrecedence
infix operator ⋝ : ComparisonPrecedence

infix operator ≨ : ComparisonPrecedence
infix operator ≩ : ComparisonPrecedence

infix operator ≮ : ComparisonPrecedence
infix operator ≯ : ComparisonPrecedence
infix operator ≰ : ComparisonPrecedence
infix operator ≱ : ComparisonPrecedence

infix operator ≶ : ComparisonPrecedence
infix operator ≷ : ComparisonPrecedence
infix operator ≸ : ComparisonPrecedence
infix operator ≹ : ComparisonPrecedence

infix operator ⋚ : ComparisonPrecedence
infix operator ⋛ : ComparisonPrecedence

infix operator ≬:  ComparisonPrecedence

// MARK: - Implementations

public extension Comparable {
    static func ≤ (_ lhs: Self, _ rhs: Self) -> Bool { lhs <= rhs }
    static func ≥ (_ lhs: Self, _ rhs: Self) -> Bool { lhs >= rhs }
    static func ⋜ (_ lhs: Self, _ rhs: Self) -> Bool { lhs <= rhs }
    static func ⋝ (_ lhs: Self, _ rhs: Self) -> Bool { lhs >= rhs }
    
    static func ≨ (_ lhs: Self, _ rhs: Self) -> Bool { lhs < rhs && lhs != rhs }
    static func ≩ (_ lhs: Self, _ rhs: Self) -> Bool { lhs > rhs && lhs != rhs }
    
    static func ≮ (_ lhs: Self, _ rhs: Self) -> Bool { !(lhs < rhs) }
    static func ≯ (_ lhs: Self, _ rhs: Self) -> Bool { !(lhs > rhs) }
    
    static func ≰ (_ lhs: Self, _ rhs: Self) -> Bool { !(lhs < rhs) && !(lhs == rhs) }
    static func ≱ (_ lhs: Self, _ rhs: Self) -> Bool { !(lhs > rhs) && !(lhs == rhs) }
    
    static func ≶ (_ lhs: Self, _ rhs: Self) -> Bool { lhs < rhs || lhs > rhs }
    static func ≷ (_ lhs: Self, _ rhs: Self) -> Bool { lhs > rhs || lhs < rhs }
    
    static func ≸ (_ lhs: Self, _ rhs: Self) -> Bool { !(lhs < rhs) && !(lhs > rhs) }
    static func ≹ (_ lhs: Self, _ rhs: Self) -> Bool { !(lhs > rhs) && !(lhs < rhs) }
    
    static func ⋚ (_ lhs: Self, _ rhs: Self) -> Bool { lhs < rhs || lhs == rhs || lhs > rhs }
    static func ⋛ (_ lhs: Self, _ rhs: Self) -> Bool { lhs > rhs || lhs == rhs || lhs < rhs }
    
    /// Returns a Boolean value indicating whether a value is between two
    /// values.
    ///
    /// - Parameters:
    ///   - lhs: A value.
    ///   - rhs: A tuple of values representing lower and upper bounds,
    ///     respectively.
    static func ≬ (_ lhs: Self, _ rhs: (Self, Self)) -> Bool {
        lhs > rhs.0 && lhs < rhs.1
    }
    
    /// Returns a Boolean value indicating whether a value is in a range
    /// of values.
    ///
    /// - Parameters:
    ///   - lhs: A value.
    ///   - rhs: A range of values.
    static func ≬ (_ lhs: Self, _ rhs: Range<Self>) -> Bool {
        rhs.contains(lhs)
    }
    
    /// Returns a Boolean value indicating whether a value is in a closed
    /// range of values.
    ///
    /// - Parameters:
    ///   - lhs: A value.
    ///   - rhs: A closed range of values.
    static func ≬ (_ lhs: Self, _ rhs: ClosedRange<Self>) -> Bool {
        rhs.contains(lhs)
    }
}
