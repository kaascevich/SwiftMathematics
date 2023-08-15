// SequencesSpec.swift
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

final class SequencesSpec: QuickSpec {
    override class func spec() {
        describe("the summation operator, ∑") {
            it("returns the sum of its input") {
                let sequence = [1, 2, 3, 4, 5]
                expect(∑sequence).to(equal(15))
            }
            
            it("sums the results of functions through a range of inputs") {
                let f = { (x: Int) in x * x }
                let sum = ∑(3, 6, f)
                expect(sum).to(equal(86))
            }
            
            it("fails when the lower bound isn't less than the upper bound") {
                let f = { (x: Int) in x * x }
                expect(∑(6, 3, f)).to(throwAssertion())
            }
        }
        
        describe("the Cartesian product operator, ∏") {
            it("returns the Cartesian product of its input") {
                let sequence = [1, 2, 3, 4, 5]
                expect(∏sequence).to(equal(120))
            }
            
            it("multiplies the results of functions through a range of inputs") {
                let f = { (x: Int) in x + x }
                let product = ∏(3, 6, f)
                expect(product).to(equal(5760))
            }
            
            it("fails when the lower bound isn't less than the upper bound") {
                let f = { (x: Int) in x + x }
                expect(∏(6, 3, f)).to(throwAssertion())
            }
        }
    }
}
