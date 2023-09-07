//
//  MockNetworkManager.swift
//  Collage
//
//  Created by Mohammad Zulqurnain on 07/09/2023.
//

import Foundation

class NetworkMonitorMock: NetworkMonitorDegelate {
    var isConnected: Bool = true
    
    var isMonitoring: Bool = false
    
    var startMonitoringCalled = false
    var stopMonitoringCalled = false

    func startMonitoring() {
        startMonitoringCalled = true
        isMonitoring = true
    }

    func stopMonitoring() {
        stopMonitoringCalled = true
        isMonitoring = false
    }
}
