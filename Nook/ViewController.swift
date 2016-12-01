//
//  ViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 10/29/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    static let sharedInstance = ViewController()
    
    var titlePassed: String!
    var hoursPassed: String!
    var availabilityPassed: NookAvailability!
    var idPassed: Int!
    var coordinatePassed: CLLocationCoordinate2D!
    var distancePassed: Double!
    var availabilityToDisplay: String!
    var availabilityToUpdate: NookAvailability!
    var currentNook: NookController?
    var duplicateBool:Bool!
    
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    
    
    @IBOutlet weak var navigationBarTitle: UINavigationItem!
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var progressArc: KDCircularProgress!
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if checkDuplicates(titlePassed, coordinate: coordinatePassed, availability: availabilityPassed, hours: hoursPassed, id: idPassed) == false {
            addToFavorites()
        }
        else {
            let errorAlert = UIAlertController(title: "Error", message: "This nook is already in your favorites", preferredStyle: UIAlertControllerStyle.alert)
            let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in })
            errorAlert.addAction(dismissErrorAlert)
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        updateAvailability(availability: NookAvailability.Green)
        progressArcAngle(availability: NookAvailability.Green)

        // Add persistence here (store availability for specific nook)
        
    }
    
    @IBAction func yellowButtonPressed(_ sender: Any) {
        updateAvailability(availability: NookAvailability.Yellow)
        progressArcAngle(availability: NookAvailability.Yellow)
    }
    
    @IBAction func redButtonPressed(_ sender: Any) {
        updateAvailability(availability: NookAvailability.Red)
        progressArcAngle(availability: NookAvailability.Red)
    }
    
    func availabilityToText(availability: NookAvailability) {
        if availability == .Red {
            availabilityToDisplay = "It's SO full"
        }
        else if availability == .Yellow {
            availabilityToDisplay = "Do as you wish"
        }
        else if availability == .Green {
            availabilityToDisplay = "There's no one there!"
        }
        else {
            availabilityToDisplay = ""
        }
    }
    
    func updateAvailability(availability: NookAvailability) {
        availabilityToText(availability: availability)
        availabilityLabel.text = availabilityToDisplay
    }
    
    func progressArcAngle(availability: NookAvailability) {
        if availability == .Red {
            progressArc.angle = 360
        }
        else if availability == .Yellow {
            progressArc.angle = 240
        }
        else if availability == .Green {
            progressArc.angle = 120
        }
        else {
            progressArc.angle = 0
        }
    }
    
    func addToFavorites() {
        NookViewController.sharedInstance.favoriteNooks.append(NookController(title:titlePassed,coordinate:CLLocationCoordinate2D(),availability:availabilityPassed,hours:hoursPassed, id:idPassed, distance:distancePassed))
        
        // Persistence below is not letting the function addtoFavorites run
        
        // Persistence
//        let defaults = UserDefaults.standard
//        defaults.set(titlePassed, forKey: "title")
//        defaults.set(coordinatePassed.latitude, forKey: "latitude")
//        defaults.set(coordinatePassed.longitude, forKey: "longitude")
//        defaults.set(availabilityPassed, forKey: "availability")
//        defaults.set(hoursPassed, forKey: "hours")
//        defaults.set(idPassed, forKey: "id")
        
        
    }
    
    func removeFromFavorites(_ title:String, coordinate:CLLocationCoordinate2D, availability:NookAvailability, hours:String, id:Int) {
        
//        NookViewController.sharedInstance.favoriteNooks = NookViewController.sharedInstance.favoriteNooks.filter() { $0 !== NookController(title: titlePassed, coordinate: CLLocationCoordinate2D(), availability: availabilityPassed, hours: hoursPassed, id:idPassed) }
        
        // Need to change this remove function
        
        for nook in NookViewController.sharedInstance.favoriteNooks {
            if nook.title == title && nook.availability == availability && nook.hours == hours && nook.id == id {
                print("Nook has been deleted from your favorites")
                NookViewController.sharedInstance.favoriteNooks.removeFirst()
            }
        }
        
        
        // Is this right? Nope - should not be set
//        let defaults = UserDefaults.standard
//        defaults.set(titlePassed, forKey: "title")
//        defaults.set(coordinatePassed.latitude, forKey: "latitude")
//        defaults.set(coordinatePassed.longitude, forKey: "longitude")
//        defaults.set(availabilityPassed, forKey: "availability")
//        defaults.set(hoursPassed, forKey: "hours")
//        defaults.set(idPassed, forKey: "id")
//        defaults.synchronize()
        
    }
    
    func checkDuplicates(_ title:String, coordinate:CLLocationCoordinate2D, availability:NookAvailability, hours:String, id:Int) -> Bool {
        
        currentNook = NookController(title:titlePassed, coordinate:coordinatePassed, availability:availabilityPassed, hours:hoursPassed, id:idPassed, distance:distancePassed)
        
        // Note: not currently checking for coordinate equality or distance
        for nook in NookViewController.sharedInstance.favoriteNooks {
            if nook.title == title && nook.availability == availability && nook.hours == hours && nook.id == id {
                duplicateBool = true
            } else {
                duplicateBool = false
            }
        }
       return duplicateBool
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
        navigationBarTitle.title = titlePassed
        hoursLabel.text = hoursPassed
        updateAvailability(availability: availabilityPassed)
        progressArcAngle(availability: availabilityPassed)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenButton.layer.cornerRadius = 15
        yellowButton.layer.cornerRadius = 15
        redButton.layer.cornerRadius = 15
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

