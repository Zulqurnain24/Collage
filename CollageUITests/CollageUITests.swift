//
//  CollageUITests.swift
//  CollageUITests
//
//  Created by Mohammad Zulqurnain on 07/09/2023.
//

import XCTest

final class CollageUITests: XCTestCase {

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }
    
    func testCollageBrowsing() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().scrollViews.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .image).element(boundBy: 13).swipeUp()
        
        
    }
}
