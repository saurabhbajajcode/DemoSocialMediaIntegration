//
//  LoginOptionsView.swift
//  DemoSocialMediaIntegration
//
//  Created by Macbook Air on 24/04/18.
//  Copyright © 2018 Saurabh. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginOptionsView: UIView {
    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubviews()
    }
    
    // MARK: helpers
    private func setupSubviews() {
        fbLoginButton.readPermissions = ["public_profile", "email"]
    }
}
