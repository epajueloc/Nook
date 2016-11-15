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
