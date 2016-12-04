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
    
    @IBAction func registerButtonPressed(_ sender: Any) {
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
