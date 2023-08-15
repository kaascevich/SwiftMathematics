// Functions.swift
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

precedencegroup FunctionCompositionPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: left
}

// MARK: - Operators

infix operator ∘ : FunctionCompositionPrecedence

// MARK: - Implementations

/// Returns the composition of two functions.
///
/// - Parameters:
///   - f: A function.
///   - g: Another function.
///
/// - Returns: The composition of the two functions.
public func ∘ <T>(f: @escaping (T) -> T, g: @escaping (T) -> T) -> (T) -> T {
    { x in f(g(x)) }
}
