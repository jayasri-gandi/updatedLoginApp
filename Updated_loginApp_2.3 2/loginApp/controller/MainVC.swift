//
//  ViewController.swift
//  loginApp
//
//  Created by Jayasri  on 01/09/22.
//

//import UIKit
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit
import FBSDKLoginKit
import UIKit

class MainVC: UIViewController, LoginButtonDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(user.userID!)
        }
    }
    
    var userGoogleemailID:String!
    
    @IBOutlet var faceBookView:UIView!
    let loginButton = FBLoginButton()
       override func viewDidLoad() {
        super.viewDidLoad()
           if let token = AccessToken.current,
                   !token.isExpired {
               let token = token.tokenString
               
               let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["feilds": "email,name"], tokenString: token, version: nil, httpMethod: .get)
               request.start(completionHandler: { connection , result , error in print("\(result)")
                       })
               }
           else{
               loginButton.center = faceBookView.center
               loginButton.delegate = self
               loginButton.isHidden = true
               faceBookView.addSubview(loginButton)
           }
           }
func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
    
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    }
    
    @IBAction func onTapfacebookBtn(_ sender: Any) {
//        let fbLoginManager : LoginManager = LoginManager()
//        fbLoginManager.logIn([.publicProfile, .email ], viewController: self) { (result) in
//                switch result{
//                case .cancelled:
//                    print("Cancel button click")
//                case .success:
//                    let params = ["fields" : "id, name, first_name, last_name, picture.type(large), email "]
//                    let graphRequest = FBSDKGraphRequest.init(graphPath: "/me", parameters: params)
//                    let Connection = FBSDKGraphRequestConnection()
//                    Connection.add(graphRequest) { (Connection, result, error) in
//                        let info = result as! [String : AnyObject]
//                        print(info["name"] as! String)
//                    }
//                    Connection.start()
//                default:
//                    print("??")
//                }
//            }
        print("Facebook Taped")
        }
//        self.loginButton.sendActionsForControlEvents: UIControlEventTouchUpInside
    
        @IBAction func onTapGoogleBtn(_ sender: Any) {
            
            let clientId = "516444324421-7359v5mt4h2akcvqsgcg2vhebsrlc4kb.apps.googleusercontent.com"
           let signInConfig = GIDConfiguration(clientID: clientId)
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
                guard let user = user else { return }
                let emailAddress = user.profile?.email
            print(emailAddress!)
                let fullName = user.profile?.name
            print(fullName!)
                let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            print(profilePicUrl!)

            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabBarVC") as! mainTabBarVC
            vc.userId = String("Name: \(user.profile!.name)")
            vc.userInfo = String("Email: \(user.profile!.email)")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
       
    
    @IBAction func signUpBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Signup") as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as! loginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

