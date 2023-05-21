//
//  ImageLoaderTests.swift
//  CollageTests
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import XCTest
@testable import Collage

class ImageLoaderTests: XCTestCase {
  
  var sut: ImageLoader?
  
  override func setUp() {
    super.setUp()
    sut = ImageLoader(imageURL: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_150.jpg")
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testImageLoader() {
    let expectation = XCTestExpectation(description: "Image Loaded")
    
    sut?.loadImage {
      XCTAssertNotNil(self.sut?.image)
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 5.0)
  }
}
