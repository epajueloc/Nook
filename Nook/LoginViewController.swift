//
//  LoginViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 12/1/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!

    // MARK: IBActions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        let application = UIApplication.shared
        let window = application.keyWindow
        window?.rootViewController = viewController
    }
    
    // Initial view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set corner radius of buttons
        registerButton.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        
        // Change borders
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.init(red: 3/255, green: 44/255, blue: 90/255, alpha: 1.0).cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
