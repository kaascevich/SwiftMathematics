// SetOperationsSpec.swift
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

final class SetOperationsSpec: QuickSpec {
    override class func spec() {
        describe("the intersection operator, ∩") {
            it("returns the intersection of two sets") {
                let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
                let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
                
                expect(employees ∩ neighbors).to(contain("Bethany", "Eric"))
            }
        }
        
        describe("the union operator, ∪") {
            it("returns the union of two sets") {
                let attendees: Set = ["Alicia", "Bethany", "Diana"]
                let visitors: Set = ["Marcia", "Nathaniel"]
                
                expect(attendees ∪ visitors).to(contain("Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"))
            }
            
            it("keeps existing elements and removes duplicates") {
                let initialIndices = Set(0..<5)
                let expandedIndices = initialIndices ∪ [2, 3, 6, 6, 7, 7]
                
                expect(expandedIndices).to(contain(2, 4, 6, 7, 0, 1, 3))
            }
        }
        
        describe("the symmetric difference operator, ∆") {
            it("returns elements that are in one set, but not both") {
                let employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
                let neighbors: Set = ["Bethany", "Eric", "Forlani"]
                expect(employees ∆ neighbors).to(contain("Diana", "Forlani", "Alicia"))
            }
        }
        
        describe("the set subtraction operators, ∖ and -") {
            it("returns elements that are in the first set but not in the second") {
                let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
                let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
                
                expect(employees ∖ neighbors).to(contain("Chris", "Diana", "Alicia"))
                expect(employees - neighbors).to(contain("Chris", "Diana", "Alicia"))
            }
        }
    }
}