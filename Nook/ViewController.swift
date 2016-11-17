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
    var availabilityPassed: TableViewController.NookAvailability!
    var availabilityToDisplay: String!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    //maybe I'll need to remove IBOutlets for green/yellow/red if I use actions
    
    @IBAction func greenButtonPressed(_ sender: Any) {
//        var availability = NookController.NookAvailability.Green
    }
    
    @IBAction func yellowButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var redButtonPressed: UIButton!
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = namePassed
        availabilityLabel.text = availabilityToDisplay
    }
    
    func availabilityToText() -> String {
        if availabilityPassed == .Red {
            availabilityToDisplay = "It's SO full"
        }
        if availabilityPassed == .Yellow {
            availabilityToDisplay = "Do as you wish"
        }
        if availabilityPassed == .Green {
            availabilityToDisplay = "There's no one there!"
        }
        return availabilityToDisplay
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

