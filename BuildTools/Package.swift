// swift-tools-version:5.2
import PackageDescription

let package = Package(name: "BuildTools",
                      platforms: [.macOS(.v10_11)],
                      dependencies: [
                          .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.41.2"),
                          .package(url: "https://github.com/realm/SwiftLint.git", from: "0.39.2")
                      ],
                      targets: [.target(name: "BuildTools", path: "")])
