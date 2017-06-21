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

    
    
    let clientID = "f08f587c2beffc39e8ea5fb87a45a794f37d2c9cb62042070d099a88e976d7d9"
    let clientSecret = "ba7c4c1556986e175f3c06a6e556c6c1eafc99c6d333470bcb9affba837f9d81"
//    "Authorization": "Bearer cd1fb8d92975c1f17efb46df08f3ca9018aff49f30af187f92b0531d1194b0aa"
    
    func authorize() {
//        let url = "https://api.dribbble.com/v1/user"
        
    let params : Parameters = [
                "id": "Number"
                ]
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
        
   
        
//            Alamofire.request(shotsListURL, headers: headers, parameters: params).responseJSON { response in
//            debugPrint(response)
//        }
//
//        let token = "https://dribbble.com/oauth/authorize"
//        let tokenUrl = URL(string: token)!
//        
//                let headers: HTTPHeaders = [
//                    "client_id": "f08f587c2beffc39e8ea5fb87a45a794f37d2c9cb62042070d099a88e976d7d9"
//                ]
//        
//                Alamofire.request(tokenUrl, headers: headers).responseJSON { response in
//            
//                    print(response.result)
//                    
//            guard let json = response.result.value as? [String: Any] else {
//                print("didn't get todo object as JSON from API")
//                print("Error: \(String(describing: response.result.error))")
//                return
//            }
//        
//            DispatchQueue.main.async(execute: {
//                
//                                })
//        }
//        
//    }
    

}

}
