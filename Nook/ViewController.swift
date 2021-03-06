//
//  ViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 10/29/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

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
            
            let successAlert = UIAlertController(title: "Success", message: "The nook was successfully added to your favorites!", preferredStyle: UIAlertControllerStyle.alert)
            let dismissSuccessAlert = UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in })
            successAlert.addAction(dismissSuccessAlert)
            self.present(successAlert, animated: true, completion: nil)
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
        
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        ref.child("availability").child(titlePassed).setValue("green")
    }
    
    @IBAction func yellowButtonPressed(_ sender: Any) {
        updateAvailability(availability: NookAvailability.Yellow)
        progressArcAngle(availability: NookAvailability.Yellow)
        
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        ref.child("availability").child(titlePassed).setValue("yellow")
    }
    
    @IBAction func redButtonPressed(_ sender: Any) {
        updateAvailability(availability: NookAvailability.Red)
        progressArcAngle(availability: NookAvailability.Red)
        
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        ref.child("availability").child(titlePassed).setValue("red")
    }
    
    func availabilityToText(availability: NookAvailability) {
        if availability == .Red {
            availabilityToDisplay = "It's SO full"
        }
        else if availability == .Yellow {
            availabilityToDisplay = "It's not too bad"
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
        NookViewController.sharedInstance.saveToDevice()
    }
    
    func removeFromFavorites(_ title:String, coordinate:CLLocationCoordinate2D, availability:NookAvailability, hours:String, id:Int) {
        
        let nooks = NookViewController.sharedInstance.favoriteNooks
        var new_nooks = [NookController]()

        for nook in nooks {
            if nook.id != id {
                new_nooks.append(nook)
            }
        }
        NookViewController.sharedInstance.favoriteNooks = new_nooks
    }
    
    func checkDuplicates(_ title:String, coordinate:CLLocationCoordinate2D, availability:NookAvailability, hours:String, id:Int) -> Bool {
        
        currentNook = NookController(title:titlePassed, coordinate:coordinatePassed, availability:availabilityPassed, hours:hoursPassed, id:idPassed, distance:distancePassed)
        
        var duplicateBool = false
        for nook in NookViewController.sharedInstance.favoriteNooks {
            if nook.id == id {
                duplicateBool = true
            } else {
                duplicateBool = false
            }
        }
       return duplicateBool
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
        // Set availability to display based on Firebase value
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        ref.child("availability")
            .child(titlePassed)
            .observe(FIRDataEventType.value, with: { (snapshot) in
                if let value = snapshot.value as? String {
                    self.availabilityPassed = NookAvailability(rawValue: value)
                    self.updateAvailability(availability: self.availabilityPassed)
                    self.progressArcAngle(availability: self.availabilityPassed)
                }
        })
        
        navigationBarTitle.title = titlePassed
        hoursLabel.text = hoursPassed
        updateAvailability(availability: availabilityPassed)
        progressArcAngle(availability: availabilityPassed)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set corner radius
        greenButton.layer.cornerRadius = 15
        yellowButton.layer.cornerRadius = 15
        redButton.layer.cornerRadius = 15

        // Set colors to labels
        availabilityLabel.textColor = UIColor.init(red: 3/255, green: 44/255, blue: 90/255, alpha: 1.0)
        hoursLabel.textColor = UIColor.init(red: 3/255, green: 44/255, blue: 90/255, alpha: 1.0)
        greenButton.setTitleColor(UIColor.init(red: 3/255, green: 44/255, blue: 90/255, alpha: 1.0), for: .normal)
         yellowButton.setTitleColor(UIColor.init(red: 3/255, green: 44/255, blue: 90/255, alpha: 1.0), for: .normal)
         redButton.setTitleColor(UIColor.init(red: 3/255, green: 44/255, blue: 90/255, alpha: 1.0), for: .normal)
        
    }
}

