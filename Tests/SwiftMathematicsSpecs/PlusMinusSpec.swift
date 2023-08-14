// PlusMinusSpec.swift
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

final class PlusMinusSpec: QuickSpec {
    override class func spec() {
        it("returns a positive and a negative") {
            expect(±3) == (+3, -3)
        }
        
        it("returns a negative and a positive") {
            expect(∓3) == (-3, +3)
        }
        
        it("returns a subtraction and an addition") {
            // Nimble happens to have its own ± operator, and its signature happens
            // to be identical to that of our own ± operator (save for the labels
            // in the returned tuple, which don't count as part of the signature
            // anyway as far as the compiler is concerned). So we cannot test that
            // operator here. ∓ is fair game, though.
            expect(5 ∓ 3) == (2, 8)
        }
    }
}
