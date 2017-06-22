//
//  FoundationExtension.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 6/22/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import Foundation
import UIKit

enum Keys: String {
    case accessToken = "access_token"
}

extension UserDefaults {
    
    func getAccessToken() -> String? {
        guard let token = UserDefaults.standard.string(forKey: Keys.accessToken.rawValue) else {return nil}
        return token
    }
    
    func save(accessToken: String) -> Bool {
        UserDefaults.standard.setValue(accessToken, forKey: Keys.accessToken.rawValue)
        return UserDefaults.standard.synchronize()
    }
    
}

extension UIResponder {
    static var identifier: String {
        return String(describing: self)
    }
}
