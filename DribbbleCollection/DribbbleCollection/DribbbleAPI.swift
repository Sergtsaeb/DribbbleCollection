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
    let userURL = "https://api.dribbble.com/v1/user"
    
    func getUser() {
        guard let token = UserDefaults.standard.object(forKey: "access_token") else { return }
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        Alamofire.request(userURL, headers: header).responseJSON { (response) in
            print(response.result)
            
            if let json = response.result.value as? [String: Any] {
                print(json)
            }
            
        }
    }
    
    
    
}
