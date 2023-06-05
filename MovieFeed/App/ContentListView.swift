//
//  MovieListView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 30/5/23.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

struct ContentListView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var isHidden: Bool = false
    
    init() {
        navigationBarAppearance()
    }
    
    func navigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "navigationColor")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    //MARK: - Popular Movies
                    Section("Popular Movies") {
                        CollectionRowHorizontalView {
                            ForEach(viewModel.movies.results) { item in
                                NavigationLink(destination: ContentDetailView(id: item.id, mediaType: .movie)) {
                                    PosterView(poster: item.poster_path ?? "",
                                               title: item.title ?? "")
                                    
                                }
                            }
                        } 
                    }
                    
                    //MARK: - Popular TV Series
                    Section("Popular TV Series") {
                        CollectionRowHorizontalView {
                            ForEach(viewModel.tvSeries.results) { item in
                                NavigationLink(destination: ContentDetailView(id: item.id, mediaType: .tv)) {
                                    PosterView(poster: item.poster_path ?? "",
                                               title: item.name ?? "")
                                    
                                }
                                
                            }
                        }
                        
                    }
                    
                    //MARK: - Trendings
                    Section("Trendings") {
                        CollectionRowVerticalView {
                            ForEach(viewModel.trendings.results) { item in
                                NavigationLink(destination: ContentDetailView(id: item.id, mediaType: item.mediaType)) {
                                    PosterView(poster: item.poster_path ?? "",
                                               title: item.title ?? item.name ?? "")
                                    
                                }
                                
                            }
                        }
                        
                    }
                }
                .task {
                    let _ = await viewModel.getMovies()
                    let _ = await viewModel.getTVSeries()
                    let _ = await viewModel.getTrendings()
                    
                    withAnimation(.easeOut(duration: 10)) {
                        isHidden = true
                        
                    }
                }
                .navigationTitle("🍿 Movie Feed")
                
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.gray)
                    .isHidden(isHidden)
            .navigationBarTitleDisplayMode(.inline)
            }
        }
        
        
    }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}
