//
//  Image+Modifier.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 5/6/23.
//

import Foundation
import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self.resizable()
            .scaledToFit()
            .shadow(color: .black,
                    radius: 10,
                    x:2,
                    y:2)
    }

    func iconModifier() -> some View {
        self.resizable()
            .scaledToFit()
            .frame(height: 200, alignment: .center)
    }
    
    func backDropImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .background(Color.black)
            .frame(width: UIScreen.main.bounds.width)
    }
}
