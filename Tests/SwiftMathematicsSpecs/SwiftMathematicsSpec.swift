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
            
            it("is almost equal") {
                expect(2 ≈ 2).to(beTrue())
                expect(2 ≈ 2.nextUp).to(beTrue())
                expect(2 ≈ 2.nextDown).to(beTrue())
                
                expect(2 ≈ 3).to(beFalse())
                expect(2 ≈ 2.nextUp.nextUp).to(beFalse())
                expect(2 ≈ 2.nextDown.nextDown).to(beFalse())
            }
            
            it("is not almost equal") {
                expect(2 ≉ 2).to(beFalse())
                expect(2 ≉ 2.nextUp).to(beFalse())
                expect(2 ≉ 2.nextDown).to(beFalse())
                
                expect(2 ≉ 3).to(beTrue())
                expect(2 ≉ 2.nextUp.nextUp).to(beTrue())
                expect(2 ≉ 2.nextDown.nextDown).to(beTrue())
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
                expect(someOtherObject ≡ someObject).to(beFalse())
                expect(someOtherObject ≢ someObject).to(beTrue())
            }
        }
        
        describe("roots") {
            it("is a power") {
                expect(3 ** 4).to(equal(81))
                expect(5.2 ** 3.5).to(beCloseTo(320.6355723447))
                expect(π ** π).to(beCloseTo(36.4621596072))
                
                var piToTheFifth = π
                piToTheFifth **= 5
                expect(piToTheFifth).to(beCloseTo(306.01968478528))
            }
            
            it("is a square root") {
                expect(√2).to(beCloseTo(1.414_213_562_373_095))
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
                expect(π√π).to(beCloseTo(1.439_619_495_85))
            }
        }
        
        describe("arithmetic") {
            it("is multiplication") {
                expect(6 × 9).to(equal(54))
                
                var notTheAnswer = 6
                notTheAnswer ×= 9
                expect(notTheAnswer).to(equal(54))
            }
            
            describe("division") {
                it("is division") {
                    expect(7 ÷ 4).to(equal(1.75))
                    
                    var aRandomNumber = 7.0
                    aRandomNumber ÷= 4
                    expect(aRandomNumber).to(equal(1.75))
                }
                it("divides into something else evenly") {
                    
                }
            }
            
            it("is plus or minus") {
                expect(±3) == (3, -3)
                expect(∓3) == (-3, 3)
                
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
