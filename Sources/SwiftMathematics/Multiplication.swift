// Multiplication.swift
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

infix operator × : MultiplicationPrecedence
infix operator ×= : AssignmentPrecedence

// MARK: - Implementations

public extension Numeric {
    /// Multiplies two values and produces their product.
    ///
    /// The multiplication operator (`×`) calculates the product of its two
    /// arguments. For example:
    ///
    ///     2 × 3                   // 6
    ///     100 × 21                // 2100
    ///     -10 × 15                // -150
    ///     3.5 × 2.25              // 7.875
    ///
    /// You cannot use `×` with arguments of different types. To multiply values
    /// of different types, convert one of the values to the other value's type.
    ///
    ///     let x: Int8 = 21
    ///     let y: Int = 1000000
    ///     Int(x) × y              // 21000000
    ///
    /// - Parameters:
    ///   - x: The first value to multiply.
    ///   - y: The second value to multiply.
    static func × (x: Self, y: Self) -> Self { x * y }
    
    /// Multiplies two values and stores the result in the left-hand-side
    /// variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func ×= (x: inout Self, y: Self) { x *= y }
}
