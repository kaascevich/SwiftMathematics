// FunctionsSpec.swift
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

final class FunctionsSpec: QuickSpec {
    override class func spec() {
        describe("function composition") {
            it("combines the two functions") {
                let f = { x in 2*x + 4 }
                let g = { x in 7*x - 1 }
                let h = f ∘ g
                
                expect(h(3)).to(equal(44))
            }
        }
    }
}
