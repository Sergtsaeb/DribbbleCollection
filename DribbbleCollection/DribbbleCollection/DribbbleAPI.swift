//
//  DribbbleAPI.swift
//  
//
//  Created by Sergelenbaatar Tsogtbaatar on 6/20/17.
//

import UIKit
import Alamofire

class DribbbleAPI: NSObject {
    
    static let shared = DribbbleAPI()
    
    let shotURL = "http://api.dribbble.com/shots"
    
    //        let authParam: Parameters = [
    //        "client_id": "f08f587c2beffc39e8ea5fb87a45a794f37d2c9cb62042070d099a88e976d7d9"
    //        ]
    //
    
    func getShots() {
        Alamofire.request(shotURL).responseJSON { (response) in
            print(response.result)
            
        }
    }
    
}
