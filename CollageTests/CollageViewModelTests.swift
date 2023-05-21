//
//  CollageTests.swift
//  CollageTests
//
//  Created by Muhammad Zulqurnain on 20/05/2023.
//

import XCTest
@testable import Collage

class CollageViewModelTests: XCTestCase {
  var sut: CollageViewModel?
  
  override func setUp() {
    super.setUp()
    sut = CollageViewModel(imageLoaders: [ImageLoader(imageURL: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_150.jpg")],
                           networkManager: NetworkManager())
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testLoadData() {
    let expectation = XCTestExpectation(description: "Data loaded")
    
    sut?.loadData {
      if let imageLoaders = self.sut?.imageLoaders {
        XCTAssertTrue(!imageLoaders.isEmpty)
      }
      
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 5.0)
  }
}
