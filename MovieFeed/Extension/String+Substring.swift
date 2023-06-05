//
//  String+Substring.swift
//  MovieFeed
//
//  Created by Rehnuma Reza Deepty on 5/6/23.
//

import Foundation

extension String {
    func subString(until index: Int) -> String {
        let toIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[..<toIndex])
    }
}
