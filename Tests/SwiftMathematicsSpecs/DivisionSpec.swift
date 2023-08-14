// DivisionSpec.swift
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

final class DivisionSpec: QuickSpec {
    override class func spec() {
        describe("division") {
            it("divides two numbers") {
                expect(7 ÷ 4).to(equal(1.75))
            }
            
            it("divides and assigns") {
                var someNumber = 7.0
                someNumber ÷= 4
                expect(someNumber).to(equal(1.75))
            }
        }
        
        describe("percentages") {
            it("works for integers") {
                expect(42%).to(equal(0.42))
            }
            
            it("works for decimals") {
                expect(23.4%).to(beCloseTo(0.234, within: 0.001))
            }
            
            it("works for integers greater than 100") {
                expect(314%).to(equal(3.14))
            }
        }
    }
}
