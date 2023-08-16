// EqualitySpec.swift
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

final class EqualitySpec: QuickSpec {
    override class func spec() {
        describe("the not-equal-to operator, ≠") {
            it("is false if they are equal") {
                expect(2 ≠ 2).to(beFalse())
            }
            
            it("is true if they are not equal") {
                expect(2 ≠ 3).to(beTrue())
            }
        }
        
        describe("the almost-equal operators, ≈ and ≉") {
            context("when the operands are almost equal") {
                describe("the almost-equal operator, ≈") {
                    it("is true when they are equal") {
                        expect(2 ≈ 2).to(beTrue())
                    }
                    
                    it("is true when they are slightly different") {
                        expect(2 ≈ 2.000000005).to(beTrue())
                        expect(2 ≈ 1.999999995).to(beTrue())
                    }
                }
                describe("the not-almost-equal operator, ≉") {
                    it("is false when they are equal") {
                        expect(2 ≉ 2).to(beFalse())
                    }
                    
                    it("is false when they are slightly different") {
                        expect(2 ≈ 2.00005).to(beFalse())
                        expect(2 ≈ 1.99995).to(beFalse())
                    }
                }
            }
        }
    }
}
