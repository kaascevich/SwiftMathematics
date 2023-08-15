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

// MARK: - Simple Sequence Reducing

public extension Sequence where Element: Numeric {
    /// Returns the sum of a sequence of numbers.
    ///
    /// - Parameter sequence: A sequence of numbers.
    ///
    /// - Returns: The summed sequence.
    static prefix func ∑ (sequence: Self) -> Element {
        sequence.reduce(.zero, +)
    }
    
    /// Returns the Cartesian product of a sequence of numbers.
    ///
    /// - Parameter sequence: A sequence of numbers.
    ///
    /// - Returns: The product of the sequence's elements.
    static prefix func ∏ (sequence: Self) -> Element {
        sequence.reduce(1, *)
    }
}

// MARK: - Complex Sequence Reducing

public typealias BoundedSequence<T: BinaryInteger> = (
    from: T,
    to: T,
    function: (T) -> T
) where T.Stride: SignedInteger

/// Returns the sum of a sequence of numbers between `bounds.from` and `bounds.to`.
///
/// - Parameter bounds: A tuple containing the start index, the end index, and the function generating the sequence.
///
/// - Returns: The sum of the generated sequence's elements.
///
/// - Precondition: `bounds.from <= bounds.to`.
public prefix func ∑ <T>(bounds: BoundedSequence<T>) -> T {
    precondition(bounds.from <= bounds.to, "start index of summation must be less than end index")
    
    let sequence = Array(bounds.from...bounds.to).map(bounds.function)
    return ∑sequence
}

/// Returns the Cartesian product of a sequence of numbers between `bounds.from` and `bounds.to`.
///
/// - Parameter bounds: A tuple containing the start index, the end index, and the function generating the sequence.
///
/// - Returns: The product of the generated sequence's elements.
///
/// - Precondition: `bounds.from <= bounds.to`.
public prefix func ∏ <T>(bounds: BoundedSequence<T>) -> T {
    precondition(bounds.from <= bounds.to, "start index of Cartesian product must be less than end index")
    
    let sequence = Array(bounds.from...bounds.to).map(bounds.function)
    return ∏sequence
}
