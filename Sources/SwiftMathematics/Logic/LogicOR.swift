// LogicOR.swift
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

// MARK: - Logical OR

infix operator ∨: LogicalDisjunctionPrecedence

public extension Bool {
    /// Performs a logical OR operation on two Boolean values.
    ///
    /// The logical OR operator (`∨`) combines two Boolean values and returns
    /// `true` if at least one of the values is `true`. If both values are
    /// `false`, the operator returns `false`.
    ///
    /// This operator uses short-circuit evaluation: The left-hand side (`x`) is
    /// evaluated first, and the right-hand side (`y`) is evaluated only if `x`
    /// evaluates to `false`. For example:
    ///
    ///     let majorErrors: Set = ["No first name", "No last name", ...]
    ///     let error = ""
    ///
    ///     if error.isEmpty ∨ !majorErrors.contains(error) {
    ///         print("No major errors detected")
    ///     } else {
    ///         print("Major error: \(error)")
    ///     }
    ///     // Prints "No major errors detected"
    ///
    /// In this example, `x` tests whether `error` is an empty string.
    /// Evaluation of the `∨` operator is one of the following:
    ///
    /// - When `error` is an empty string, `x` evaluates to `true` and `y` is
    ///   not evaluated, skipping the call to `majorErrors.contains(_:)`. The
    ///   result of the operation is `true`.
    /// - When `error` is not an empty string, `x` evaluates to `false` and `y`
    ///   is evaluated. The result of evaluating `y` is the result of the `∨`
    ///   operation.
    ///
    /// | `x` | `y` | `x ∨ y` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `T`   |
    /// | `T` | `F` |   `T`   |
    /// | `F` | `T` |   `T`   |
    /// | `F` | `F` |   `F`   |
    ///
    /// - Parameters:
    ///   - x: The left-hand side of the operation.
    ///   - y: The right-hand side of the operation.
    ///
    /// - Returns: The logical OR of `x` and `y`.
    static func ∨ (x: Self, y: @autoclosure () throws -> Self) rethrows -> Self {
        try (x || y())
    }
}
