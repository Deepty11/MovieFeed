//
//  GenreView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 5/6/23.
//

import SwiftUI

struct GenreView: View {
    var name: String
    var body: some View {
        Text(name)
            .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
            .background(Rectangle().fill(Color("titleColor")).cornerRadius(10))
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(name: "Action")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
