//
//  ImageLoader.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import SwiftUI
import Combine

protocol ImageLoaderDelegate: ObservableObject {
    associatedtype Image: UIImage
    func loadImage(completionHandler: (() -> Void)?)
    func prefetchImage()
    func cancel()
}

class ImageLoader: ImageLoaderDelegate {
    typealias Image = UIImage
    
    @Published var image: Image? = nil
    
    var cancellable: AnyCancellable?
    private let imageURL: URL?
    var prefetchTask: URLSessionDataTask?
    var prefetchedData: Data?
    var isVisibleOnScreen: Bool = true {
        didSet {
            self.prefetchImage()
        }
    }
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else {
            self.imageURL = nil
            return
        }
        self.imageURL = url
    }
    
    func loadImage(completionHandler: (() -> Void)? = nil) {
        if let prefetchedData = prefetchedData {
            image = UIImage(data: prefetchedData)
            return
        }
        
        guard let imageURL = imageURL else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadedImage in
                self?.image = loadedImage
                completionHandler?()
            }
    }
    
    func prefetchImage() {
        guard let imageURL = imageURL,
              prefetchedData?.isEmpty ?? true else { return }
        prefetchTask = URLSession.shared.dataTask(with: imageURL) { [weak self] data, _, _ in
            if let data = data {
                self?.prefetchedData = data
            }
        }
        prefetchTask?.priority = isVisibleOnScreen
        ?
        URLSessionTask.highPriority
        :
        URLSessionTask.lowPriority
        prefetchTask?.resume()
    }
    
    func cancel() {
        cancellable?.cancel()
        prefetchTask?.cancel()
    }
}

extension ImageLoader: Identifiable {
    var id: String { imageURL?.absoluteString ?? "" }
}

extension ImageLoader: Hashable {
    static func == (lhs: ImageLoader,
                    rhs: ImageLoader) -> Bool {
        lhs.imageURL == rhs.imageURL
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(imageURL)
    }
}
