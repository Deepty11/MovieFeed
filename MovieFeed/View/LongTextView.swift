//
//  LongTextView.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 3/6/23.
//

import SwiftUI

struct LongTextView: View {
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(value)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
        }
    }
}

struct LongTextView_Previews: PreviewProvider {
    static var previews: some View {
        LongTextView(value: "Hailing from a middle-class family, Lakshmi’s life is upended when she realises that her marriage to Rishi Oberoi, an industrialist’s son, is a sham to keep his death at bay.")
    }
}
