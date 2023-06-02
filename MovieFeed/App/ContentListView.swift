//
//  MovieListView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 30/5/23.
//

import SwiftUI

struct ContentListView: View {
    @StateObject private var viewModel = ContentViewModel()
    
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
            List {
                //MARK: - Popular Movies
                Section("Popular Movies") {
                    CollectionRowHorizontalView {
                        ForEach(viewModel.movies.results) { item in
                            PosterView(poster: item.poster_path ?? "",
                                       title: item.title)
                        }
                    } .task {
                        await viewModel.getMovies()
                    }
                }
                
                //MARK: - Popular TV Series
                Section("Popular TV Series") {
                    CollectionRowHorizontalView {
                        ForEach(viewModel.tvSeries.results) { item in
                            PosterView(poster: item.poster_path ?? "",
                                       title: item.name)
                        }
                    }
                    .task {
                        await viewModel.getTVSeries()
                    }
                    
                }
                
                //MARK: - Trendings
                Section("Trendings") {
                    CollectionRowVerticalView {
                        ForEach(viewModel.trendings.results) { item in
                            PosterView(poster: item.poster_path ?? "",
                                       title: item.title ?? item.name ?? "")
                        }
                    }
                    .task {
                        await viewModel.getTrendings()
                    }
                    
                }
                
            }
            .navigationTitle("🍿 Movie Feed")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}
