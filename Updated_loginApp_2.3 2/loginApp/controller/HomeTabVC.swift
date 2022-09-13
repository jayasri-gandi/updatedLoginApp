//
//  HomeTabVC.swift
//  loginApp
//
//  Created by Jayasri  on 07/09/22.
//

import UIKit

class HomeTabVC: UIViewController {
    
    var userId: String! = nil
    var userInfo: String! = nil
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userIdLabel.text = userId.capitalized
        userInfoLabel.text = userInfo
    }
}
