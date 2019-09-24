//
//  LocalData.swift
//  Music App
//
//  Created by Afnan on 7/16/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import Foundation


class LocalData {
    
    static let shared = LocalData()
    
    let userDefualts = UserDefaults.standard
    
    //MARK:- Access Token handle
    func saveAccessToken (accessToken : String) {
        userDefualts.set(accessToken, forKey: "accessToken")
        userDefualts.synchronize()
    }
    func getAccessToken () -> String? {
       return userDefualts.value(forKey: "accessToken") as? String
    }
    
    func deleteAccessToken()  {
        userDefualts.removeObject(forKey: "accessToken")
    }
    
    
    
    
    
}
