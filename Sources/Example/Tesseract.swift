import CTesseract
import CLeptonica

enum TesseractError: Error {
    case apiInitFailed
    case imageLoadFailed
    case recognitionFailed
}

final class Tesseract {
    private let handle: OpaquePointer

    init(tessdataPath: String? = nil, language: String = "eng") throws {
        handle = TessBaseAPICreate()

        guard TessBaseAPIInit3(handle, tessdataPath, language) == 0 else {
            throw TesseractError.apiInitFailed
        }
    }

    func recognizeFile(at path: String) throws -> String? {
        var img = pixRead(path)
        guard img != nil else {
            throw TesseractError.imageLoadFailed
        }

        defer { pixDestroy(&img) }

        TessBaseAPISetImage2(handle, img)

        guard TessBaseAPIRecognize(handle, nil) == 0 else {
            throw TesseractError.recognitionFailed
        }

        guard let cText = TessBaseAPIGetUTF8Text(handle) else {
            return nil
        }

        defer { TessDeleteText(cText) }
        return String(cString: cText)
    }

    deinit {
        TessBaseAPIEnd(handle)
        TessBaseAPIDelete(handle)
    }
}
