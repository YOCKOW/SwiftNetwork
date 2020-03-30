// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "NetworkGear",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(name: "SwiftNetworkGear", type:.dynamic, targets: ["NetworkGear", "HTTP"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url:"https://github.com/YOCKOW/SwiftBonaFideCharacterSet.git", from:"1.6.2"),
    .package(url:"https://github.com/YOCKOW/SwiftBootstring.git", from: "1.0.2"),
    .package(url:"https://github.com/YOCKOW/SwiftPublicSuffix.git", from: "1.1.0"),
    .package(url:"https://github.com/YOCKOW/SwiftRanges.git", from: "3.1.0"),
    .package(url:"https://github.com/YOCKOW/SwiftUnicodeSupplement.git", "0.7.1"..<"2.0.0"),
    .package(url:"https://github.com/YOCKOW/ySwiftExtensions.git", "0.8.1"..<"2.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(name: "NetworkGear", dependencies: ["SwiftBootstring", "SwiftPublicSuffix", "SwiftUnicodeSupplement"]),
    .target(name: "HTTP", dependencies: ["NetworkGear", "SwiftBonaFideCharacterSet", "ySwiftExtensions", "SwiftRanges"]),
    .target(name: "sockaddr_tests", dependencies: [], path:"Tests/sockaddr-tests"),
    .testTarget(name: "NetworkGearTests", dependencies: ["NetworkGear", "sockaddr_tests"]),
    .testTarget(name: "HTTPTests", dependencies: ["HTTP"]),
  ],
  swiftLanguageVersions: [.v4, .v4_2, .v5]
)
