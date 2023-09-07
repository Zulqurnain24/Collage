//
//  ImageLoaderMock.swift
//  Collage
//
//  Created by Mohammad Zulqurnain on 07/09/2023.
//

import UIKit

// Mock ImageLoader for testing
class ImageLoaderMock<Image: UIImage>: ImageLoaderDelegate {
    typealias Image = Image

    var isLoadImageCalled = false
    var isPrefetchImageCalled = false
    var isCancelCalled = false

    func loadImage(completionHandler: (() -> Void)? = nil) {
        // Mock the loadImage method
        isLoadImageCalled = true
        completionHandler?()
    }

    func prefetchImage() {
        // Mock the prefetchImage method
        isPrefetchImageCalled = true
    }

    func cancel() {
        // Mock the cancel method
        isCancelCalled = true
    }
}
