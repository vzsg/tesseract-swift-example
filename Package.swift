// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tesseract",
    dependencies: [
    ],
    targets: [
        .target(name: "Example", dependencies: ["CTesseract", "CLeptonica"]),
        .systemLibrary(name: "CTesseract", pkgConfig: "tesseract"),
        .systemLibrary(name: "CLeptonica", pkgConfig: "lept"),
    ]
)
