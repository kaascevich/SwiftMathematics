// Powers.swift
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

import Foundation

precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
}

// MARK: - Operators

// Unfortunately, "^" is already taken by the standard library as the XOR
// operator.
infix operator ** : PowerPrecedence
infix operator **= : AssignmentPrecedence

// MARK: - Implementations

public extension ElementaryFunctions {
    static func ** (base: Self, exponent: Self) -> Self {
        pow(base, exponent)
    }
    
    static func **= (base: inout Self, exponent: Self) {
        base = pow(base, exponent)
    }
}
