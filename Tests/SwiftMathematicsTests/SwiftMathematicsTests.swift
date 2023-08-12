// SwiftMathematicsTests.swift
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

final class SwiftMathematicsSpec: QuickSpec {
    override class func spec() {
        describe("constants") {
            it("is the golden ratio") {
                expect(φ).to(beCloseTo(1.618_033_988_749_894))
            }
            it("is Euler's number") {
                expect(e).to(beCloseTo(2.718_281_828_459_045))
            }
            it("is pi") {
                expect(π).to(beCloseTo(3.141_592_653_589_793))
            }
            it("is tau, pi times 2") {
                expect(τ).to(beCloseTo(6.283_185_307_179_586))
            }
            it("is machine epsilon, the ulp of one") {
                expect(ε).to(beCloseTo(2.220_446_049_250e-16))
            }
        }
        
        describe("equality") {
            it("is not equal") {
                expect(2 ≠ 3).to(beTrue())
            }
        }
    }
}
