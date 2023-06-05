//
//  HomePageView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 5/6/23.
//

import SwiftUI

struct HomePageView: View {
    let urlString: String
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "link")
                    .foregroundColor(Color("titleColor"))
                Text("For More Info")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                        
                    
                    Link("Home Page", destination: URL(string: urlString) ?? URL(string: "https://en.wikipedia.org")!)
                }
                .foregroundColor(Color("titleColor"))
                
                
            }
        }

    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(urlString: "https://johnwick.movie")
            .previewLayout(.sizeThatFits)
    }
}
