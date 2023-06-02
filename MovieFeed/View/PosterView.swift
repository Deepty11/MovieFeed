//
//  PosterView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 30/5/23.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self.resizable().scaledToFit()
    }
    
    func iconModifier() -> some View {
        self.resizable()
            .scaledToFit()
            .frame(height: 100, alignment: .center)
    }
}
struct PosterView: View {
    @StateObject var cacheManager = CacheManager()
    
    let poster: String
    let title: String
    
    var body: some View {
        VStack(spacing: 2.0) {
            if let data = cacheManager.data,
               let image = UIImage(data: data) {
                Image(uiImage: image)
                    .imageModifier()
                    .background(Color.black)
                    .frame(height: 200)
                    .cornerRadius(12.0)
                
            } else {
                Image(systemName: "photo.fill").iconModifier()
            }
                
            Text(title)
                .font(.system(.footnote))
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .frame(width: 100)
                .lineLimit(2)
        }
        .task {
            await cacheManager.loadImage(from: poster)
        }
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(poster: "/jhRiPYw8aVsr3xpkBrDUmFsKJFY.jpg",
                   title: "title")
            .preferredColorScheme(.dark)
    }
}
