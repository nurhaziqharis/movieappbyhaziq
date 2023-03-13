//
//  MovieResult.swift
//  MovieAppByHaziqApp
//
//  Created by Haziq Haris on 12/3/2023.
//

import Foundation

struct MovieResult: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
