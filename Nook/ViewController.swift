//
//  ViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 10/29/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let sharedInstance = ViewController()
    
    var namePassed: String!
    var hoursPassed: String!
    var availabilityPassed: NookAvailability!
    var availabilityToDisplay: String!
    var availabilityToUpdate: NookAvailability!
    
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    
    
    @IBOutlet weak var navigationBarTitle: UINavigationItem!
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var progressArc: KDCircularProgress!
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        updateAvailability(availability: NookAvailability.Green)
        progressArcAngle(availability: NookAvailability.Green)
        
        // Trying to add persistence but don't know how to only persist availability
        
//        let manager = FileManager.default
//        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let fileURL = documents.appendingPathComponent("file.txt")
//        
//        let availability = Nook(NSKeyedArchiver.archiveRootObject(rootObject: Any, toFile: String)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
        navigationBarTitle.title = namePassed
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

