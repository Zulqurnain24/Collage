//
//  ContentView.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 20/05/2023.
//

import Combine
import Foundation
import SwiftUI

struct CollageView: View {
    
    @ObservedObject var viewModel: CollageViewModel
    @ObservedObject var networkMonitor: NetworkMonitor
    
    var body: some View {
        NavigationView {
            
            switch networkMonitor.isConnected && networkMonitor.isMonitoring {
            case true:
                VStack(alignment: .leading) {
                    if $viewModel.imageLoaders.isEmpty {
                        ProgressView()
                            .onAppear {
                                viewModel.loadData()
                            }
                    } else {
                        if let imageLoaders = viewModel.imageLoaders as? [ImageLoader] {
                            GridView(imageLoaders: imageLoaders)
                        }
                    }
                }
                .navigationTitle(Constants.navigationTitle)
                .onAppear {
                    viewModel.prefetchImages()
                }
            case false:
                Text("Please connect to internet then try again")
            }
            
        }
    }
}
