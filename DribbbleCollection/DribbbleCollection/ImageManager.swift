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
    
    
    func callAlamo(url: String) {
        let urlEndpoint = "https://api.dribbble.com/v1/user?access_token=OAUTH_TOKEN"
        
        Alamofire.request(urlEndpoint).responseJSON { response in
            
            switch response.result {
            
            case .success(let data):
                
                DispatchQueue.main.async(execute: {
//                    if let shot = value["shot"] as? String {
//                        print(shot)
//                    }
                })
                
            case .failure(let error):
                print(error)
                
            }

        }
        
    }
    
    func downloadImageFromURL(_ urlString: String, completion: ((_ success: Bool, _ image: UIImage?) -> Void)?) {
        // do we have this cached?
        if let cachedImage = cachedImageForURL(url: urlString) {
            DispatchQueue.main.async(execute: {completion?(true, cachedImage) })
        } else if let url = URL(string: urlString) { // download from URL asynchronously
            let session = URLSession.shared
            let downloadTask = session.downloadTask(with: url, completionHandler: { (retrievedURL, response, error) -> Void in
                var found = false
                if error != nil { print("Error downloading image \(url.absoluteString): \(error!.localizedDescription)") }
                else if retrievedURL != nil {
                    if let data = try? Data(contentsOf: retrievedURL!) {
                        if let image = UIImage(data: data) {
                            found = true
                            self.cacheImage(image: image, forURL: url.absoluteString)
                            DispatchQueue.main.async(execute: { completion?(true, image) });
                        }
                    }
                }
                if !found { DispatchQueue.main.async(execute: { completion?(false, nil) }); }
            })
            downloadTask.resume()
        } else { completion?(false, nil) }
    }
    
    

}
