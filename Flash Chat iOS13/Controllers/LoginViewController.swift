//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import AudioToolbox

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func clearError(_ sender: UITextField) {
        errorLabel.text = ""
    }
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let e = error{
                    self.errorLabel.text = e.localizedDescription
                    for _ in 1...5{
                        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                    }
                }else{
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }

        }
    }
    
}
