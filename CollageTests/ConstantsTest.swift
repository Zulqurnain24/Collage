//
//  ConstantsTest.swift
//  CollageTests
//
//  Created by Mohammad Zulqurnain on 08/09/2023.
//

import XCTest

@testable import Collage

final class ConstantsTest: XCTestCase {
    
    func testConstants() {
        XCTAssertEqual(PixabayAPI.baseURL, "https://pixabay.com/api/")
        XCTAssertEqual(PixabayAPI.key, "24768596-fba1b9ab1f9e60f7ff62a253e")
        XCTAssertEqual(PixabayAPI.query, "nature")
        XCTAssertEqual(PixabayAPI.imageType, "photo")
        XCTAssertEqual(PixabayAPI.perPage, "200")
        XCTAssertEqual(PixabayAPI.apiURLString, "https://pixabay.com/api/?key=24768596-fba1b9ab1f9e60f7ff62a253e&q=nature&image_type=photo&per_page=200")
        XCTAssertEqual(Constants.gridMinimumDimension, 100)
        XCTAssertEqual(Constants.spacing, 16)
        XCTAssertEqual(Constants.imageDimension, 100)
        XCTAssertEqual(Constants.cornerRadius, 5)
        XCTAssertEqual(Constants.okStatusRequestCode, 200)
        XCTAssertEqual(Constants.multipleChoicesRequestCode, 300)
        XCTAssertEqual(Constants.navigationTitle, "~Pixabay Collage~")
        XCTAssertEqual(Constants.apiRequestFailed, "API Request failed with error:")
        XCTAssertEqual(Constants.offlineModeMessage, "Please connect to internet then try again")
    }
}
