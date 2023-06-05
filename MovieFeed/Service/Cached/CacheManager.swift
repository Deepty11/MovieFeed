//
//  CacheManager.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 2/6/23.
//

import Foundation


class CacheManager: ObservableObject {
    @Published var data: Data?
    
    var apiService = APIService()
    
    @MainActor
    func loadImage(from urlString: String, cache: CacheImage = .shared) async {
        /** first check if the image is already cached or not
          *  if cached, get the data from cache
          *  else, retrieve the image from API and cache it
         */
        if let cachedImage = cache.get(for: urlString as NSString) {
            data = cachedImage
        } else {
            do {
                data = try await apiService.retrieveImage(from: urlString)
                 
                guard let data else { return }
                
                cache.add(for: urlString as NSString, object: data as NSData)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
