// PlusMinus.swift
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

prefix operator ±
prefix operator ∓

infix operator ± : AdditionPrecedence
infix operator ∓ : AdditionPrecedence

// MARK: - Implementations

public extension SignedNumeric {
    static prefix func ± (_ value: Self) -> (positive: Self, negative: Self) {
        (+value, -value)
    }
    static prefix func ∓ (_ value: Self) -> (negative: Self, positive: Self) {
        (-value, +value)
    }
    
    static func ± (_ lhs: Self, _ rhs: Self) -> (added: Self, subtracted: Self) {
        (lhs + rhs, lhs - rhs)
    }
    static func ∓ (_ lhs: Self, _ rhs: Self) -> (subtracted: Self, added: Self) {
        (lhs - rhs, lhs + rhs)
    }
}
