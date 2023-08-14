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

// MARK: - Implementations

public extension Comparable {
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≤ (x: Self, y: Self) -> Bool { x <= y }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≥ (x: Self, y: Self) -> Bool { x >= y }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is equal to or less than that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ⋜ (x: Self, y: Self) -> Bool { x <= y }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is equal to or greater than that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ⋝ (x: Self, y: Self) -> Bool { x >= y }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than, but not equal to, that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≨ (x: Self, y: Self) -> Bool { x < y && x != y }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than, but not equal to, that of the second
    /// argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≩ (x: Self, y: Self) -> Bool { x > y && x != y }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is not less than that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≮ (x: Self, y: Self) -> Bool { !(x < y) }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is not greater than that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≯ (x: Self, y: Self) -> Bool { !(x > y) }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is neither less than nor equal to that of the second
    /// argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≰ (x: Self, y: Self) -> Bool { !(x < y) && !(x == y) }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is neither greater than nor equal to that of the second
    /// argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≱ (x: Self, y: Self) -> Bool { !(x > y) && !(x == y) }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or greater than that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≶ (x: Self, y: Self) -> Bool { x < y || x > y }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or less than that of the second argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≷ (x: Self, y: Self) -> Bool { x > y || x < y }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is neither less than nor greater than that of the second
    /// argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≸ (x: Self, y: Self) -> Bool { !(x < y) && !(x > y) }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is neither greater than nor less than that of the second
    /// argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≹ (x: Self, y: Self) -> Bool { !(x > y) && !(x < y) }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than, equal to, or greater than that of the second
    /// argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ⋚ (x: Self, y: Self) -> Bool { x < y || x == y || x > y }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than, equal to, or less than that of the second
    /// argument.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ⋛ (x: Self, y: Self) -> Bool { x > y || x == y || x < y }
}
