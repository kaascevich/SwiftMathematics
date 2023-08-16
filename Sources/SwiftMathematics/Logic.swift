// Logic.swift
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

// MARK: - Logical NOT

prefix operator ¬

public extension Bool {
    /// Performs a logical NOT operation on a Boolean value.
    ///
    /// The logical NOT operator (`¬`) inverts a Boolean value. If the value is
    /// `true`, the result of the operation is `false`; if the value is `false`,
    /// the result is `true`.
    ///
    ///     var printedMessage = false
    ///
    ///     if ¬printedMessage {
    ///         print("You look nice today!")
    ///         printedMessage = true
    ///     }
    ///     // Prints "You look nice today!"
    ///
    /// |  Value  | Result  |
    /// |---------|---------|
    /// | `true`  | `false` |
    /// | `false` | `true`  |
    ///
    /// On US English keyboard layouts, the "`¬`" character can be entered using ⌥L.
    ///
    /// - Parameter value: The Boolean value to negate.
    ///
    /// - Returns: The inverse of `value`.
    static prefix func ¬ (value: Self) -> Self {
        !value
    }
}

// MARK: - Logical AND

infix operator ∧: LogicalConjunctionPrecedence

public extension Bool {
    /// Performs a logical AND operation on two Boolean values.
    ///
    /// The logical AND operator (`∧`) combines two Boolean values and returns
    /// `true` if both of the values are `true`. If either of the values is
    /// `false`, the operator returns `false`.
    ///
    /// This operator uses short-circuit evaluation: The left-hand side (`x`) is
    /// evaluated first, and the right-hand side (`y`) is evaluated only if `x`
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
    /// In this example, `x` tests whether `measurements.count` is greater than
    /// zero. Evaluation of the `∧` operator is one of the following:
    ///
    /// - When `measurements.count` is equal to zero, `x` evaluates to `false`
    ///   and `y` is not evaluated, preventing a divide-by-zero error in the
    ///   expression `sum / Double(measurements.count)`. The result of the
    ///   operation is `false`.
    /// - When `measurements.count` is greater than zero, `x` evaluates to
    ///   `true` and `y` is evaluated. The result of evaluating `y` is the
    ///   result of the `∧` operation.
    ///
    /// |     Values     | Result  |
    /// |----------------|---------|
    /// |  `true, true`  | `true`  |
    /// |  `true, false` | `false` |
    /// | `false, true`  | `false` |
    /// | `false, false` | `false` |
    ///
    /// - Parameters:
    ///   - x: The left-hand side of the operation.
    ///   - y: The right-hand side of the operation.
    ///
    /// - Returns: The logical AND of `x` and `y`.
    static func ∧ (x: Self, y: @autoclosure () throws -> Self) rethrows -> Self {
        try (x && y())
    }
}

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
    /// |     Values     | Result  |
    /// |----------------|---------|
    /// |  `true, true`  | `true`  |
    /// |  `true, false` | `true`  |
    /// | `false, true`  | `true`  |
    /// | `false, false` | `false` |
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
    /// |     Values     | Result  |
    /// |----------------|---------|
    /// |  `true, true`  | `false` |
    /// |  `true, false` | `true`  |
    /// | `false, true`  | `true`  |
    /// | `false, false` | `false` |
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
    /// |     Values     | Result  |
    /// |----------------|---------|
    /// |  `true, true`  | `false` |
    /// |  `true, false` | `true`  |
    /// | `false, true`  | `true`  |
    /// | `false, false` | `false` |
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
    /// |     Values     | Result  |
    /// |----------------|---------|
    /// |  `true, true`  | `false` |
    /// |  `true, false` | `true`  |
    /// | `false, true`  | `true`  |
    /// | `false, false` | `false` |
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
