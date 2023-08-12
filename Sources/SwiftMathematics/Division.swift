// Division.swift
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

precedencegroup DividesEvenlyPrecedence {
    higherThan: ComparisonPrecedence
}

// MARK: - Operators

infix operator ÷ : MultiplicationPrecedence
infix operator ÷= : AssignmentPrecedence

infix operator ∣ : DividesEvenlyPrecedence
infix operator ∤ : DividesEvenlyPrecedence

// MARK: - Implementations

public extension BinaryInteger {
    static func ÷ (x: Self, y: Self) -> Self {
        x / y
    }
    
    static func ÷= (x: inout Self, y: Self) {
        x /= y
    }
    
    /// Returns whether `x` divides into `y` without a remainder.
    ///
    /// - Parameters:
    ///   - x: A number.
    ///   - y: A number to be divided by the first number.
    static func ∣ (x: Self, y: Self) -> Bool {
        x.quotientAndRemainder(dividingBy: y).remainder == 0
    }
    
    /// Returns whether `x` does not divide into `y` without a remainder.
    ///
    /// - Parameters:
    ///   - x: A number.
    ///   - y: A number to be divided by the first number.
    static func ∤ (x: Self, y: Self) -> Bool {
        x.quotientAndRemainder(dividingBy: y).remainder != 0
    }
}

public extension FloatingPoint {
    static func ÷ (x: Self, y: Self) -> Self {
        x / y
    }
    
    static func ÷= (x: inout Self, y: Self) {
        x /= y
    }
    
    /// Returns whether `x` divides into `y` without a remainder.
    ///
    /// - Parameters:
    ///   - x: A number.
    ///   - y: A number to be divided by the first number.
    static func ∣ (x: Self, y: Self) -> Bool {
        x.remainder(dividingBy: y) == 0
    }
    
    /// Returns whether `x` does not divide into `y` without a remainder.
    ///
    /// - Parameters:
    ///   - x: A number.
    ///   - y: A number to be divided by the first number.
    static func ∤ (x: Self, y: Self) -> Bool {
        x.remainder(dividingBy: y) != 0
    }
}
