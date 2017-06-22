//
//  AppDelegate.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/19/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var code = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let token = UserDefaults.standard.getAccessToken() {
            print(token)
        } else {
            presentLogin()
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print("retrieved code")
        
        code = url.absoluteString.components(separatedBy: "=").last!
        print("My code: \(code)")
        if (!code.isEmpty) {
            tokenize()
        }
        
        return true
    }
    
    func presentLogin() {
        if let dribbbleVC = self.window?.rootViewController as? DribbbleCollectionViewController, let storyboard = dribbbleVC.storyboard {
            if let loginVC = storyboard.instantiateViewController(withIdentifier: LoginViewController.identifier) as? LoginViewController {
                
                dribbbleVC.addChildViewController(loginVC)
                dribbbleVC.view.addSubview(loginVC.view)
                
            }
            
        }
    }
    
    func tokenize() {
        let tokenURL = "https://dribbble.com/oauth/token"
        
        let param: Parameters = [
            "client_id": kClientID,
            "client_secret": kClientSecret,
            "code": code
        ]
        
        Alamofire.request(tokenURL, method: .post, parameters: param).responseJSON { (response) in
            debugPrint(response)
            
            switch response.result {
            case .success:
                print("Validation Successful")
                if let jsonDict = response.result.value as? [String : Any] {
                    print(jsonDict)
                    
                    if let token = jsonDict["access_token"] {
                        UserDefaults.standard.set(token, forKey: "access_token")
                    }
                    
                    if let mytoken = UserDefaults.standard.object(forKey: "access_token") {
                        print(mytoken)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

