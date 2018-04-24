//
//  HomeViewController.swift
//  DemoSocialMediaIntegration
//
//  Created by Macbook Air on 24/04/18.
//  Copyright © 2018 Saurabh. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // get email and gender from facebook
        let connection = FBSDKGraphRequestConnection()
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, email"])
        connection.add(graphRequest) { (connection, response, error) in
            print("Facebook graph result: ", response!)
            if let profileDict = response as? [String: AnyObject] {
                (self.view as? HomeView)?.setDataSource(dataSource: profileDict)
            }
        }
        connection.start()
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
