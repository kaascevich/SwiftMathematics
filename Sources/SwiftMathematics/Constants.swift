// Constants.swift
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

/// The mathematical constant pi (π), approximately equal to 3.14159.
///
/// When measuring an angle in radians, π is equivalent to a half-turn.
///
/// This value is rounded toward zero to keep user computations with angles
/// from inadvertently ending up in the wrong quadrant.
///
///     print(π)
///     // Prints "3.1415926535897931"
public let π = Double.pi

/// The mathematical constant tau (τ), approximately equal to 6.28319.
///
/// When measuring an angle in radians, τ is equivalent to a full turn, or
/// 2π.
///
/// This value is rounded toward zero to keep user computations with angles
/// from inadvertently ending up in the wrong quadrant.
///
///     print(τ)
///     // Prints "6.2831853071795862"
public let τ = Double.pi * 2

/// Euler's number (e), approximately equal to 2.71828.
public let e = M_E

/// The mathematical constant phi (φ), approximately equal to 1.61803.
///
/// Phi is also known as the golden ratio.
public let φ = (1 + √5) / 2

/// Positive infinity.
///
/// Infinity compares greater than all finite numbers and equal to other
/// infinite values.
///
///     let x = Double.greatestFiniteMagnitude
///     let y = x * 2
///     // y == infinity
///     // y > x
public let infinity = Double.infinity
