// LogicNOT.swift
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
    /// | `x` | `¬x` |
    /// |-----|:----:|
    /// | `T` | `F`  |
    /// | `F` | `T`  |
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
