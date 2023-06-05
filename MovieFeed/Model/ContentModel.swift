//
//  TrendingModel.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 2/6/23.
//

import Foundation

enum MediaType: String {
    case movie = "Movie"
    case tv = "TV Series"
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
    var last_air_date: String? = nil
    var release_date: String? = nil
    var media_type: String? = nil
    var vote_average: Double? = nil
    var genres: [Genre]? = nil
    var original_name: String? = nil
    var original_title: String? = nil
    var number_of_episodes: Int? = nil
    var homepage: String? = nil
    
    var mediaType: MediaType {
       return media_type == "movie" ? .movie : .tv
    }
}

extension ContentModel {
    public var duration: String {
        if let release_date, !release_date.isEmpty {
            return release_date.subString(until: 4)
        }
        
        guard let first_air_date, !first_air_date.isEmpty else { return "" }
        
        var durationText = "\(first_air_date.subString(until: 4))"
        
        guard let last_air_date, !last_air_date.isEmpty else { return durationText}
        durationText += "-\(last_air_date.subString(until: 4) )"
        
        return durationText
        
    }
    
    public var numberOfEpisodes: String {
        guard let number_of_episodes else { return "" }
        
        return ".\(String(number_of_episodes))"
    }
}

struct Genre: Codable, Identifiable {
    var id: Int
    var name: String
}
