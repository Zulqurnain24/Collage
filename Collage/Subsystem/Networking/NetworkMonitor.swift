//
//  NetworkMonitor.swift
//  Collage
//
//  Created by Mohammad Zulqurnain on 07/09/2023.
//

import Foundation
import Network

protocol NetworkMonitorDegelate {
    var isConnected: Bool { get set }
    var isMonitoring: Bool { get set }
    func startMonitoring()
    func stopMonitoring()
}

class NetworkMonitor: NetworkMonitorDegelate {
    private let monitor = NWPathMonitor()
    
    var isMonitoring = false
    
    @Published var isConnected = true
    
    init() {
        startMonitoring()
    }
    
    deinit {
        stopMonitoring()
    }
    
    func startMonitoring() {
        guard !isMonitoring else { return }
        
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        isMonitoring = true
    }
    
    func stopMonitoring() {
        monitor.cancel()
        isMonitoring = false
    }
}
