//
//  DataService.swift
//  AppShowcase
//
//  Created by Jay Bhavsar on 2016-09-07.
//  Copyright © 2016 zeroxp. All rights reserved.
//

import Foundation
import Firebase


class DataService {
    static let ds = DataService()
    
    private var _REF_BASE  = Firebase(url: "\(URL_BASE)")
    private var _REF_POSTS = Firebase(url: "\(URL_BASE)/posts")
    private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
    
    
    // MARK: Accessors
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_POSTS: Firebase {
        return _REF_POSTS
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS
    }
    
    var REF_CURRENT_USER: Firebase {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        return Firebase(url: "\(URL_BASE)").childByAppendingPath("users").childByAppendingPath(uid)
    }
    
    
    // MARK: User Creation
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}
