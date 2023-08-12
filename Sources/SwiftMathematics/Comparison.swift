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
    static func ≤ (x: Self, y: Self) -> Bool { x <= y }
    static func ≥ (x: Self, y: Self) -> Bool { x >= y }
    static func ⋜ (x: Self, y: Self) -> Bool { x <= y }
    static func ⋝ (x: Self, y: Self) -> Bool { x >= y }
    
    static func ≨ (x: Self, y: Self) -> Bool { x < y && x != y }
    static func ≩ (x: Self, y: Self) -> Bool { x > y && x != y }
    
    static func ≮ (x: Self, y: Self) -> Bool { !(x < y) }
    static func ≯ (x: Self, y: Self) -> Bool { !(x > y) }
    
    static func ≰ (x: Self, y: Self) -> Bool { !(x < y) && !(x == y) }
    static func ≱ (x: Self, y: Self) -> Bool { !(x > y) && !(x == y) }
    
    static func ≶ (x: Self, y: Self) -> Bool { x < y || x > y }
    static func ≷ (x: Self, y: Self) -> Bool { x > y || x < y }
    
    static func ≸ (x: Self, y: Self) -> Bool { !(x < y) && !(x > y) }
    static func ≹ (x: Self, y: Self) -> Bool { !(x > y) && !(x < y) }
    
    static func ⋚ (x: Self, y: Self) -> Bool { x < y || x == y || x > y }
    static func ⋛ (x: Self, y: Self) -> Bool { x > y || x == y || x < y }
    
    /// Returns a Boolean value indicating whether a value is between two
    /// values.
    ///
    /// - Parameters:
    ///   - x: A value.
    ///   - y: A tuple of values representing lower and upper bounds,
    ///     respectively.
    static func ≬ (x: Self, y: (Self, Self)) -> Bool {
        x > y.0 && x < y.1
    }
    
    /// Returns a Boolean value indicating whether a value is in a range
    /// of values.
    ///
    /// - Parameters:
    ///   - x: A value.
    ///   - y: A range of values.
    static func ≬ (x: Self, y: Range<Self>) -> Bool {
        y.contains(x)
    }
    
    /// Returns a Boolean value indicating whether a value is in a closed
    /// range of values.
    ///
    /// - Parameters:
    ///   - x: A value.
    ///   - y: A closed range of values.
    static func ≬ (x: Self, y: ClosedRange<Self>) -> Bool {
        y.contains(x)
    }
}
