//
//  CollageApp.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 20/05/2023.
//

import SwiftUI

@main
struct CollageApp: App {
    var body: some Scene {
        WindowGroup {
            CollageView(viewModel: CollageViewModel(imageLoaders: [], networkManager: NetworkManager(), networkMonitor: NetworkMonitor()))
        }
    }
}
