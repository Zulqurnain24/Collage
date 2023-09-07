//
//  NetworkMonitorTests.swift
//  CollageTests
//
//  Created by Mohammad Zulqurnain on 07/09/2023.
//

import XCTest
@testable import Collage

class NetworkMonitorTests: XCTestCase {
    
    var sut: NetworkMonitor?
    
    override func setUp() {
        super.setUp()
        sut = NetworkMonitor()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testWhenStartMonitoringIsCalled_ThenIsConnectedIsTrue() {
        sut?.startMonitoring()
        XCTAssertTrue(sut?.isMonitoring ?? false)
    }
    
    func testWhenStopMonitoringIsCalled_ThenIsConnectedIsTrue() {
        sut?.stopMonitoring()
        XCTAssertFalse(sut?.isMonitoring ?? false)
    }
}
