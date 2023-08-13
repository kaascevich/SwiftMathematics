// Equality.swift
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

infix operator ≠ : ComparisonPrecedence

infix operator ≈ : ComparisonPrecedence
infix operator ≉ : ComparisonPrecedence

infix operator ≡ : ComparisonPrecedence
infix operator ≢ : ComparisonPrecedence

// MARK: - Implementations

public extension Equatable {
    /// Returns a Boolean value indicating whether two values are not equal.
    ///
    /// Inequality is the inverse of equality. For any values `x` and `y`, `x ≠ y`
    /// implies that `x == y` is `false`.
    ///
    /// This is the default implementation of the not-equal-to operator (`≠`)
    /// for any type that conforms to `Equatable`.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    static func ≠ (x: Self, y: Self) -> Bool { x != y }
}

public extension FloatingPoint {
    static func ≈ (x: Self, y: Self) -> Bool {
        x == y
        || x.nextDown == y
        || x.nextUp == y
    }
    static func ≉ (x: Self, y: Self) -> Bool {
        !(x ≈ y)
    }
}

public func ≡ (x: AnyObject?, y: AnyObject?) -> Bool { x === y }
public func ≢ (x: AnyObject?, y: AnyObject?) -> Bool { x !== y }
