//
//  GridView.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import SwiftUI

struct GridView: View {
  let imageLoaders: [ImageLoader]
  
  init(imageLoaders: [ImageLoader]) {
    self.imageLoaders = imageLoaders
  }
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
        ForEach(imageLoaders, id: \.self) { imageLoader in
          GridCell(imageLoader: imageLoader)
        }
      }
      .padding()
    }
  }
}
