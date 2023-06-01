//
//  ApiURLStrings.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 30/5/23.
//

import Foundation

struct APIURLs {
    static let basePopularMovieURL = "https://api.themoviedb.org/3/discover/movie"
    static let basePopularTVSeriesURL = "https://api.themoviedb.org/3/discover/tv"
    static let baseTrendingContentURL = "https://api.themoviedb.org/3/trending/all/week"
    
    static let baseMovieDetailsURL = "https://api.themoviedb.org/3/movie/"
    static let baseTVSeriesDetailsURL = "https://api.themoviedb.org/3/tv/"
    static let apiKey = "api_key=b4f512f698798cd4e32e49b30e945544"
    static let releaseYear = "primary_release_year=2023"
    static let sortBy = "sort_by=vote_average.desc"
    static let baseImageURL = "https://image.tmdb.org/t/p/w342"
}
