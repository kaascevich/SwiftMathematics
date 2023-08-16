// LogicAND.swift
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

infix operator ∧ : LogicalConjunctionPrecedence

public extension Bool {
    /// Performs a logical AND operation on two Boolean values.
    ///
    /// The logical AND operator (`∧`) combines two Boolean values and returns
    /// `true` if both of the values are `true`. If either of the values is
    /// `false`, the operator returns `false`.
    ///
    /// This operator uses short-circuit evaluation: The left-hand side (`p`) is
    /// evaluated first, and the right-hand side (`q`) is evaluated only if `p`
    /// evaluates to `true`. For example:
    ///
    ///     let measurements = [7.44, 6.51, 4.74, 5.88, 6.27, 6.12, 7.76]
    ///     let sum = measurements.reduce(0, +)
    ///
    ///     if measurements.count > 0 ∧ sum / Double(measurements.count) < 6.5 {
    ///         print("Average measurement is less than 6.5")
    ///     }
    ///     // Prints "Average measurement is less than 6.5"
    ///
    /// In this example, `p` tests whether `measurements.count` is greater than
    /// zero. Evaluation of the `∧` operator is one of the following:
    ///
    /// - When `measurements.count` is equal to zero, `p` evaluates to `false`
    ///   and `q` is not evaluated, preventing a divide-by-zero error in the
    ///   expression `sum / Double(measurements.count)`. The result of the
    ///   operation is `false`.
    /// - When `measurements.count` is greater than zero, `p` evaluates to
    ///   `true` and `y` is evaluated. The result of evaluating `q` is the
    ///   result of the `∧` operation.
    ///
    /// | `p` | `q` | `p ∧ q` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `T`   |
    /// | `T` | `F` |   `F`   |
    /// | `F` | `T` |   `F`   |
    /// | `F` | `F` |   `F`   |
    ///
    /// - Parameters:
    ///   - p: The left-hand side of the operation.
    ///   - q: The right-hand side of the operation.
    ///
    /// - Returns: The logical AND of `p` and `q`.
    static func ∧ (p: Self, q: @autoclosure () throws -> Self) rethrows -> Self {
        try p && q()
    }
}
