//
//  CollageTests.swift
//  CollageTests
//
//  Created by Muhammad Zulqurnain on 20/05/2023.
//

import Foundation
import XCTest
@testable import Collage

class CollageViewModelTests: XCTestCase {
    var sut: CollageViewModel?
    
    override func setUp() {
        super.setUp()
        sut = CollageViewModel(imageLoaders: [],
                               networkManager: NetworkManagerMock())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testWhenLoadDataIsCalled_ThenImageLoadersGetsPopulated() {
        let expectation = XCTestExpectation(description: "Data loaded")
      
        sut?.loadData {
            if let imageLoaders = self.sut?.imageLoaders {
                XCTAssertTrue(!imageLoaders.isEmpty)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
    }
    
    func testWhenPrefetchImagesIsCalled_ThenImagesArePrefetched() {
        let imageLoader1: ImageLoaderMock = ImageLoaderMock()
        let imageLoader2: ImageLoaderMock = ImageLoaderMock()
        sut?.imageLoaders = [imageLoader1, imageLoader2]
        
        // Call the prefetchImages method
        sut?.prefetchImages()
     
        XCTAssertTrue(imageLoader1.isPrefetchImageCalled)
        XCTAssertTrue(imageLoader2.isPrefetchImageCalled)
    }
}
