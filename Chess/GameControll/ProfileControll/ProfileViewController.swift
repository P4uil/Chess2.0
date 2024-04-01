//
//  ProfileViewController.swift
//  Chess
//
//  Created by Павел Тоцкий on 01.04.2024.
//

import Foundation
import UIKit



class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var achivements: UILabel!
    @IBOutlet weak var achivementsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func didTapSettingsButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapAddFriendButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapShareButton(_ sender: UIButton) {
    }
    
    
}

class SettingsViewController: UIViewController {
    
}
