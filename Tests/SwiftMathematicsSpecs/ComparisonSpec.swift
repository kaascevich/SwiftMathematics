// ComparisonSpec.swift
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

import Quick
import Nimble
@testable import SwiftMathematics

final class ComparisonSpec: QuickSpec {
    /// A number for testing.
    ///
    /// These relations are true:
    ///
    ///     x <= x
    ///     x >= x
    ///     x < y
    ///     x <= y
    ///
    /// These relations are false:
    ///
    ///     x > x
    ///     x < x
    ///     x > y
    ///     x >= y
    static let x = 42
    
    /// Another number for testing.
    ///
    /// These relations are true:
    ///
    ///     y > x
    ///     y >= x
    ///     y <= y
    ///     y >= y
    ///
    /// These relations are false:
    ///
    ///     y < x
    ///     y <= x
    ///     y < y
    ///     y > y
    static let y = 69
    
    static func testOperator<T, U: Equatable>(
        _ closure: @escaping (T, T) -> U,
        with expectedResults: [(T, T, U)]
    ) {
        for (first, second, result) in expectedResults {
            expect(closure(first, second)).to(equal(result))
        }
    }
    
    override class func spec() {
        describe("the ≤ and ≥ operators") {
            it("is the less-than-or-equal-to operator, ≤") {
                testOperator(≤, with: [
                    (x, x, true),
                    (x, y, true),
                    (y, x, false),
                    (y, y, true)
                ])
            }
            
            it("is the greater-than-or-equal-to operator, ≥") {
                testOperator(≥, with: [
                    (x, x, true),
                    (x, y, false),
                    (y, x, true),
                    (y, y, true)
                ])
            }
        }
    }
}
