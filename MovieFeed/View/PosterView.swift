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
    let poster: String
    let title: String
    
    var body: some View {
        VStack(spacing: 2.0) {
            
            AsyncImage(url: URL(string: "\(APIURLs.baseImageURL)/\(poster)"), transaction: Transaction(animation: .easeIn(duration: 0.5))) { phase in
                switch phase {
                case .success(let image):
                    image.imageModifier()
                case .failure(_), .empty:
                    Image(systemName: "photo.fill").iconModifier()
                
                @unknown default:
                    Image(systemName: "photo.fill").iconModifier()
                }
            }
            .background(Color.black)
            .frame(height: 200)
            .cornerRadius(12.0)
                
            Text(title)
                .font(.system(.footnote))
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .frame(width: 100)
                .lineLimit(2)
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
