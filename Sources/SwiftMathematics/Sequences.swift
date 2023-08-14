// Sequences.swift
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

prefix operator ∑

prefix operator ∏

// MARK: - Implementations

/// Returns the sum of a sequence of numbers.
///
/// - Parameter sequence: A sequence of numbers.
///
/// - Returns: The summed sequence.
public prefix func ∑ <T: Sequence>(sequence: T) -> T.Element where T.Element: AdditiveArithmetic {
    sequence.reduce(.zero, +)
}


/// Returns the Cartesian product of a sequence of numbers.
///
/// - Parameter sequence: A sequence of numbers.
///
/// - Returns: The product of the sequence's elements.
public prefix func ∏ <T: Sequence>(sequence: T) -> T.Element where T.Element: Numeric {
    sequence.reduce(1, *)
}
