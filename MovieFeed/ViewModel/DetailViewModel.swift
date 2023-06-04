//
//  DetailViewModel.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 3/6/23.
//

import Foundation

class DetailViewModel: ObservableObject {
    private let apiService = APIService()
    
    @Published var content = ContentModel(id: 0)
    
    @MainActor
    func fetchDetails(for id: Int, mediaType: MediaType) async {
        do {
            if mediaType == .movie {
                content = try await getDetails(with: APIURLs.baseMovieDetailsURL,
                                        for: String(id))
            } else {
                content =  try await getDetails(with: APIURLs.baseTVSeriesDetailsURL,
                                                for: String(id))
                
            }
        } catch { print(error.localizedDescription) }
        
    }
    
    private func getDetails(with url: String, for id: String) async throws  -> ContentModel {
        do {
            return try await apiService.fetch(for: url,
                                              id: id,
                                              apiKey: APIURLs.apiKey) as ContentModel
            
        } catch {
            throw ErrorType.NetworkError
        }
    }
}
