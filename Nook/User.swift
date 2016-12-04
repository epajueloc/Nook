//
//  User.swift
//  Nook
//
//  Created by Enrique Pajuelo on 11/28/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {

    var firstName:String
    var lastName:String
    var email:String
    var password:String
    
    init(firstName:String,lastName:String,email:String,password:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    required init?(coder: NSCoder) {
        firstName = coder.decodeObject(forKey: "firstName") as? String ?? ""
        lastName = coder.decodeObject(forKey: "lastName") as? String ?? ""
        email = coder.decodeObject(forKey: "email") as? String ?? ""
        password = coder.decodeObject(forKey: "password") as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(password, forKey: "password")
    }
    
}
