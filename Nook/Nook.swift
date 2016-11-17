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
    var availability: TableViewController.NookAvailability

    init(name:String,coordinate:CLLocationCoordinate2D,availability:TableViewController.NookAvailability){
        self.name = name
        self.coordinate = coordinate
        self.availability = availability
    }
    
}

class NookViewController: UIViewController {
    
    static let sharedInstance = NookViewController()
    
    var nooks = [NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(),availability:.Red),NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(),availability:.Red),NookController(name:"Math Library",coordinate:CLLocationCoordinate2D(),availability:.Yellow), NookController(name:"LaFun - Computer Lab",coordinate:CLLocationCoordinate2D(),availability:.Green), NookController(name:"Geddes Hall",coordinate:CLLocationCoordinate2D(),availability:.Red), NookController(name:"Bond Hall",coordinate:CLLocationCoordinate2D(),availability:.Yellow), NookController(name:"Coleman Morse Center - 1st Floor",coordinate:CLLocationCoordinate2D(),availability:.Green),NookController(name:"Coleman Morse Center - 2nd Floor",coordinate:CLLocationCoordinate2D(),availability:.Red),NookController(name:"DeBartolo Hall - Bean Bag Room",coordinate:CLLocationCoordinate2D(),availability:.Red)]
    
    var nooks2 = [NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(),availability:.Green),NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(),availability:.Red),NookController(name:"Math Library",coordinate:CLLocationCoordinate2D(),availability:.Yellow), NookController(name:"LaFun - Computer Lab",coordinate:CLLocationCoordinate2D(),availability:.Red)]
    
    var nooks3 = [NookController(name:"Hesburgh Library - Fishbowl",coordinate:CLLocationCoordinate2D(),availability:.Red),NookController(name:"Hesburgh Library - Reading Room",coordinate:CLLocationCoordinate2D(),availability:.Yellow)]
    
}
