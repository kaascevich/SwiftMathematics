// SwiftMathematicsSpec.swift
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
                expect(φ).to(equal(1.618_033_988_749_894_9))
            }
            it("is Euler's number") {
                expect(e).to(equal(2.718_281_828_459_045_1))
            }
            it("is pi") {
                expect(π).to(equal(3.141_592_653_589_793_1))
            }
            it("is tau, pi times 2") {
                expect(τ).to(equal(6.283_185_307_179_586_2))
            }
            it("is machine epsilon, the ulp of one") {
                expect(ε).to(equal(4.940_656_458_412_465_4e-324))
            }
        }
        
        describe("equality") {
            it("is not equal") {
                expect(2 ≠ 3).to(beTrue())
            }
            
            it("is almost equal") {
                expect(2 ≈ 2).to(beTrue())
                expect(2 ≈ 2.nextUp).to(beTrue())
                expect(2 ≈ 2.nextDown).to(beTrue())
                
                expect(2 ≈ 3).toNot(beTrue())
                expect(2 ≈ 2.nextUp.nextUp).toNot(beTrue())
                expect(2 ≈ 2.nextDown.nextDown).toNot(beTrue())
            }
            
            it("is not almost equal") {
                expect(2 ≉ 2).to(beFalse())
                expect(2 ≉ 2.nextUp).to(beFalse())
                expect(2 ≉ 2.nextDown).to(beFalse())
                
                expect(2 ≉ 3).toNot(beFalse())
                expect(2 ≉ 2.nextUp.nextUp).toNot(beFalse())
                expect(2 ≉ 2.nextDown.nextDown).toNot(beFalse())
            }
            
            it("is identical to") {
                /// A simple class to test identicality with.
                class SomeClass {
                    init() { }
                }
                
                let someObject = SomeClass()
                let someReference = someObject
                
                expect(someObject ≡ someReference).to(beTrue())
                expect(someObject ≢ someReference).to(beFalse())
                
                let someOtherObject = SomeClass()
                expect(someOtherObject ≡ someObject).toNot(beTrue())
                expect(someOtherObject ≢ someObject).toNot(beFalse())
            }
        }
        
        describe("roots") {
            it("is a power") {
                expect(3 ** 4).to(equal(81))
                expect(5.2 ** 3.5).to(equal(320.635_572_344_679_25))
                expect(π ** π).to(equal(36.462_159_607_207_902))
                
                var piToTheFifth = π
                piToTheFifth **= 5
                expect(piToTheFifth).to(equal(306.019_684_785_281_41))
            }
            
            it("is a square root") {
                expect(√2).to(equal(1.414_213_562_373_095_1))
                expect(√64).to(equal(8))
            }
            it("is a cube root") {
                expect(∛8).to(equal(2))
                expect(∛64).to(equal(4))
            }
            it("is a fourth root") {
                expect(∜81).to(equal(3))
            }
            
            it("is an arbitrary root") {
                expect(π√π).to(equal(1.439_619_495_847_590_7))
            }
        }
        
        describe("arithmetic") {
            it("is multiplication") {
                expect(6 × 9).to(equal(54))
                
                var someNumber = 6
                someNumber ×= 9
                expect(someNumber).to(equal(54))
            }
            
            describe("division") {
                it("is division") {
                    expect(7 ÷ 4).to(equal(1.75))
                    
                    var someNumber = 7.0
                    someNumber ÷= 4
                    expect(someNumber).to(equal(1.75))
                }
                
                it("is a percentage") {
                    expect(42%).to(equal(0.42))
                    expect(23.4%).to(equal(0.234))
                    expect(314%).to(equal(3.14))
                }
            }
            
            it("is plus or minus") {
                expect(±3) == (+3, -3)
                expect(∓3) == (-3, +3)
                
                // Nimble happens to have its own ± operator, and its signature happens
                // to be identical to that of our own ± operator (save for the labels
                // in the returned tuple, which don't count as part of the signature
                // anyway as far as the compiler is concerned). So we cannot test that
                // operator here. ∓ is fair game, though.
                expect(5 ∓ 3) == (2, 8)
            }
        }
    }
}
