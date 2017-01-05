//
//  RegisterViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 11/28/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var newUser: User?
    
    // MARK: IBOutlets
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // Amount that screen moves with keyboard
    let movement:CGFloat = 130.0
    
    
    // MARK: IBActions
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let onCompletion = {(user: User?, message:String?) in
            
            
            // Show error mesage saying user is not valid
            if user == nil {
                let errorAlert = UIAlertController(title: "Error", message: "User is not valid", preferredStyle: UIAlertControllerStyle.alert)
                let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                errorAlert.addAction(dismissErrorAlert)
                self.present(errorAlert, animated: true, completion: nil)
            }
            else if self.emailField.text!.isValidEmail() == false {
                let errorAlert = UIAlertController(title: "Error", message: "Email is not valid", preferredStyle: UIAlertControllerStyle.alert)
                let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in })
                errorAlert.addAction(dismissErrorAlert)
                self.present(errorAlert, animated: true, completion: nil)
            }
            else if self.passwordField.text!.characters.count < 6 {
                let errorAlert = UIAlertController(title: "Error", message: "Password must be at least six characters long", preferredStyle: UIAlertControllerStyle.alert)
                let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in })
                errorAlert.addAction(dismissErrorAlert)
                self.present(errorAlert, animated: true, completion: nil)
            }
            else {
                let viewController = UIStoryboard(name:"Main",bundle:nil).instantiateInitialViewController()
                let window = UIApplication.shared.keyWindow
                window?.rootViewController = viewController
                
                // Dismissing keyboard - returning view to normal bounds
                self.dismissKeyboard()
                self.textFieldDidEndEditing(self.firstNameField)
                self.textFieldDidEndEditing(self.lastNameField)
                self.textFieldDidEndEditing(self.emailField)
                self.textFieldDidEndEditing(self.passwordField)
            }
        }
        
        UserController.sharedInstance.emailRegister(firstNameField.text!, lastName: lastNameField.text!, email: emailField.text!, password: passwordField.text!, onCompletion: onCompletion)
        
    }

    @IBAction func firstNameFieldReturned(_ sender: UITextField) {
        lastNameField.becomeFirstResponder()
    }
    
    @IBAction func lastNameFieldReturned(_ sender: UITextField) {
        emailField.becomeFirstResponder()
    }
    
    @IBAction func emailFieldReturned(_ sender: UITextField) {
        passwordField.becomeFirstResponder()
    }
    
    @IBAction func passwordFieldReturned(_ sender: UITextField) {
        passwordField.resignFirstResponder()
    }
    
    // MARK: Initial View

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 15
        
        // Set delegates
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        // Dismiss keyboard when tap on screen
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target:self,action:#selector(RegisterViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Other functions
    
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
