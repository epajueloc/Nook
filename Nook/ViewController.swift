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
    var availabilityPassed: NookAvailability!
    var availabilityToDisplay: String!
    var availabilityToUpdate: NookAvailability!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    
    @IBOutlet weak var progressArc: KDCircularProgress!
    
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    //maybe I'll need to remove IBOutlets for green/yellow/red if I use actions
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        greenButton.tag = 1
        availabilityToUpdate = NookAvailability.Green
    }
    
    @IBAction func yellowButtonPressed(_ sender: Any) {
        yellowButton.tag = 1
        availabilityToUpdate = NookAvailability.Yellow
    }
    
    @IBAction func redButtonPressed(_ sender: Any) {
        redButton.tag = 1
        availabilityToUpdate = NookAvailability.Red
    }
    //the red button pressed action is not here
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func availabilityToText() -> String {
        if availabilityPassed == .Red {
            availabilityToDisplay = "It's SO full"
            availabilityLabel.text = availabilityToDisplay
        }
        else if availabilityPassed == .Yellow {
            availabilityToDisplay = "Do as you wish"
            availabilityLabel.text = availabilityToDisplay
        }
        else {
            availabilityToDisplay = "There's no one there!"
            availabilityLabel.text = availabilityToDisplay
        }
        return availabilityToDisplay
    }
    
    func progressArcAngle() {
        if availabilityToUpdate == .Red {
            progressArc.angle = 360
        }
        else if availabilityToUpdate == .Yellow {
            progressArc.angle = 240
        }
        else {
            progressArc.angle = 120
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = namePassed
//        availabilityLabel.text = availabilityToDisplay
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        progressArc.angle = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

