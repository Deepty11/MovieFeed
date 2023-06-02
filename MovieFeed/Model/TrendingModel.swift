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
struct Trendings: Codable {
    var results: [TrendingModel]
}

struct TrendingModel: Codable, Identifiable {
    var id: Int
    var name : String? = nil
    var title: String? = nil
    var poster_path: String?
    var first_air_date: String? = nil
    var release_date: String? = nil
    var media_type: String
    var vote_average: Double? = nil
    var genre_ids: [Int]? = nil
    
    var mediaType: MediaType {
       return media_type == "movie" ? .movie : .tv
    }
}
