//
//  mainTabBarVC.swift
//  loginApp
//
//  Created by Udaydeep R on 20/06/1944 Saka.
//

import UIKit
import SwiftUI

class mainTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    var userId: String!
    var userInfo: String!
    
      override func viewDidLoad() {
        super.viewDidLoad()
          self.delegate = self
          guard let viewController = viewControllers else { return }
          for vc in viewController {
              if let tab = vc as? HomeTabVC {
                  tab.userId = userId
                  tab.userInfo = userInfo
              }
          }
    }
}
