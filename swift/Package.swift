// swift-tools-version:6.4
import PackageDescription

let package = Package(
  name: "elementary-web-app",
  platforms: [.macOS(.v26)],
  dependencies: [
    .package(
      url: "https://github.com/elementary-swift/elementary-ui.git",
      branch: "main"
    ),
    .package(url: "https://github.com/swiftwasm/JavaScriptKit.git", from: "0.58.0"),
  ],
  targets: [
    .executableTarget(
      name: "Snippets",
      dependencies: [
        .product(name: "ElementaryUI", package: "elementary-ui"),
        .product(name: "ElementaryWebComponents", package: "elementary-ui"),
      ],
      swiftSettings: [
        .swiftLanguageMode(.v5)
      ],
    )
  ]
)
