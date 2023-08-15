// Sets.swift
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

// MARK: - Constants

/// The empty set.
///
/// The character representing this constant is not the actual empty set
/// symbol (`∅`), as Swift treats it as an operator character. The similar
/// "o with stroke" symbol (`ø`) is used instead. On US English keyboard
/// layouts, it can be entered using ⌥O.
public let ø: [any Numeric] = []

// MARK: - Membership

infix operator ∈: ComparisonPrecedence
infix operator ∉: ComparisonPrecedence
infix operator ∋: ComparisonPrecedence
infix operator ∌: ComparisonPrecedence

public extension Set {
    static func ∈ (element: Element, sequence: Self) -> Bool {
        sequence.contains(element)
    }
    
    static func ∉ (element: Element, sequence: Self) -> Bool {
        !(element ∈ sequence)
    }
    
    static func ∋ (sequence: Self, element: Element) -> Bool {
        sequence.contains(element)
    }
    
    static func ∌ (sequence: Self, element: Element) -> Bool {
        !(sequence ∋ element)
    }
}

// MARK: - Subsets

infix operator ⊂: ComparisonPrecedence
infix operator ⊄: ComparisonPrecedence
infix operator ⊆: ComparisonPrecedence
infix operator ⊈: ComparisonPrecedence
infix operator ⊊: ComparisonPrecedence

public extension Set {
    static func ⊂ (subset: Self, sequence: Self) -> Bool {
        subset.isStrictSubset(of: sequence)
    }
    
    static func ⊄ (subset: Self, sequence: Self) -> Bool {
        !(subset ⊂ sequence)
    }
    
    static func ⊆ (subset: Self, sequence: Self) -> Bool {
        subset.isSubset(of: sequence)
    }
    
    static func ⊈ (subset: Self, sequence: Self) -> Bool {
        !(subset ⊆ sequence)
    }
    
    static func ⊊ (subset: Self, sequence: Self) -> Bool {
        subset ⊂ sequence && subset != sequence
    }
}

// MARK: - Supersets

infix operator ⊃: ComparisonPrecedence
infix operator ⊅: ComparisonPrecedence
infix operator ⊇: ComparisonPrecedence
infix operator ⊉: ComparisonPrecedence
infix operator ⊋: ComparisonPrecedence

public extension Set {
    static func ⊃ (superset: Self, sequence: Self) -> Bool {
        superset.isStrictSuperset(of: sequence)
    }
    
    static func ⊅ (superset: Self, sequence: Self) -> Bool {
        !(superset ⊃ sequence)
    }
    
    static func ⊇ (superset: Self, sequence: Self) -> Bool {
        superset.isSuperset(of: sequence)
    }
    
    static func ⊉ (superset: Self, sequence: Self) -> Bool {
        !(superset ⊇ sequence)
    }
    
    static func ⊋ (superset: Self, sequence: Self) -> Bool {
        superset ⊃ sequence && superset != sequence
    }
}
