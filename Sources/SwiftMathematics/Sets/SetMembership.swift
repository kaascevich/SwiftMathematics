// SetMembership.swift
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

infix operator ∈: ComparisonPrecedence
infix operator ∉: ComparisonPrecedence

infix operator ∋: ComparisonPrecedence
infix operator ∌: ComparisonPrecedence

// MARK: - Implementations

public extension Set {
    /// Returns a Boolean value that indicates whether the given element exists
    /// in the given set.
    ///
    /// This example uses the `∈` operator to test whether an integer is a member
    /// of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7]
    ///     let x = 5
    ///     if x ∈ primes {
    ///         print("\(x) is prime!")
    ///     } else {
    ///         print("\(x). Not prime.")
    ///     }
    ///     // Prints "5 is prime!"
    ///
    /// - Parameters:
    ///    - element: An element to look for in the set.
    ///    - set: A set.
    ///
    /// - Returns: `true` if `element` exists in the set; otherwise, `false`.
    ///
    /// - Complexity: O(1)
    @inlinable static func ∈ (element: Element, set: Self) -> Bool {
        set.contains(element)
    }
    
    /// Returns a Boolean value that indicates whether the given element does not
    /// exist in the given set.
    ///
    /// This example uses the `∉` operator to test whether an integer is a member
    /// of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7]
    ///     let x = 4
    ///     if x ∉ primes {
    ///         print("\(x). Not prime.")
    ///     } else {
    ///         print("\(x) is prime!")
    ///     }
    ///     // Prints "5. Not prime."
    ///
    /// - Parameters:
    ///    - element: An element to look for in the set.
    ///    - set: A set.
    ///
    /// - Returns: `true` if `element` does not exist in the set; otherwise, `false`.
    ///
    /// - Complexity: O(1)
    @inlinable static func ∉ (element: Element, set: Self) -> Bool {
        !(element ∈ set)
    }
    
    /// Returns a Boolean value that indicates whether the given element exists
    /// in the given set.
    ///
    /// This example uses the `∋` operator to test whether an integer is a member
    /// of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7]
    ///     let x = 5
    ///     if primes ∋ x {
    ///         print("\(x) is prime!")
    ///     } else {
    ///         print("\(x). Not prime.")
    ///     }
    ///     // Prints "5 is prime!"
    ///
    /// - Parameters:
    ///    - set: A set.
    ///    - element: An element to look for in the set.
    ///
    /// - Returns: `true` if `element` exists in the set; otherwise, `false`.
    ///
    /// - Complexity: O(1)
    @inlinable static func ∋ (set: Self, element: Element) -> Bool {
        set.contains(element)
    }
    
    /// Returns a Boolean value that indicates whether the given element does not
    /// exist in the given set.
    ///
    /// This example uses the `∌` operator to test whether an integer is a member
    /// of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7]
    ///     let x = 4
    ///     if primes ∌ x {
    ///         print("\(x). Not prime.")
    ///     } else {
    ///         print("\(x) is prime!")
    ///     }
    ///     // Prints "5. Not prime."
    ///
    /// - Parameters:
    ///    - set: A set.
    ///    - element: An element to look for in the set.
    ///
    /// - Returns: `true` if `element` does not exist in the set; otherwise, `false`.
    ///
    /// - Complexity: O(1)
    @inlinable static func ∌ (set: Self, element: Element) -> Bool {
        !(set ∋ element)
    }
}
