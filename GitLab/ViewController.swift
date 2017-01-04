//
//  ViewController.swift
//  GitLab
//
//  Created by Andrii Valkiv on 1/4/17.
//  Copyright © 2017 Andriy Valkiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var gitLabUrlField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gitLabUrlField.delegate = self
        userNameField.delegate  = self
        passwordField.delegate  = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if (textField == gitLabUrlField) {
            userNameField.becomeFirstResponder()
        }
        
        if (textField == userNameField) {
            passwordField.becomeFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        loginButton.isEnabled = authCredentialsDidEndEditing()
    }
    
    // Checks if authentication credentials were provided
    func authCredentialsDidEndEditing() -> Bool {
        guard let gitLabUrlText = gitLabUrlField.text,
              let userNameText  = userNameField.text,
              let passwordText  = passwordField.text else {
                return false
        }
        
        
        if (!gitLabUrlText.isEmpty
            && !userNameText.isEmpty
            && !passwordText.isEmpty) {
            return true
        }
        
        return false
    }
    
}
