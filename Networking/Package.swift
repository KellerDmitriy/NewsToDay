// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Networking", targets: ["NetworkManager"]),
    ],
    targets: [
        .target(name: "NetworkManager"),
    ]
)
