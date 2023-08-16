// LogicImplication.swift
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

// MARK: - Material Implication

precedencegroup MaterialImplicationPrecedence {
    lowerThan: TernaryPrecedence
    higherThan: AssignmentPrecedence
    associativity: right
}

infix operator → : MaterialImplicationPrecedence

public extension Bool {
    /// The material implication operator.
    ///
    /// The material implication operator (`→`) takes two Boolean values and
    /// returns `false` if the first value is `true` and the second is `false`.
    /// Otherwise, it returns `true`.
    ///
    /// This operator uses short-circuit evaluation: The left-hand side (`p`) is
    /// evaluated first, and the right-hand side (`q`) is evaluated only if `p`
    /// evaluates to `true`.
    ///
    /// | `p` | `q` | `p → q` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `T`   |
    /// | `T` | `F` |   `F`   |
    /// | `F` | `T` |   `T`   |
    /// | `F` | `F` |   `T`   |
    ///
    /// - Parameters:
    ///   - p: The left-hand side of the operation.
    ///   - q: The right-hand side of the operation.
    ///
    /// - Returns: If `p` is `true` and `q` is `false`, then `false`; otherwise,
    ///   `true`.
    static func → (p: Self, q: @autoclosure () throws -> Self) rethrows -> Self {
        try ¬(p ∧ ¬q())
    }
}

// MARK: - Material Equivalence

infix operator ↔︎ : MaterialImplicationPrecedence
infix operator ≡ : MaterialImplicationPrecedence

public extension Bool {
    /// The material equivalence operator.
    ///
    /// The material equivalence operator (`↔︎`) takes two Boolean values and
    /// returns `true` if both of them are `true` or both are `false`. Otherwise,
    /// it returns `false`.
    ///
    /// | `p` | `q` | `p ↔︎ q` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `T`   |
    /// | `T` | `F` |   `F`   |
    /// | `F` | `T` |   `F`   |
    /// | `F` | `F` |   `T`   |
    ///
    /// - Parameters:
    ///   - p: The left-hand side of the operation.
    ///   - q: The right-hand side of the operation.
    ///
    /// - Returns: If both `p` and `q` are `true`, or if both are `false`, then
    ///  `true`; otherwise, `false`.
    static func ↔︎ (p: Self, q: Self) -> Self {
        p == q
    }
    
    /// The material equivalence operator.
    ///
    /// The material equivalence operator (`≡`) takes two Boolean values and
    /// returns `true` if both of them are `true` or both are `false`. Otherwise,
    /// it returns `false`.
    ///
    /// | `p` | `q` | `p ≡ q` |
    /// |-----|-----|:-------:|
    /// | `T` | `T` |   `T`   |
    /// | `T` | `F` |   `F`   |
    /// | `F` | `T` |   `F`   |
    /// | `F` | `F` |   `T`   |
    ///
    /// - Parameters:
    ///   - p: The left-hand side of the operation.
    ///   - q: The right-hand side of the operation.
    ///
    /// - Returns: If both `p` and `q` are `true`, or if both are `false`, then
    ///  `true`; otherwise, `false`.
    static func ≡ (p: Self, q: Self) -> Self {
        p ↔︎ q
    }
}
