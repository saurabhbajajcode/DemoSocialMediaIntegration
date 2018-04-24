//
//  LoginOptionsViewController.swift
//  DemoSocialMediaIntegration
//
//  Created by Macbook Air on 24/04/18.
//  Copyright © 2018 Saurabh. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class LoginOptionsViewController: UIViewController {

    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fbLoginButton.readPermissions = ["public_profile", "email"]
        
        // register for facebook login status notifications
        registerForFacebookTokenChange()
        
        // check if user is already logged in using facebook
        if (FBSDKAccessToken.current() != nil) {
            // show home screen
            showHomeScreen()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// adds observer for FBSDKAccessTokenDidChange notification and handles user change
    private func registerForFacebookTokenChange() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.FBSDKAccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            print(notification.userInfo!)
            if notification.userInfo?[FBSDKAccessTokenDidChangeUserID] as? Bool == true {
                // handle user change
                if (FBSDKAccessToken.current() != nil) {
                    self.showHomeScreen()
                } else {
                    // logout
                    
                }
            }
        }
    }
    
    // MARK: helpers
    /// navigates to home screen
    private func showHomeScreen() {
        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "showHome", sender: self)
            let alert = UIAlertController(title: "Success", message: "Logged In", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.show(alert, sender: nil)
        }
    }
}
