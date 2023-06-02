//
//  CacheImage.swift
//  MovieFeed
//
//  Created by Rehnuma Reza on 2/6/23.
//

import Foundation

class CacheImage {
    static let shared = CacheImage()
    
    private init() { }
    
    typealias CacheType = NSCache<NSString, NSObject>
    
    private lazy var cache: CacheType = {
        let cache = CacheType()
        cache.countLimit = 100
        cache.totalCostLimit = 50 * 1024 * 1024 //52428800 -> 50MB
        return cache
    }()
    
    // add
    func add(for key: NSString, object: NSData) {
        cache.setObject(object , forKey: key)
    }
    
    // get Object
    func get(for key: NSString) -> Data? {
        cache.object(forKey: key) as? Data
    }
}
