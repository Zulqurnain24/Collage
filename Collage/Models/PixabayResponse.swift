//
//  PixabayResponse.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import Foundation

struct PixabayResponse: Decodable {
  let hits: [ImageHit]
}
