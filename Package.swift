// swift-tools-version:5.3

//
//  Package.Swift
//  Starscream
//
//  Created by Dalton Cherry on 5/16/15.
//  Copyright (c) 2014-2016 Dalton Cherry.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import PackageDescription

let package = Package(
        name: "Starscream",
        products: [
            .library(name: "Starscream", targets: ["Starscream"])
        ],
        dependencies: [
            .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" ..< "4.0.0"),
            //.package(url: "https://github.com/swiftlang/swift-corelibs-foundation", .branch("release/6.0.2")),
        ],
        targets: [
            .target(name: "Starscream",
                    dependencies: [
                        "zlib",
                        .product(name: "Crypto", package: "swift-crypto"),
                        //.product(name: "Foundation", package: "swift-corelibs-foundation")
                    ],
                    path: "Sources",
                    resources: [.copy("PrivacyInfo.xcprivacy")]),
            .target(
                name: "zlib",
                path: "CNIOExtrasZlib",
                linkerSettings: [
                    .linkedLibrary("z")
                ]
            )
        ]
)
