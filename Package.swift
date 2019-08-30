// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SoundCloudKit",
    
    platforms: [
        .iOS(.v12)//, .macOS(.v10_12), .tvOS(.v9)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SoundCloudKit",
            targets: ["SoundCloudKit"]),
    ],
    dependencies: [
        
        .package(url: "https://github.com/PromiseKit/PMKAlamofire", from: "3.2.4"),
        .package(url: "https://github.com/SoundcloudUnofficialApp/ASWaveformPlayerView", from: "0.1.4"),
        //.package(url: "https://github.com/Quick/Quick", from: "2.1.0"),
    ],
    targets: [
        
        .target(
            name: "SoundCloudKit",
            dependencies: ["PMKAlamofire", "ASWaveformPlayerView"]),
        
        // .testTarget(
        // name: "SoundCloudKitTests",
        // dependencies: ["SoundCloudKit", "Quick"]),
    ],
    swiftLanguageVersions: [.v5]
)
