//
//  ApiService.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 30/5/23.
//

import Foundation

class APIService {
    static func fetchList<T: Decodable>(for baseURL: String,
                 apiKey: String,
                 releaseYear: String? = nil,
                 sortedBy: String? = nil ) async throws -> T {
        
        
        if let url = createURL(with: baseURL,
                               apiKey: apiKey,
                               releaseYear: releaseYear,
                               sortedBy: sortedBy) {
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                print(String(data: data, encoding: .ascii) ?? "")
                let parsedData = try JSONDecoder().decode(T.self, from: data)
                return parsedData
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Data could not be parsed")
        }
    }
    
    //https://api.themoviedb.org/3/discover/movie?api_key=b4f512f698798cd4e32e49b30e945544&primary_release_year=2020&sort_by=vote_average.desc
    private static func createURL(with baseURL: String,
                   apiKey: String,
                   releaseYear: String? = nil,
                   sortedBy: String? = nil) -> URL? {
        var urlString = "\(baseURL)?\(apiKey)"
        
        if let releaseYear { urlString += "&\(releaseYear)" }
        
        if let sortedBy { urlString += "&\(sortedBy)" }
        
        return URL(string: urlString)
    }
    
    func retrieveImage(from url: String) async throws -> Data? {
        let urlString = "\(APIURLs.baseImageURL)/\(url)"
        
        guard let url = URL(string: urlString) else { throw ErrorType.NetworkError }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
    
    enum ErrorType: Error {
        case NetworkError
    }
}
