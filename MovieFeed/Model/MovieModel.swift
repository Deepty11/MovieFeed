//
//  MovieModel.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 30/5/23.
//

import Foundation

struct Movies: Decodable {
    var results: [MovieModel]
}

struct MovieModel: Decodable, Identifiable {
    var id: Int
    var title: String
    var overview: String? = nil
    var release_date: String? = nil
    var vote_average: Double? = nil
    var poster_path: String? = nil
    var genre_ids: [Int]? = nil
}
