// RootsSpec.swift
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

final class RootsSpec: QuickSpec {
    override class func spec() {
        describe("square roots") {
            it("works for decimal radicands") {
                expect(√2.2).to(equal(1.483_239_697_419_132_6))
            }
            
            it("works for integer radicands") {
                expect(√64).to(equal(8))
            }
            
            it("fails with negative radicands") {
                let squareRootOfNegativeFour = √(-4)
                expect(squareRootOfNegativeFour.isNaN).to(beTrue())
            }
        }
        
        describe("cube roots") {
            it("works for decimal radicands") {
                expect(∛5.1).to(equal(1.721_300_620_726_315_9))
            }
            
            it("works for integer radicands") {
                expect(∛8).to(equal(2))
            }
            
            it("works for negative radicands") {
                expect(∛(-8)).to(equal(-2))
            }
        }
        
        describe("fourth roots") {
            it("works for decimal radicands") {
                expect(∜9.24).to(equal(1.743_484_106_814_321_6))
            }
            
            it("works for integer radicands") {
                expect(∜81).to(equal(3))
            }
            
            it("fails with negative radicands") {
                let fourthRootOfNegativeSixteen = ∜(-16)
                expect(fourthRootOfNegativeSixteen.isNaN).to(beTrue())
            }
        }
        
        describe("arbitrary roots") {
            it("works for indexes of one") {
                expect(1√7).to(equal(7))
            }
            
            it("works for negative indexes") {
                expect((-2)√5).to(beCloseTo(0.447_213_595_5, within: 0.000_000_000_1))
            }
            
            it("works for decimal indexes") {
                expect(π√π).to(equal(1.439_619_495_847_590_7))
            }
            
            it("works for negative radicands with an odd index") {
                expect(5√(-32)).to(equal(-2))
            }
            
            it("fails with negative radicands with an even index") {
                let sixthRootOfNegative128 = 6√(-128)
                expect(sixthRootOfNegative128.isNaN).to(beTrue())
            }
        }
    }
}
