//
//  ViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 10/29/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static let sharedInstance = ViewController()
    
    var nooks = ["Hesburgh Library - Fishbowl","Hesburgh Library - Reading Room","Math Library","LaFun - Computer Lab", "Geddes Hall", "Bond Hall", "Coleman Morse Center - 1st Floor", "Coleman Morse Center - 2nd Floor","DeBartolo Hall - Bean Bag Room"]
    
    var nooks2 = ["Hesburgh Library - Fishbowl","Hesburgh Library - Readin1g Room","Math Library","LaFun - Computer Lab"]
    
    var nooks3 = ["Hesburgh Library - Fishbowl","Hesburgh Library - Reading Room"]
    
    func populate(name:String) {
        nameLabel.text = name
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

