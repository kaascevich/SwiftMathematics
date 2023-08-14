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
            it("works on decimal roots") {
                expect(√2.2).to(equal(1.483_239_697_419_132_6))
            }
            
            it("works on integer roots") {
                expect(√64).to(equal(8))
            }
        }
        
        describe("cube roots") {
            it("works on decimal roots") {
                expect(∛5.1).to(equal(1.721_300_620_726_315_9))
            }
            
            it("works on integer roots") {
                expect(∛8).to(equal(2))
            }
        }
        
        describe("fourth roots") {
            it("works on decimal roots") {
                expect(∜9.24).to(equal(1.743_484_106_814_321_6))
            }
            
            it("works on integer roots") {
                expect(∜81).to(equal(3))
            }
        }
        
        describe("arbitrary roots") {
            it("works for decimal indexes") {
                expect(π√π).to(equal(1.439_619_495_847_590_7))
            }
        }
    }
}
