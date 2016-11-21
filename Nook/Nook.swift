//
//  Nook.swift
//  Nook
//
//  Created by Enrique Pajuelo on 11/12/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import MapKit

enum NookAvailability:String {
    case Red = "red"
    case Yellow = "yellow"
    case Green = "green"
    case Empty = ""
}

class NookController: NSObject, MKAnnotation {
    
    var name:String?
    var coordinate: CLLocationCoordinate2D
    var availability: NookAvailability
    var hours:String?

    init(name:String,coordinate:CLLocationCoordinate2D,availability:NookAvailability,hours:String){
        self.name = name
        self.coordinate = coordinate
        self.availability = availability
        self.hours = hours
    }
    
    // Attempt to do persistence - need to add NSCoding for the class
    
//    required init?(coder aDecoder: NSCoder) {
//        name = (aDecoder.decodeObject(forKey: "name") as? String) ?? ""
//        coordinate = CLLocationCoordinate2D(latitude: aDecoder.decodeObject(forKey: "latitude") as? CLLocationDegrees ?? CLLocationDegrees(), longitude: aDecoder.decodeObject(forKey: "longitude") as? CLLocationDegrees ?? CLLocationDegrees())
//        availability = (aDecoder.decodeObject(forKey: "availability") as? NookAvailability) ?? .Empty
//        hours = (aDecoder.decodeObject(forKey: "hours") as? String) ?? ""
//    }
//    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(name, forKey: "name")
//        aCoder.encode(coordinate, forKey: "coordinate")
//        aCoder.encode(availability, forKey: "availability")
//        aCoder.encode(name, forKey: "hours")
//    }
    
}

class NookViewController: UIViewController {
    
    static let sharedInstance = NookViewController()
    
    var nooks = [
        NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "Open 24 hours"),
        NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "Open 24 hours"),
        NookController(name:"Math Library",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "9:00 am - Midnight"),
        NookController(name:"LaFun - Computer Lab",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "7:00 am - 4:00 am"),
        NookController(name:"Geddes Hall",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "8:00 am - 10:00pm"),
        NookController(name:"Bond Hall",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "9:00 am - 11:00pm"),
        NookController(name:"Coleman Morse Center - 1st Floor",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "7:00 am - 3:00 am"),
        NookController(name:"Coleman Morse Center - 2nd Floor",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "7:00 am - 3:00 am"),
        NookController(name:"DeBartolo Hall - Bean Bag Room",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "7:00 am - Midnight")
    ]
    
    var nooks2 = [
        NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "Open 24 hours"),
        NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "Open 24 hours"),
        NookController(name:"Math Library",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "9:00 - Midnight"),
        NookController(name:"LaFun - Computer Lab",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "7:00 am - 4:00am")
    ]
    
    var nooks3 = [
        NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "Open 24 hours"),
        NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(),availability:.Empty, hours: "Open 24 hours")
    ]
    
}
