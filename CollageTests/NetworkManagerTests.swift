//
//  NetworkManagerTests.swift
//  CollageTests
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import XCTest
@testable import Collage

class NetworkManagerTests: XCTestCase {
  
  var sut: NetworkManager?
  
  override func setUp() {
    super.setUp()
    sut = NetworkManager()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testPerformRequest() {
    let expectation = XCTestExpectation(description: "API Request")
    
    let url = URL(string: "https://pixabay.com/api/?key=24768596-fba1b9ab1f9e60f7ff62a253e&q=nature&image_type=photo&per_page=200")!
    
    sut?.performRequest(url: url) { (result: Result<PixabayResponse, Error>) in
      switch result {
      case .success(let data):
        // Verify data is correctly received and decoded
        XCTAssertNotNil(data)
        
      case .failure(let error):
        XCTFail("API Request failed with error: \(error.localizedDescription)")
      }
      
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 5.0)
  }
}
