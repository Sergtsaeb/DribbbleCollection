//
//  GalleryItem.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 5/6/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import Foundation

class GalleryItem {
    
    var itemImage: String
    
    
    init(dataDictionary: Dictionary<String, String>) {
            itemImage = dataDictionary["Item Image"]!
        
    }
    
    class func newGalleryItem(_ dataDictionary: Dictionary<String, String>) -> GalleryItem {
        
        return GalleryItem(dataDictionary: dataDictionary)
    }
    
    

}
