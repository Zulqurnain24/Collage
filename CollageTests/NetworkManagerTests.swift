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
    
    func testWhenPerformRequestIsCalledWithCorrectURL_ThenDataIsNotNil() {
        let expectation = XCTestExpectation(description: "API Request")
        
        let url = URL(string: "https://pixabay.com/api/?key=24768596-fba1b9ab1f9e60f7ff62a253e&q=nature&image_type=photo&per_page=200")!
        
        sut?.performRequest(url: url) { (result: Result<PixabayResponse, Error>) in
            switch result {
            case .success(let data):
                // Verify data is correctly received and decoded
                XCTAssertNotNil(data)
                
            case .failure(_):
                assertionFailure()
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testWhenPerformRequestIsCalledWithIncorrectURL_Then400ErrorIsThrown() {
        let expectation = XCTestExpectation(description: "ErrorIsThrown")
        
        let url = URL(string: "https://pixabay.com/api/?key=&q=nature&image_type=photo&per_page=200")!
        
        sut?.performRequest(url: url) { (result: Result<PixabayResponse, Error>) in
            switch result {
            case .success(_):
                assertionFailure()
                
            case .failure(let error):
                // Verify error is correctly thrown
                XCTAssertNotNil(error.localizedDescription == "The operation couldn’t be completed. (HTTPError error 400.)")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testWhenPerformRequestIsCalledWithIncorrectURL_ThenDecodingErrorIsThrown() {
        let expectation = XCTestExpectation(description: "ErrorIsThrown")
        
        let url = URL(string: "https://pixabay.com/api/?key=24768596-fba1b9ab1f9e60f7ff62a253e&q=nature&image_type=photo&per_page=200")!
        
        sut?.performRequest(url: url) { (result: Result<ImageHit, Error>) in
            switch result {
            case .success(_):
                assertionFailure()
                
            case .failure(let error):
                // Verify error is correctly thrown
                XCTAssertNotNil(error.localizedDescription == "The data couldn’t be read because it is missing.")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
