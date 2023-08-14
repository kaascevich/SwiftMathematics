// Equality.swift
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

infix operator ≠ : ComparisonPrecedence

infix operator ≈ : ComparisonPrecedence
infix operator ≉ : ComparisonPrecedence

infix operator ≡ : ComparisonPrecedence
infix operator ≢ : ComparisonPrecedence

// MARK: - Implementations

public extension Equatable {
    /// Returns a Boolean value indicating whether two values are not equal.
    ///
    /// Inequality is the inverse of equality. For any values `x` and `y`, `x ≠ y`
    /// implies that `x == y` is `false`.
    ///
    /// This is the default implementation of the not-equal-to operator (`≠`)
    /// for any type that conforms to `Equatable`.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    ///
    /// - Returns: Whether the values are not equal.
    static func ≠ (x: Self, y: Self) -> Bool { x != y }
}

public extension FloatingPoint {
    /// Returns a Boolean value indicating whether the left-hand value
    /// approximately equals the right-hand value.
    ///
    /// This operator's tolerance is `Self.ulpOfOne.squareRoot()`.
    /// `x.nextDown` and `x.nextUp`.
    ///
    /// - Returns: Whether the values are approximately equal.
    static func ≈ (x: Self, y: Self) -> Bool {
        x.isApproximatelyEqual(to: y)
    }
    
    /// Returns a Boolean value indicating whether the left-hand value
    /// does not approximately equal the right-hand value.
    ///
    /// This operator's tolerance is `Self.ulpOfOne.squareRoot()`.
    ///
    /// - Parameters:
    ///   - x: A value to compare.
    ///   - y: Another value to compare.
    ///
    /// - Returns: Whether the values are not approximately equal.
    static func ≉ (x: Self, y: Self) -> Bool {
        !x.isApproximatelyEqual(to: y)
    }
}

/// Returns a Boolean value indicating whether two references point to the same
/// object instance.
///
/// This operator tests whether two instances have the same identity, not the
/// same value. For value equality, see the equal-to operator (`==`) and the
/// `Equatable` protocol.
///
/// The following example defines an `IntegerRef` type, an integer type with
/// reference semantics.
///
///     class IntegerRef: Equatable {
///         let value: Int
///         init(_ value: Int) {
///             self.value = value
///         }
///     }
///
///     func == (lhs: IntegerRef, rhs: IntegerRef) -> Bool {
///         return lhs.value == rhs.value
///     }
///
/// Because `IntegerRef` is a class, its instances can be compared using the
/// identical-to operator (`≡`). In addition, because `IntegerRef` conforms
/// to the `Equatable` protocol, instances can also be compared using the
/// equal-to operator (`==`).
///
///     let a = IntegerRef(10)
///     let b = a
///     print(a == b)
///     // Prints "true"
///     print(a ≡ b)
///     // Prints "true"
///
/// The identical-to operator (`≡`) returns `false` when comparing two
/// references to different object instances, even if the two instances have
/// the same value.
///
///     let c = IntegerRef(10)
///     print(a == c)
///     // Prints "true"
///     print(a ≡ c)
///     // Prints "false"
///
/// - Parameters:
///   - x: A reference to compare.
///   - y: Another reference to compare.
///
/// - Returns: Whether the references point to the same instance.
public func ≡ (x: AnyObject?, y: AnyObject?) -> Bool { x === y }

/// Returns a Boolean value indicating whether two references point to
/// different object instances.
///
/// This operator tests whether two instances have different identities, not
/// different values. For value inequality, see the not-equal-to operator
/// (`!=`) and the `Equatable` protocol.
///
/// - Parameters:
///   - x: A reference to compare.
///   - y: Another reference to compare.
///
/// - Returns: Whether the references do not point to the same instance.
public func ≢ (x: AnyObject?, y: AnyObject?) -> Bool { x !== y }
