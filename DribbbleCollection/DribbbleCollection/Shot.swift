//
//  Shots.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 6/14/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Shot {
    var id: NSNumber?
    var title: String?
    var description: String?
    var images: String?
    var likesCount: String?
    var reboundsCount: String?
    var bucketsCount: String?
    var projectsURL: String?
    var tags: [String]?
    var user: String?
    
    required init(json: JSON) {
        self.id = json["id"].number
        self.title = json["title"].string!
        self.description = json["description"].string
        self.images = json["images"].string
        self.user = json["user"].string
    }
    
    
}
