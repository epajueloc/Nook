//
//  UserController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 11/28/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit

class UserController: NSObject {
    
    static var sharedInstance = UserController()
    var currentUser: User?
    fileprivate var userList: [User] = []
    
    func emailRegister(_ firstName:String, lastName:String, email:String, password:String, onCompletion:(User?,String?) -> ()) {
        
        currentUser = User(firstName:firstName, lastName:lastName, email:email, password:password)
        userList.append(currentUser!)
        onCompletion(currentUser, nil)
        
        // Persistence
        let defaults = UserDefaults.standard
        defaults.set(firstName, forKey: "firstName")
        defaults.set(lastName, forKey: "lastName")
        defaults.set(email, forKey: "email")
        defaults.set(password, forKey: "password")
        defaults.synchronize()
    }
    
    func emailLogin(_ firstName:String, lastName:String, email:String, password:String, onCompletion:(User?,String?) -> ()) {
        
        currentUser = User(firstName:firstName, lastName:lastName, email:email, password:password)
        onCompletion(currentUser, nil)
        
        for user in userList {
            if user.firstName == firstName && user.lastName == lastName && user.email == email && user.password == password {
                print("Good, they are an existing email user!")
            }
        }
        
        let defaults = UserDefaults.standard
        defaults.set(firstName, forKey: "firstName")
        defaults.set(lastName, forKey: "lastName")
        defaults.set(email, forKey: "email")
        defaults.set(password, forKey: "password")
        defaults.synchronize()
    }
    
    func logout(onCompletion: (String?) -> ()) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "fullName")
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "password")
        defaults.synchronize()
        
        self.currentUser = nil
        onCompletion(nil)
    }
    
}
