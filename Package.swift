// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Base32",
  products: [
    .library(name: "Base32", targets: ["Base32"])
  ],
  targets: [
    .target(name: "libbase32"),
    .target(name: "Base32", dependencies: ["libbase32"]),
    .testTarget(name: "Base32Tests", dependencies: ["Base32"])
  ]
)
