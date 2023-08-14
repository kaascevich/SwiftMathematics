// ConstantsSpec.swift
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

final class ConstantsSpec: QuickSpec {
    override class func spec() {
        describe("mathematical constants") {
            it("is the golden ratio, φ") {
                expect(φ).to(equal(1.618_033_988_749_894_9))
            }
            
            it("is Euler's number, e") {
                expect(e).to(equal(2.718_281_828_459_045_1))
            }
            
            it("is pi, π") {
                expect(π).to(equal(3.141_592_653_589_793_1))
            }
            
            it("is tau, pi times 2, τ") {
                expect(τ).to(equal(6.283_185_307_179_586_2))
            }
            
            it("is epsilon, a very small value, ε") {
                expect(ε).to(equal(4.940_656_458_412_465_4e-324))
            }
            
            it("is infinity") {
                expect(infinity).to(equal(.infinity))
            }
        }
    }
}

