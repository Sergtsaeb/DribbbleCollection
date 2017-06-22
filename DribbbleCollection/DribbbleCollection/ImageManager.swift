//
//  ImageManager.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 6/6/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import UIKit
import Alamofire

private let _singletonInstance = ImageManager()
private let kLazyLoadMaxCacheImageSize = 20

class ImageManager: NSObject {
    var imageCache = [String: UIImage]()
    static var sharedInstance: ImageManager {
        return _singletonInstance
    }
    
    func cacheImage(image: UIImage, forURL url: String) {
        if imageCache.count > kLazyLoadMaxCacheImageSize {
            imageCache.remove(at: imageCache.startIndex)
        }
        imageCache[url] = image
    }
    
    func cachedImageForURL(url: String) -> UIImage? {
        return imageCache[url]
    }
    func clearCache() { imageCache.removeAll() }
    
}


