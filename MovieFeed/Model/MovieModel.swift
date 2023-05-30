//
//  MovieModel.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 30/5/23.
//

import Foundation


struct MovieModel: Codable {
    var id: String
    var title: String
    var overview: String? = nil
    var release_date: String? = nil
}
