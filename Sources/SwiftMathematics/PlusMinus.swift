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

// MARK: - Prefix Plus-Minus

prefix operator ±
prefix operator ∓

public extension SignedNumeric {
    /// Returns a tuple containing the operand and its opposite, respectively.
    ///
    /// On US English keyboard layouts, the "`±`" character can be entered using ⌥⇧= (option + shift + equal sign).
    @inlinable static prefix func ± (x: Self) -> (positive: Self, negative: Self) {
        (+x, -x)
    }
    
    /// Returns a tuple containing the operand's opposite and the operand itself, respectively.
    @inlinable static prefix func ∓ (x: Self) -> (negative: Self, positive: Self) {
        (-x, +x)
    }
}

// MARK: - Infix Plus-Minus

infix operator ± : AdditionPrecedence
infix operator ∓ : AdditionPrecedence

public extension SignedNumeric {
    /// Returns a tuple containing, respectively, the sum and difference of the operands.
    ///
    /// On US English keyboard layouts, the "`±`" character can be entered using ⌥⇧= (option + shift + equal sign).
    @inlinable static func ± (x: Self, y: Self) -> (added: Self, subtracted: Self) {
        (x + y, x - y)
    }
    
    /// Returns a tuple containing, respectively, the difference and sum of the operands.
    @inlinable static func ∓ (x: Self, y: Self) -> (subtracted: Self, added: Self) {
        (x - y, x + y)
    }
}
