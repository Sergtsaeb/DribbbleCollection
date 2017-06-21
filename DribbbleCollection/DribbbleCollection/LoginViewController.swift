//
//  LoginViewController.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 6/14/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
  
    @IBAction func sendRequest(_ sender: Any) {
        authorize()
    }
    
    func authorize() {
        let auth = "https://dribbble.com/oauth/authorize?client_id=\(kClientID)"
        UIApplication.shared.open(URL(string: auth)!, options: [:], completionHandler: nil)
        
    }
    
 
}
