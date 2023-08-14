// PowersSpec.swift
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

final class PowersSpec: QuickSpec {
    override class func spec() {
        describe("the power operator, **") {
            it("works for integers") {
                expect(3 ** 4).to(equal(81))
            }
            
            it("works for decimals") {
                expect(5.2 ** 3.5).to(equal(320.635_572_344_679_25))
            }
            
            it("works for very specific decimals") {
                expect(π ** π).to(equal(36.462_159_607_207_902))
            }
        }
        
        describe("the raise-to-power-and-assign operator") {
            it("works for integers") {
                var elevenSquared = 11.0
                elevenSquared **= 2
                expect(elevenSquared).to(equal(121))
            }
            
            it("works for decimals") {
                var aDecimal = 3.8
                aDecimal **= 4.2
                expect(aDecimal).to(equal(272.327_253_310_062_99))
            }
            
            it("works for very specific decimals") {
                var piToTheE = π
                piToTheE **= e
                expect(piToTheE).to(equal(22.459_157_718_361_039_4))
            }
        }
    }
}
