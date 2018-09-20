# Interfacing Tesseract with Swift 4.2

This repo contains system library targets to make Leptonica/Tesseract available to Swift, and a direct port of the Tesseract C API example.

## Installing dependencies

1. The demo requires Swift 4.2 for the brand new system library targets feature. You must have Xcode 10 or the 4.2 toolchain installed and set as active.

1. Tesseract and pkg-config must to be installed before building the example, or generating an Xcode project.

    ```bash
    $ brew install pkg-config tesseract    # macOS
    
    --- OR ---

    $ sudo apt-get install pkg-config libtesseract-dev    # Ubuntu
    ```

## Running the example

Call `swift run` to build and run the example. You should see the text of the included `test.png` recognized.

If you want to run the example in Xcode, make sure to change the Working Directory in Edit Scheme -> Run -> Options to the project folder, otherwise the `test.png` file will not be found.
