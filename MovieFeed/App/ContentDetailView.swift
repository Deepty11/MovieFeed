//
//  ContentDetailView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 4/6/23.
//

import SwiftUI

struct ContentDetailView: View {
    @StateObject private var viewModel = DetailViewModel()
    var id: Int
    var mediaType: MediaType
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                BackdropImageView(backDropImageName: viewModel.content.backdrop_path ?? "")
            }
        }
        .task {
            await viewModel.fetchDetails(for: id, mediaType: mediaType)
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(id: 1135778, mediaType: .movie)
    }
}
