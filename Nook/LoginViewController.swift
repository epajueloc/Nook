//
//  LoginViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 12/1/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: IBOutlets
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!

    // Amount that screen moves with keyboard
    let movement:CGFloat = 130.0
    
    // MARK: IBActions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            if error == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController()
                let application = UIApplication.shared
                let window = application.keyWindow
                window?.rootViewController = viewController
            } else {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    switch errorCode {
                    case .errorCodeUserNotFound:
                        let errorAlert = UIAlertController(title: "Error", message: "User not found", preferredStyle: UIAlertControllerStyle.alert)
                        let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                        errorAlert.addAction(dismissErrorAlert)
                        self.present(errorAlert, animated: true, completion: nil)
                    case .errorCodeWrongPassword:
                        let errorAlert = UIAlertController(title: "Error", message: "Wrong password", preferredStyle: UIAlertControllerStyle.alert)
                        let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                        errorAlert.addAction(dismissErrorAlert)
                        self.present(errorAlert, animated: true, completion: nil)
                    case .errorCodeNetworkError:
                        let errorAlert = UIAlertController(title: "Error", message: "There was a network error", preferredStyle: UIAlertControllerStyle.alert)
                        let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                        errorAlert.addAction(dismissErrorAlert)
                        self.present(errorAlert, animated: true, completion: nil)
                    default:
                        let errorAlert = UIAlertController(title: "Error", message: "Sorry! There was an error login in", preferredStyle: UIAlertControllerStyle.alert)
                        let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                        errorAlert.addAction(dismissErrorAlert)
                        self.present(errorAlert, animated: true, completion: nil)
                    }
                }
            }
        }
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
    
    @IBAction func emailFieldReturned(_ sender: UITextField) {
        passwordField.becomeFirstResponder()
    }
    
    @IBAction func passwordFieldReturned(_ sender: UITextField) {
        passwordField.resignFirstResponder()
    }
    
    // Initial view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set delegates
        emailField.delegate = self
        passwordField.delegate = self
        
        // Set corner radius of buttons
        registerButton.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        
        // Change borders
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.init(red: 3/255, green: 44/255, blue: 90/255, alpha: 1.0).cgColor
        
        // Dismiss keyboard when tap on screen
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target:self,action:#selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Other functions
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.bounds = self.view.bounds.offsetBy(dx: 0, dy: self.movement)
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.bounds = self.view.bounds.offsetBy(dx: 0, dy: -self.movement)
        })
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
