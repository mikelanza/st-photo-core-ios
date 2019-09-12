// swift-tools-version:5.0
//
//  STPhotoCore.swift
//  STPhotoCore
//
//  Created by Streetography on 01/04/19.
//  Copyright © 2019 Streetography. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "STPhotoCore",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "STPhotoCore",
            targets: ["STPhotoCore"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "STPhotoCore",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "STPhotoCoreTests",
            dependencies: ["STPhotoCore"],
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
