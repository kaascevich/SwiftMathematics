// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Package.swift
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

import PackageDescription

let package = Package(
    name: "SwiftMathematics",
    platforms: [
        .iOS(.v17),
        .macCatalyst(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .visionOS(.v1),
        .watchOS(.v10)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftMathematics",
            targets: [
                "SwiftMathematics"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/realm/SwiftLint.git",
            .upToNextMajor(from: Version(0, 52, 4))
        ),
        .package(
            url: "https://github.com/apple/swift-numerics.git",
            .upToNextMajor(from: Version(1, 0, 2))
        ),
        .package(
            url: "https://github.com/Quick/Quick.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/Quick/Nimble.git",
            from: Version(12, 0, 0)
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftMathematics",
            dependencies: [
                .product(
                    name: "Numerics",
                    package: "swift-numerics"
                )
            ],
            plugins: [
                .plugin(
                    name: "SwiftLintPlugin",
                    package: "SwiftLint"
                )
            ]
        ),
        .testTarget(
            name: "SwiftMathematicsSpecs",
            dependencies: [
                .target(
                    name: "SwiftMathematics"
                ),
                .product(
                    name: "Quick",
                    package: "Quick"
                ),
                .product(
                    name: "Nimble",
                    package: "Nimble"
                )
            ],
            plugins: [
                .plugin(
                    name: "SwiftLintPlugin",
                    package: "SwiftLint"
                )
            ]
        )
    ]
)
