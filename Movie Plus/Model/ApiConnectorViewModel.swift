//
//  ApiConnectorViewModel.swift
//  Movie Plus
//
//  Created by mac on 2022-07-11.
//

import Foundation

struct APIStructure: Codable {
    var status: String
    var status_message: String
    var data: dataStructure
}

struct dataStructure: Codable {
    var page_number: Int
    var movies: [movie]
}

struct movie: Codable, Hashable {
    var id: Int
    var title: String
    var description_full: String
    var genres: [String]
    var small_cover_image: String
    var rating: Double
    var year: Int
    var medium_cover_image: String
    var large_cover_image: String
}





