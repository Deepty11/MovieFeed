//
//  ApiURLStrings.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 30/5/23.
//

import Foundation

struct APIURLs {
    let basePopularMovieURL = "https://api.themoviedb.org/3/discover/movie"
    let basePopularTVSeriesURL = "https://api.themoviedb.org/3/discover/tv"
    let baseTrendingContentURL = "https://api.themoviedb.org/3/trending/all/week"
    
    let baseMovieDetailsURL = "https://api.themoviedb.org/3/movie/"
    let baseTVSeriesDetailsURL = "https://api.themoviedb.org/3/tv/"
    let apiKey = "b4f512f698798cd4e32e49b30e945544"
    let releaseYear = "2023"
    let sortBy = "vote_average.desc"
    let baseImageURL = "https://image.tmdb.org/t/p/w342"
}
