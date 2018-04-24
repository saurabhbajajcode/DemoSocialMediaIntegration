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
    
    private var isLoggedIn: Bool {
        if (FBSDKAccessToken.current() != nil) {
            return true
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // register for facebook login status notifications
        registerForFacebookTokenChange()
        
        // check if user is already logged in using facebook
        if isLoggedIn {
            // show home screen
            showHomeScreen()
        }
    }
    
    /** override viewDidAppear to check current login status after facebook login screen is dismissed.
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // check if user is already logged in using facebook
        if isLoggedIn {
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
            self.performSegue(withIdentifier: "showHome", sender: self)
        }
    }
}
