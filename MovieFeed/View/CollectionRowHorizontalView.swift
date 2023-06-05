//
//  ListRowView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 1/6/23.
//

import SwiftUI

struct CollectionRowHorizontalView<Content: View>: View {
    var content: Content
    
    init( @ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 5) {
                content
            }
        }
        .frame(height: 250)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets(top: 2,
                                  leading: 2,
                                  bottom: 2,
                                  trailing: 2))
    }
}


