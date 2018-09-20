func demo() throws {
    let tess = try Tesseract()
    let text = try tess.recognizeFile(at: "test.png")

    print(text ?? "<null>")
}

try demo()
