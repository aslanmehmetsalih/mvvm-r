// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPackageManager",
    platforms: [.iOS("11.0")],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MVVMRPackages",
            type: .dynamic,
            targets: ["MVVMRPackages"]),
        .library(
            name: "ApiDataProviderPackages",
            type: .dynamic,
            targets: ["ApiDataProviderPackages"]),
        .library(
            name: "UIComponentsPackages",
            type: .dynamic,
            targets: ["UIComponentsPackages"]),
        .library(
            name: "UtilitiesPackages",
            type: .dynamic,
            targets: ["UtilitiesPackages"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "TinyConstraints", url: "https://github.com/roberthein/TinyConstraints", from: "4.0.1"),
        .package(name: "Kingfisher", url: "https://github.com/onevcat/Kingfisher", from: "5.14.1"),
        .package(name: "Alamofire", url: "https://github.com/Alamofire/Alamofire", from: "5.2.1"),
        .package(name: "SwiftEntryKit", url: "https://github.com/huri000/SwiftEntryKit", from: "1.2.3"),
        .package(name: "NVActivityIndicatorView", url: "https://github.com/ninjaprox/NVActivityIndicatorView", from: "4.8.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MVVMRPackages",
            dependencies: [.product(name: "TinyConstraints", package: "TinyConstraints"),
                           .product(name: "Kingfisher", package: "Kingfisher"),
                           .product(name: "NVActivityIndicatorView", package: "NVActivityIndicatorView"),
                           .product(name: "SwiftEntryKit", package: "SwiftEntryKit")]),
        .target(
            name: "UtilitiesPackages",
            dependencies: [.product(name: "Kingfisher", package: "Kingfisher")]),
        .target(
            name: "ApiDataProviderPackages",
            dependencies: [.product(name: "Alamofire", package: "Alamofire")]),
        .target(
            name: "UIComponentsPackages",
            dependencies: [.product(name: "TinyConstraints", package: "TinyConstraints")]),
    ]
)
