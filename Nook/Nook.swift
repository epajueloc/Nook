//
//  Nook.swift
//  Nook
//
//  Created by Enrique Pajuelo on 11/12/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import MapKit

class NookController: NSObject, MKAnnotation {
    
    var name:String?
    var coordinate: CLLocationCoordinate2D

    init(name:String,coordinate:CLLocationCoordinate2D){
        self.name = name
        self.coordinate = coordinate
    }
    
    func availability() -> NookAvailabilty {
        return NookAvailabilty.Red
        // do if statements for three types of availability
    }
    
    
    enum NookAvailabilty {
        case Red
        case Yellow
        case Green
    }
    
}

class NookViewController: UIViewController {
    
    static let sharedInstance = NookViewController()
    
    var nooks = [NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D()),NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D()),NookController(name:"Math Library",coordinate:CLLocationCoordinate2D()), NookController(name:"LaFun - Computer Lab",coordinate:CLLocationCoordinate2D()), NookController(name:"Geddes Hall",coordinate:CLLocationCoordinate2D()), NookController(name:"Bond Hall",coordinate:CLLocationCoordinate2D()), NookController(name:"Coleman Morse Center - 1st Floor",coordinate:CLLocationCoordinate2D()),NookController(name:"Coleman Morse Center - 2nd Floor",coordinate:CLLocationCoordinate2D()),NookController(name:"DeBartolo Hall - Bean Bag Room",coordinate:CLLocationCoordinate2D())]
    
    var nooks2 = [NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D()),NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D()),NookController(name:"Math Library",coordinate:CLLocationCoordinate2D()), NookController(name:"LaFun - Computer Lab",coordinate:CLLocationCoordinate2D())]
    
    var nooks3 = [NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D()),NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D())]
    
}
