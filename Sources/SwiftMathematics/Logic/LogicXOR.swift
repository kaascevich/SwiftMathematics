// LogicXOR.swift
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

// MARK: - Logical XOR

infix operator ⊻ : LogicalDisjunctionPrecedence
infix operator ⊕ : LogicalDisjunctionPrecedence
infix operator ≢ : LogicalDisjunctionPrecedence

public extension Bool {
    /// Performs a logical XOR operation on two Boolean values.
    ///
    /// The logical OR operator (`⊻`) combines two Boolean values and returns
    /// `true` if exactly one of the values is `true`. If both values are
    /// `false`, or if both are `true`, the operator returns `false`.
    ///
    /// | `x` | `y` | `x ⊻ y` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `F`   |
    /// | `T` | `F` |   `T`   |
    /// | `F` | `T` |   `T`   |
    /// | `F` | `F` |   `F`   |
    ///
    /// - Parameters:
    ///   - x: The left-hand side of the operation.
    ///   - y: The right-hand side of the operation.
    ///
    /// - Returns: The logical XOR of `x` and `y`.
    static func ⊻ (x: Self, y: Self) -> Self {
        x != y
    }
    
    /// Performs a logical XOR operation on two Boolean values.
    ///
    /// The logical OR operator (`⊕`) combines two Boolean values and returns
    /// `true` if exactly one of the values is `true`. If both values are
    /// `false`, or if both are `true`, the operator returns `false`.
    ///
    /// | `x` | `y` | `x ⊕ y` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `F`   |
    /// | `T` | `F` |   `T`   |
    /// | `F` | `T` |   `T`   |
    /// | `F` | `F` |   `F`   |
    ///
    /// - Parameters:
    ///   - x: The left-hand side of the operation.
    ///   - y: The right-hand side of the operation.
    ///
    /// - Returns: The logical XOR of `x` and `y`.
    static func ⊕ (x: Self, y: Self) -> Self {
        x ⊻ y
    }
    
    /// Performs a logical XOR operation on two Boolean values.
    ///
    /// The logical OR operator (`≢`) combines two Boolean values and returns
    /// `true` if exactly one of the values is `true`. If both values are
    /// `false`, or if both are `true`, the operator returns `false`.
    ///
    /// | `x` | `y` | `x ≢ y` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `F`   |
    /// | `T` | `F` |   `T`   |
    /// | `F` | `T` |   `T`   |
    /// | `F` | `F` |   `F`   |
    ///
    /// - Parameters:
    ///   - x: The left-hand side of the operation.
    ///   - y: The right-hand side of the operation.
    ///
    /// - Returns: The logical XOR of `x` and `y`.
    static func ≢ (x: Self, y: Self) -> Self {
        x ⊻ y
    }
}
