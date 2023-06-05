//
//  View+ViewBuilder.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 5/6/23.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
