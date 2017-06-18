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
        
        let authParam: Parameters = [
        "client_id": "f08f587c2beffc39e8ea5fb87a45a794f37d2c9cb62042070d099a88e976d7d9",
        "redirect_uri": "https://api.dribbble.com?callback=shot"
        ]
        
        Alamofire.request(auth, parameters: authParam).validate().responseJSON { response in
            print(response.result)
            debugPrint(response)
            let realData = NSData(data: response.data!)
            let stringData = NSString(data: realData as Data, encoding: String.Encoding.utf8.rawValue)
            print(stringData)
        }
        
    }
    
    func tokenize() {
        
        let token = "https://dribbble.com/oauth/token?client_id=f08f587c2beffc39e8ea5fb87a45a794f37d2c9cb62042070d099a88e976d7d9&client_secret=ba7c4c1556986e175f3c06a6e556c6c1eafc99c6d333470bcb9affba837f9d81"
        let tokenUrl = URL(string: token)!
        
        let tokenHeader: HTTPHeaders = [
            "Authorization": "Bearer cd1fb8d92975c1f17efb46df08f3ca9018aff49f30af187f92b0531d1194b0aa"
        ]
        
        Alamofire.request(tokenUrl, headers: tokenHeader).responseJSON { response in
            
            print(response)
            let datastring = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
            //            print(datastring as Any)
            
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get object as JSON from API")
                print("Error: \(String(describing: response.result.error))")
                return
            }
            print("JSON: \(json)")
            
            DispatchQueue.main.async(execute: {
                
            })
            
        }
    }



}
