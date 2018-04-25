//
//  HomeView.swift
//  DemoSocialMediaIntegration
//
//  Created by Macbook Air on 24/04/18.
//  Copyright © 2018 Saurabh. All rights reserved.
//

import UIKit
import  FBSDKLoginKit
import FBSDKCoreKit

class HomeView: UIView {
    
    @IBOutlet weak var profilePictureView: FBSDKProfilePictureView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profilePictureView.layer.cornerRadius = profilePictureView.frame.height/2
    }
    
    func setDataSource(dataSource: [String: AnyObject]) {
        showUserProfile(dataSource: dataSource)
    }
    
    // MARK: helpers
    private func showUserProfile(dataSource: [String: AnyObject]) {
        if let name = dataSource["name"] as? String {
            self.nameLabel.text = name
        }
        if let email = dataSource["email"] as? String {
            self.emailLabel.text = email
        }
        if let profileId = dataSource["id"] as? String {
            self.profilePictureView.profileID = profileId
            self.profilePictureView.pictureMode = .normal
            self.profilePictureView.clipsToBounds = true
        }
    }
}
