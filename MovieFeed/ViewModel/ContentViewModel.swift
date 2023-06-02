//
//  ContentViewModel.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 30/5/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var movies = Movies(results: [])
    @Published var tvSeries = TVSerieses(results: [])
    @Published var trendings = Trendings(results: [])
    
    func getMovies() async {
        Task {
            let fetchedMovies: Movies = try await APIService.fetchList(
                for: APIURLs.basePopularMovieURL,
                apiKey: APIURLs.apiKey,
                releaseYear: APIURLs.releaseYear,
                sortedBy: APIURLs.sortBy)
            DispatchQueue.main.async {[weak self] in
                self?.movies = fetchedMovies
            }
            
        }
    }
    
    func getTVSeries() async {
        Task {
            let fetchedTVSeries: TVSerieses = try await APIService.fetchList(
                for: APIURLs.basePopularTVSeriesURL,
                apiKey: APIURLs.apiKey,
                releaseYear: APIURLs.releaseYear,
                sortedBy: APIURLs.sortBy)
            DispatchQueue.main.async {[weak self] in
                self?.tvSeries = fetchedTVSeries
            }
            
        }
    }
    
    func getTrendings() async {
        Task {
            let fetchedTrendings: Trendings = try await APIService.fetchList(
                for: APIURLs.baseTrendingContentURL,
                apiKey: APIURLs.apiKey)
            DispatchQueue.main.async {[weak self] in
                self?.trendings = fetchedTrendings
            }
            
        }
    }
}
