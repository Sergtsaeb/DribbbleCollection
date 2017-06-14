//
//  LoginViewController.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 6/14/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

  
    @IBAction func sendRequest(_ sender: Any) {
        authorize()
    }
    
    func authorize() {
        let auth = "https://dribbble.com/oauth/authorize"
        let headers: HTTPHeaders = [
            "client_id": "f08f587c2beffc39e8ea5fb87a45a794f37d2c9cb62042070d099a88e976d7d9",
            "state": "7664ec760696a323190dd9554f756f7abd4fbed21614bbc6875c03eadc0f8274"
        ]
        
        Alamofire.request(auth, headers: headers).responseJSON { response in
            debugPrint(response)
            debugPrint(response.data)
            
            
        }
        
        
        let token = "https://dribbble.com/oauth/token"
        let tokenUrl = URL(string: token)!
        
//        Alamofire.request(tokenUrl, headers: headers).responseJSON { response in
//            
//            print(response.result)
//            
//            guard let json = response.result.value as? [String: Any] else {
//                print("didn't get todo object as JSON from API")
//                print("Error: \(String(describing: response.result.error))")
//                return
//            }
        
//            DispatchQueue.main.async(execute: {
//                
//            })
//            
//        }
        
    }



}
