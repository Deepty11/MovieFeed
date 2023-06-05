//
//  TrendingModel.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 2/6/23.
//

import Foundation

enum MediaType: String {
    case movie = "movie"
    case tv = "tv"
}

struct Contents: Codable {
    var results: [ContentModel]
}

struct ContentModel: Codable, Identifiable {
    var id: Int
    var name : String? = nil
    var title: String? = nil
    var overview: String? = nil
    var poster_path: String?
    var backdrop_path: String?
    var first_air_date: String? = nil
    var release_date: String? = nil
    var media_type: String? = nil
    var vote_average: Double? = nil
    var genres: [Genre]? = nil
    
    var mediaType: MediaType {
       return media_type == "movie" ? .movie : .tv
    }
}

struct Genre: Codable, Identifiable {
    var id: Int
    var name: String
}
