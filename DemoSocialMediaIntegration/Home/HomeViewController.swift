//
//  HomeViewController.swift
//  DemoSocialMediaIntegration
//
//  Created by Macbook Air on 24/04/18.
//  Copyright © 2018 Saurabh. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        FBSDKProfile.loadCurrentProfile { (profile, error) in
            print(profile?.name!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
