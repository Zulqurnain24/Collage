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
  
  var body: some View {
    VStack {
      if $viewModel.imageLoaders.isEmpty {
        ProgressView()
          .onAppear {
            viewModel.loadData()
          }
      } else {
        GridView(imageLoaders: viewModel.imageLoaders)
      }
    }.onAppear {
        viewModel.prefetchImages()
    }
  }
}
