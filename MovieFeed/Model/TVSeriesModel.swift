//
//  TVSeriesModel.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 31/5/23.
//

import Foundation

struct TVSerieses: Codable {
    var results: [TVseriesModel]
}

struct TVseriesModel: Codable, Identifiable {
    var id: Int
    var name: String
    var first_air_date: String? = nil
    var poster_path: String? = nil
    var backdrop_path: String? = nil
    var overview: String? = nil
}
