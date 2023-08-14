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
    override class func spec() {
        describe("the ≤ and ≥ operators") {
            it("is the less-than-or-equal-to operator, ≤") {
                testOperator(≤, with: [
                    (x, x, result: true),
                    (x, y, result: true),
                    (y, x, result: false),
                    (y, y, result: true)
                ])
            }
            
            it("is the greater-than-or-equal-to operator, ≥") {
                testOperator(≥, with: [
                    (x, x, result: true),
                    (x, y, result: false),
                    (y, x, result: true),
                    (y, y, result: true)
                ])
            }
        }
    }
}

extension ComparisonSpec {
    static let x = 42, y = 69
    
    typealias Operator<Input, Output> = (Input, Input) -> Output
    typealias OperatorResult<Input, Output> = (Input, Input, result: Output)
    
    static func testOperator<Input, Output: Equatable>(
        _ closure: @escaping Operator<Input, Output>,
        with expectedResults: [OperatorResult<Input, Output>]
    ) {
        for (first, second, result) in expectedResults {
            expect(closure(first, second)) == result
        }
    }
}
