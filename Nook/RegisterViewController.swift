//
//  RegisterViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 11/28/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import Firebase

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
        
        
        FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            if error == nil {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController()
                let application = UIApplication.shared
                let window = application.keyWindow
                window?.rootViewController = viewController
                
                let ref: FIRDatabaseReference = FIRDatabase.database().reference()
                
                if self.firstNameField.text != nil {
                    ref.child("users").child((user?.uid)!).child("firstName").setValue(self.firstNameField.text)
                }
                
                if self.lastNameField.text != nil {
                    ref.child("users").child((user?.uid)!).child("lastName").setValue(self.lastNameField.text)
                }
                
                // Dismissing keyboard - returning view to normal bounds
                self.dismissKeyboard()
                self.textFieldDidEndEditing(self.firstNameField)
                self.textFieldDidEndEditing(self.lastNameField)
                self.textFieldDidEndEditing(self.emailField)
                self.textFieldDidEndEditing(self.passwordField)
                
            } else {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    switch errorCode {
                    case .errorCodeInvalidEmail:
                        let errorAlert = UIAlertController(title: "Error", message: "Email is not valid", preferredStyle: UIAlertControllerStyle.alert)
                        let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                        errorAlert.addAction(dismissErrorAlert)
                        self.present(errorAlert, animated: true, completion: nil)
                    case .errorCodeWeakPassword:
                        let errorAlert = UIAlertController(title: "Error", message: "Password is too weak", preferredStyle: UIAlertControllerStyle.alert)
                        let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                        errorAlert.addAction(dismissErrorAlert)
                        self.present(errorAlert, animated: true, completion: nil)
                    case .errorCodeEmailAlreadyInUse:
                        let errorAlert = UIAlertController(title: "Error", message: "Email is already in use", preferredStyle: UIAlertControllerStyle.alert)
                        let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                        errorAlert.addAction(dismissErrorAlert)
                        self.present(errorAlert, animated: true, completion: nil)
                    default:
                        let errorAlert = UIAlertController(title: "Error", message: "The email or the password are invalid", preferredStyle: UIAlertControllerStyle.alert)
                        let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .default)  { (action: UIAlertAction) in }
                        errorAlert.addAction(dismissErrorAlert)
                        self.present(errorAlert, animated: true, completion: nil)
                    }
                }
            }
        }
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
