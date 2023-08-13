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

// MARK: - Operators

infix operator ÷ : MultiplicationPrecedence
infix operator ÷= : AssignmentPrecedence

postfix operator %

// MARK: - Implementations

public extension BinaryInteger {
    /// Returns the quotient of dividing the first value by the second.
    ///
    /// For integer types, any remainder of the division is discarded.
    ///
    ///     let x = 21 ÷ 5
    ///     // x == 4
    ///
    /// - Parameters:
    ///   - x: The value to divide.
    ///   - y: The value to divide `x` by. `y` must not be zero.
    static func ÷ (x: Self, y: Self) -> Self {
        x / y
    }
    
    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable.
    ///
    /// For integer types, any remainder of the division is discarded.
    ///
    ///     var x = 21
    ///     x ÷= 5
    ///     // x == 4
    ///
    /// - Parameters:
    ///   - x: The value to divide.
    ///   - y: The value to divide `x` by. `y` must not be zero.
    static func ÷= (x: inout Self, y: Self) {
        x /= y
    }
    
    /// Returns the given number divided by 100.
    ///
    ///     let x = 42%
    ///     // x == 0.42
    ///
    /// - Parameters:
    ///   - x: The value to divide by 100.
    static postfix func % <T: FloatingPoint>(x: Self) -> T {
        T(x) / 100
    }
}

public extension FloatingPoint {
    /// Returns the quotient of dividing the first value by the second, rounded
    /// to a representable value.
    ///
    /// The division operator (`÷`) calculates the quotient of the division if
    /// `y` is nonzero. If `y` is zero, the result of the division is infinity,
    /// with the sign of the result matching the sign of `x`.
    ///
    ///     let x = 16.875
    ///     let y = x ÷ 2.25
    ///     // y == 7.5
    ///
    ///     let z = x ÷ 0
    ///     // z.isInfinite == true
    ///
    /// The `÷` operator implements the division operation defined by the [IEEE
    /// 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - x: The value to divide.
    ///   - y: The value to divide `x` by.
    static func ÷ (x: Self, y: Self) -> Self {
        x / y
    }
    
    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable, rounding to a representable value.
    ///
    /// - Parameters:
    ///   - x: The value to divide.
    ///   - y: The value to divide `x` by.
    static func ÷= (x: inout Self, y: Self) {
        x /= y
    }
    
    /// Returns the given number divided by 100.
    ///
    ///     let x = 23.4%
    ///     // x == 0.234
    ///
    /// - Parameters:
    ///   - x: The value to divide by 100.
    static postfix func % (x: Self) -> Self {
        x / 100
    }
}
