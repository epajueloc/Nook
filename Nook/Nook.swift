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
    var id:Int

    init(name:String,coordinate:CLLocationCoordinate2D,availability:NookAvailability,hours:String,id:Int){
        self.name = name
        self.coordinate = coordinate
        self.availability = availability
        self.hours = hours
        self.id = id
    }
    
    
    // Check the values after "??"
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        coordinate = CLLocationCoordinate2D(
            latitude: aDecoder.decodeObject(forKey: "latitude") as? CLLocationDegrees ?? 0,
            longitude: aDecoder.decodeObject(forKey: "longitude") as? CLLocationDegrees ?? 0
        )
        availability = aDecoder.decodeObject(forKey: "availability") as? NookAvailability ?? .Empty
        hours = aDecoder.decodeObject(forKey: "hours") as? String ?? ""
        id = aDecoder.decodeObject(forKey: "id") as? Int ?? Int()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(coordinate.latitude, forKey: "latitute")
        aCoder.encode(coordinate.longitude, forKey: "longitude")
        aCoder.encode(availability, forKey: "availability")
        aCoder.encode(name, forKey: "hours")
        aCoder.encode(id, forKey: "id")
    }
    
}

class NookViewController: UIViewController {
    
    static let sharedInstance = NookViewController()
    
    var nooks = [
        NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(latitude:41.702308, longitude:-86.234282),availability:.Empty, hours: "Open 24 hours", id:1),
        NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(latitude:41.702308, longitude:-86.234282),availability:.Empty, hours: "Open 24 hours", id:2),
        NookController(name:"Math Library",coordinate:CLLocationCoordinate2D(latitude:41.701003,longitude:-86.237520),availability:.Empty, hours: "9:00 am - Midnight", id:3),
        NookController(name:"LaFun - Computer Lab",coordinate:CLLocationCoordinate2D(latitude:41.701884, longitude:-86.237649),availability:.Empty, hours: "7:00 am - 4:00 am", id:3),
        NookController(name:"Geddes Hall",coordinate:CLLocationCoordinate2D(latitude:41.702782, longitude:-86.235331),availability:.Empty, hours: "8:00 am - 10:00pm", id:4),
        NookController(name:"Bond Hall",coordinate:CLLocationCoordinate2D(latitude:41.701316, longitude: -86.241951),availability:.Empty, hours: "9:00 am - 11:00pm", id:5),
        NookController(name:"Coleman Morse Center - 1st Floor",coordinate:CLLocationCoordinate2D(latitude:41.700506, longitude:-86.240567),availability:.Empty, hours: "7:00 am - 3:00 am", id:6),
        NookController(name:"Coleman Morse Center - 2nd Floor",coordinate:CLLocationCoordinate2D(latitude:41.700506, longitude:-86.240567),availability:.Empty, hours: "7:00 am - 3:00 am", id:7),
        NookController(name:"DeBartolo Hall - Bean Bag Room",coordinate:CLLocationCoordinate2D(latitude:41.698512, longitude:-86.236286),availability:.Empty, hours: "7:00 am - Midnight", id:8)
    ]
    
    var nooks2 = [
        NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(latitude:41.702308, longitude:-86.234282),availability:.Empty, hours: "Open 24 hours", id:1),
        NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(latitude:41.702308, longitude:-86.234282),availability:.Empty, hours: "Open 24 hours", id:2),
        NookController(name:"Math Library",coordinate:CLLocationCoordinate2D(latitude:41.701003,longitude:-86.237520),availability:.Empty, hours: "9:00 - Midnight", id:3),
        NookController(name:"LaFun - Computer Lab",coordinate:CLLocationCoordinate2D(latitude:41.701884, longitude:-86.237649),availability:.Empty, hours: "7:00 am - 4:00am", id:4)
    ]
    
    var nooks3 = [
        NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(latitude:41.702308, longitude:-86.234282),availability:.Empty, hours: "Open 24 hours", id:1),
        NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(latitude:41.702308, longitude:-86.234282),availability:.Empty, hours: "Open 24 hours", id:2)
    ]
    
    // Create array for favorites. Need to set them to nothing
    var favoriteNooks = [NookController(name:"",coordinate:CLLocationCoordinate2D(),availability:.Empty,hours:"",id:0)]
    
}
