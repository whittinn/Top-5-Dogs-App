//
//  SignInViewController.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/17/21.
//

import UIKit
import FirebaseAuth





class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var signOut: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var backToButton: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            self.button.isHidden = true
            self.emailText.isHidden = true
            self.passwordText.isHidden = true
            self.label.isHidden = true
        }
    }

    @IBAction func backToButton(_ sender: Any) {
    }
    @IBAction func loginButton(_ sender: Any) {
        
        guard let email = emailText.text, !email.isEmpty, let password = passwordText.text, !email.isEmpty else {
            print("Missing field data")
            return
        }
        //get auth instance
        // attempt sign in
        //if failure, present alert to create account
        // if user continues, create account
        
        //check sign in on app launch
        //allow user to sign out with button
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] (results, error) in
            guard let self = self else {return}
            
            guard error == nil else {
                //show account creation
                self.showCreationAccount(email: email, password: password)
                return
                
            }
            
            print("You have signed in")
            self.emailText.isHidden = true
            self.passwordText.isHidden = true
            self.button.isHidden = true
            self.label.isHidden = true
            
          
            
        }
        
        
       
       

        
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        
        do{
            try FirebaseAuth.Auth.auth().signOut()
            self.emailText.isHidden = false
            self.passwordText.isHidden = false
            self.button.isHidden = false
            self.label.isHidden = false
            
        }catch{
            print("An error occurred")
        }
    }
    
    
    func showCreationAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create account?", preferredStyle: .alert)
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self ](results, error) in
            guard let self = self else {return}
            
            guard error == nil else {
                print("Account creation failed")
                return
            }
            
            print("You have signed in")
            self.emailText.isHidden = true
            self.passwordText.isHidden = true
            self.button.isHidden = true
        }
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in}))
        
        present(alert, animated: true)
    }
    
    
    
    
    
}


