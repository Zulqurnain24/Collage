//
//  PixabayApi.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import Foundation

struct  PixabayApi {
  static let apiURLString = "\(PixabayAPI.baseURL)?key=\(PixabayAPI.key)&q=\(PixabayAPI.query)&image_type=\(PixabayAPI.imageType)&per_page=\(PixabayAPI.perPage)"
}
