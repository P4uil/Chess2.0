//
//  LogInViewController.swift
//  Chess
//
//  Created by Павел Тоцкий on 30.03.2024.
//

import UIKit

// MARK: Log in

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTapStartButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapPlayAsGuestButton(_ sender: UIButton) {
        
    }
}

class LogInMenuViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var noAccountLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
// MARK: Methods
    
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
    }
    
    @IBAction func logInWithApple(_ sender: UIButton) {
        
    }
    
    @IBAction func logInWithGoogle(_ sender: UIButton) {
        
    }
}
