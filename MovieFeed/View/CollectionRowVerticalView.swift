//
//  CollectionRowVerticalView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 2/6/23.
//

import SwiftUI

struct CollectionRowVerticalView<Content: View>: View {
    var content: Content
    
    init( @ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center, spacing: 2) {
                content
            }
        }
        .frame(height: 200)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets(top: 2,
                                  leading: 2,
                                  bottom: 2,
                                  trailing: 2))
    }
}


