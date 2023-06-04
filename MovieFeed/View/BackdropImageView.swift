//
//  BackdropImageView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 3/6/23.
//

import SwiftUI

struct BackdropImageView:
    View {
    @StateObject var cacheManager = CacheManager()
    var backDropImageName: String
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
                Image("posterNotAvailable").iconModifier()
            }
                
        }
        .task {
            await cacheManager.loadImage(from: backDropImageName)
        }
    }
}

struct BackdropImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackdropImageView(backDropImageName: "/lVLP5aP91BcXxga7WitH50neNus.jpg")
    }
}
