// ComparisonSpec.swift
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

final class ComparisonSpec: QuickSpec {
    /// `x` is less than `y`.
    static let x = 42
    
    /// `y` is greater than `x`.
    static let y = 69
    
    override class func spec() {
        describe("the ≤ and ≥ operators") {
            it("is the less-than-or-equal-to operator, ≤") {
                expect(x ≤ x) == true
                expect(x ≤ y) == true
                expect(y ≤ x) == false
                expect(y ≤ y) == true
            }
            
            it("is the greater-than-or-equal-to operator, ≥") {
                expect(x ≥ x) == true
                expect(x ≥ y) == false
                expect(y ≥ x) == true
                expect(y ≥ y) == true
            }
        }
        
        describe("the ⋜ and ⋝ operators") {
            it("is the equal-to-or-less-than operator, ⋜") {
                expect(x ⋜ x) == true
                expect(x ⋜ y) == true
                expect(y ⋜ x) == false
                expect(y ⋜ y) == true
            }
            
            it("is the equal-to-or-greater-than operator, ⋝") {
                expect(x ⋝ x) == true
                expect(x ⋝ y) == false
                expect(y ⋝ x) == true
                expect(y ⋝ y) == true
            }
        }
        
        describe("the ≨ and ≩ operators") {
            it("is the less-than-but-not-equal-to operator, ≨") {
                expect(x ≨ x) == false
                expect(x ≨ y) == true
                expect(y ≨ x) == false
                expect(y ≨ y) == false
            }
            
            it("is the greater-than-but-not-equal-to operator, ≩") {
                expect(x ≩ x) == false
                expect(x ≩ y) == false
                expect(y ≩ x) == true
                expect(y ≩ y) == false
            }
        }
        
        describe("the ≮ and ≯ operators") {
            it("is the not-less-than operator, ≮") {
                expect(x ≮ x) == true
                expect(x ≮ y) == false
                expect(y ≮ x) == true
                expect(y ≮ y) == true
            }
            
            it("is the not-greater-than operator, ≯") {
                expect(x ≯ x) == true
                expect(x ≯ y) == true
                expect(y ≯ x) == false
                expect(y ≯ y) == true
            }
        }
        
        describe("the ≰ and ≱ operators") {
            it("is the not-less-than-or-equal-to operator, ≰") {
                expect(x ≰ x) == false
                expect(x ≰ y) == false
                expect(y ≰ x) == true
                expect(y ≰ y) == false
            }
            
            it("is the not-greater-than-or-equal-to operator, ≱") {
                expect(x ≱ x) == false
                expect(x ≱ y) == true
                expect(y ≱ x) == false
                expect(y ≱ y) == false
            }
        }
        
        describe("the ≶ and ≷ operators") {
            it("is the less-than-or-greater-than operator, ≶") {
                expect(x ≶ x) == false
                expect(x ≶ y) == true
                expect(y ≶ x) == true
                expect(y ≶ y) == false
            }
            
            it("is the greater-than-or-less-than operator, ≷") {
                expect(x ≷ x) == false
                expect(x ≷ y) == true
                expect(y ≷ x) == true
                expect(y ≷ y) == false
            }
        }
        
        describe("the ≸ and ≹ operators") {
            it("is the not-less-than-or-greater-than operator, ≸") {
                expect(x ≸ x) == true
                expect(x ≸ y) == false
                expect(y ≸ x) == false
                expect(y ≸ y) == true
            }
            
            it("is the not-greater-than-or-less-than operator, ≹") {
                expect(x ≹ x) == true
                expect(x ≹ y) == false
                expect(y ≹ x) == false
                expect(y ≹ y) == true
            }
        }
        
        describe("the ⋚ and ⋛ operators") {
            it("is the less-than-or-greater-than-or-equal-to operator, ⋚") {
                expect(x ⋚ x) == true
                expect(x ⋚ y) == true
                expect(y ⋚ x) == true
                expect(y ⋚ y) == true
            }
            
            it("is the greater-than-or-less-than-or-equal-to operator, ⋛") {
                expect(x ⋛ x) == true
                expect(x ⋛ y) == true
                expect(y ⋛ x) == true
                expect(y ⋛ y) == true
            }
        }
    }
}
