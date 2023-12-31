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

infix operator ∨ : LogicalDisjunctionPrecedence

public extension Bool {
    /// Performs a logical OR operation on two Boolean values.
    ///
    /// The logical OR operator (`∨`) combines two Boolean values and returns
    /// `true` if at least one of the values is `true`. If both values are
    /// `false`, the operator returns `false`.
    ///
    /// This operator uses short-circuit evaluation: The left-hand side (`p`) is
    /// evaluated first, and the right-hand side (`q`) is evaluated only if `p`
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
    /// In this example, `p` tests whether `error` is an empty string.
    /// Evaluation of the `∨` operator is one of the following:
    ///
    /// - When `error` is an empty string, `p` evaluates to `true` and `q` is
    ///   not evaluated, skipping the call to `majorErrors.contains(_:)`. The
    ///   result of the operation is `true`.
    /// - When `error` is not an empty string, `p` evaluates to `false` and `q`
    ///   is evaluated. The result of evaluating `q` is the result of the `∨`
    ///   operation.
    ///
    /// | `p` | `q` | `p ∨ q` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `T`   |
    /// | `T` | `F` |   `T`   |
    /// | `F` | `T` |   `T`   |
    /// | `F` | `F` |   `F`   |
    ///
    /// - Parameters:
    ///   - p: The left-hand side of the operation.
    ///   - q: The right-hand side of the operation.
    ///
    /// - Returns: The logical OR of `p` and `q`.
    static func ∨ (p: Self, q: @autoclosure () throws -> Self) rethrows -> Self {
        try p || q()
    }
}
