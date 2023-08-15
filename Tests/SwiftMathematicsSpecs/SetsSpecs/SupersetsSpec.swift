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

final class SetConstantsSpec: QuickSpec {
    override class func spec() {
        describe("the strict superset operators, ⊃ and ⊅") {
            describe("the strict superset operator, ⊃") {
                it("returns true when the superset contains the set") {
                    expect([1, 2, 3, 4, 5] ⊃ [1, 2, 3]).to(beTrue())
                    expect([1, 2, 3, 4, 5] ⊃ [1, 3, 2]).to(beTrue())
                    expect([1, 2, 3, 4, 5] ⊃ [1, 8, 2]).to(beFalse())
                }
                
                it("returns false when the superset equals the set") {
                    expect([1, 2, 3, 4, 5] ⊃ [1, 2, 3, 4, 5]).to(beFalse())
                }
            }
            
            describe("the inverse strict superset operator, ⊅") {
                it("returns false when the superset contains the set") {
                    expect([1, 2, 3, 4, 5] ⊅ [1, 2, 3]).toNot(beTrue())
                    expect([1, 2, 3, 4, 5] ⊅ [1, 3, 2]).toNot(beTrue())
                    expect([1, 2, 3, 4, 5] ⊅ [1, 8, 2]).toNot(beFalse())
                }
                
                it("returns true when the superset equals the set") {
                    expect([1, 2, 3, 4, 5] ⊅ [1, 2, 3, 4, 5]).toNot(beFalse())
                }
            }
        }
        
        describe("the superset operators, ⊇ and ⊉") {
            describe("the superset operator, ⊇") {
                it("returns true when the superset contains the set") {
                    expect([1, 2, 3, 4, 5] ⊇ [1, 2, 3]).to(beTrue())
                    expect([1, 2, 3, 4, 5] ⊇ [1, 3, 2]).to(beTrue())
                    expect([1, 2, 3, 4, 5] ⊇ [1, 8, 2]).to(beFalse())
                }
                
                it("returns true when the superset equals the set") {
                    expect([1, 2, 3, 4, 5] ⊇ [1, 2, 3, 4, 5]).to(beTrue())
                }
            }
            
            describe("the inverse superset operator, ⊉") {
                it("returns false when the superset contains the set") {
                    expect([1, 2, 3, 4, 5] ⊉ [1, 2, 3]).toNot(beTrue())
                    expect([1, 2, 3, 4, 5] ⊉ [1, 3, 2]).toNot(beTrue())
                    expect([1, 2, 3, 4, 5] ⊉ [1, 8, 2]).toNot(beFalse())
                }
                
                it("returns false when the superset equals the set") {
                    expect([1, 2, 3, 4, 5] ⊉ [1, 2, 3, 4, 5]).toNot(beTrue())
                }
            }
        }
        
        describe("the superset-but-not-equal-to operator, ⊋") {
            it("returns true when the superset contains the set") {
                expect([1, 2, 3, 4, 5] ⊋ [1, 2, 3]).to(beTrue())
                expect([1, 2, 3, 4, 5] ⊋ [1, 3, 2]).to(beTrue())
                expect([1, 2, 3, 4, 5] ⊋ [1, 8, 2]).to(beFalse())
            }
            
            it("returns false when the superset equals the set") {
                expect([1, 2, 3, 4, 5] ⊋ [1, 2, 3, 4, 5]).toNot(beTrue())
            }
        }
    }
}
