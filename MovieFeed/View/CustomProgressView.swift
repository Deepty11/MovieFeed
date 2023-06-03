//
//  CustomProgressView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 3/6/23.
//

import SwiftUI

struct CustomProgressView: View {
    var isHidden: Bool
    var body: some View {
        if !isHidden {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.red)
        }
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(isHidden: false)
    }
}
