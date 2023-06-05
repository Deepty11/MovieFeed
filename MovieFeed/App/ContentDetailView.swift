//
//  ContentDetailView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 4/6/23.
//

import SwiftUI

struct ContentDetailView: View {
    @StateObject private var viewModel = DetailViewModel()
    @StateObject private var cacheManager = CacheManager()
    @State private var isHidden: Bool = false
    
    var id: Int
    var mediaType: MediaType
    
    // For debug purpose
    func printMe() {
        print("ID: \(id)")
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                if let data = cacheManager.data,
                   let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .backDropImageModifier()
                    
                } else {
                    Image("imageNotAvailable")
                        .backDropImageModifier()
                        .overlay {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .tint(.gray)
                                .isHidden(isHidden)
                        }
                }
        
                // MARK: Title
                Text(viewModel.content.title ?? viewModel.content.name ?? "")
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                //MARK: Original Title/ Name
                Text("\(viewModel.content.original_title ?? viewModel.content.original_name ?? "") (Original \(mediaType == .movie ? "Title" : "Name"))")
                //MARK: Content Type
                Text("\(mediaType.rawValue)・\(viewModel.content.duration)")

                
                //MARK: Genre Lists
                if let genres = viewModel.content.genres {
                    LazyHStack {
                        ForEach(genres) { genre in
                            GenreView(name: genre.name)
                        }
                    }
                }
                // MARK: Overview
                Text(viewModel.content.overview ?? "")
                    .font(.headline)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
            }
        }
        .navigationTitle("Details")
        .task {
            await viewModel.fetchDetails(for: id, mediaType: mediaType)
           let _ = await cacheManager.loadImage(from: viewModel.content.backdrop_path ?? "")
            
            withAnimation {
                isHidden = true
            }
        }
        .onAppear{
            printMe()
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(id: 227953, mediaType: .tv)
    }
}
