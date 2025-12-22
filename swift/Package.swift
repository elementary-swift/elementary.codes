// swift-tools-version:6.2
import PackageDescription

let package = Package(
  name: "elementary-web-app",
  platforms: [.macOS(.v26)],
  dependencies: [
    .package(
      url: "https://github.com/elementary-swift/elementary-ui.git", branch: "feature/basic-unmount")
  ],
  targets: [
    .executableTarget(
      name: "Snippets",
      dependencies: [
        .product(name: "ElementaryUI", package: "elementary-ui")
      ],
      swiftSettings: [
        .swiftLanguageMode(.v5)
      ],
    )
  ]
)
