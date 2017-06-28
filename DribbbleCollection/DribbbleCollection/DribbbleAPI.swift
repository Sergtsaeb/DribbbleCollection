//
//  DribbbleAPI.swift
//  
//
//  Created by Sergelenbaatar Tsogtbaatar on 6/20/17.
//

import UIKit
import Alamofire
import SwiftyJSON

class DribbbleAPI: NSObject {
    
    static let shared = DribbbleAPI()
    let userURL = "https://api.dribbble.com/v1/user"
    let shotsListURL = "https://api.dribbble.com/v1/shots"
    
    func getUser() {
        guard let token = UserDefaults.standard.object(forKey: "access_token") else { return }
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        Alamofire.request(userURL, headers: header).responseJSON { (response) in
            print(response.result)
            
            if let json = response.result.value as? [String: Any] {
                print("User JSON: \(json)")
            }
            
        }
    }
    
    func getShots() {
        guard let token = UserDefaults.standard.object(forKey: "access_token") else { return }
        let header: HTTPHeaders = [ "Authorization": "Bearer \(token)" ]
        
        Alamofire.request(shotsListURL, headers: header).responseJSON { response in
            debugPrint(response)
            
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
//                let animated = json[0]["animated"]
//                print(animated)
                
            case .failure(let error):
                print(error)
            }
            
        }
        
        
    }
   
    
}
