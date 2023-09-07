//
//  CollageViewModel.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import SwiftUI

protocol CollageViewModelDelegate: ObservableObject {
  func loadData(completionHandler: (() -> Void)?)
}

class CollageViewModel: CollageViewModelDelegate {
  private let networkManager: NetworkManagerDelegate
    @Published var imageLoaders: [any ImageLoaderDelegate] = [] {
    didSet {
      self.imageLoaders.forEach { imageLoader in
        imageLoader.prefetchImage()
      }
    }
  }

    init(imageLoaders: [any ImageLoaderDelegate],
       networkManager: NetworkManagerDelegate) {
    self.imageLoaders = imageLoaders
    self.networkManager = networkManager
  }
  
  func prefetchImages() {
    self.imageLoaders.forEach { imageLoader in
      imageLoader.prefetchImage()
    }
  }
  
  func loadData(completionHandler: (() -> Void)? = nil) {
    guard let url = URL(string: PixabayApi.apiURLString) else { return }
    
    networkManager.performRequest(url: url) { (result: Result<PixabayResponse, Error>) in
      switch result {
      case .success(let response):
        DispatchQueue.main.async {
            self.imageLoaders = response.hits.map { ImageLoader(imageURL: $0.previewURL ) }
          completionHandler?()
        }
          
      case .failure(let error):
          print("\(Constants.apiRequestFailed) \(error.localizedDescription)")
        completionHandler?()
      }
    }
  }
}
