//
//  ContentViewModel.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 30/5/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var movies = Contents(results: [])
    @Published var tvSeries = Contents(results: [])
    @Published var trendings = Contents(results: [])
    
    private let apiService = APIService()
    
    func getMovies() async {
        Task {
            let fetchedMovies: Contents = try await apiService.fetch(
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
            let fetchedTVSeries: Contents = try await apiService.fetch(
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
            let fetchedTrendings: Contents = try await apiService.fetch(
                for: APIURLs.baseTrendingContentURL,
                apiKey: APIURLs.apiKey)
            DispatchQueue.main.async {[weak self] in
                self?.trendings = fetchedTrendings
            }
            
        }
    }
}
