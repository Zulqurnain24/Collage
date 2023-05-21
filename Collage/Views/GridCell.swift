//
//  GridCell.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import SwiftUI

struct GridCell: View {
  @ObservedObject private var imageLoader: ImageLoader
  
  init(imageLoader: ImageLoader) {
    self.imageLoader = imageLoader
  }
  
  var body: some View {
    VStack {
      Group {
        if let image = imageLoader.image {
          Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
        } else {
          // Placeholder or loading view
          Color.gray
            .frame(width: 100, height: 100)
        }
      }
    }
    .onAppear {
      // Load the image when the cell appears on screen
      imageLoader.loadImage()
      imageLoader.isVisibleOnScreen = true
    }
    .onDisappear {
      // Cancel the image loading when the cell disappears from screen
      imageLoader.cancel()
      imageLoader.isVisibleOnScreen = false
    }
  }
}
