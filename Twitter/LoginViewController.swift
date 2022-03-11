//
//  LoginViewController.swift
//  Twitter
//
//  Created by Nguyen Tran Duy Khang on 3/10/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
		if isLoggedIn {
			self.performSegue(withIdentifier: "loginToHome", sender: self)
		}

	}
    
	@IBAction func onLoginButton(_ sender: Any) {
		let url = "https://api.twitter.com/oauth/request_token"
		TwitterAPICaller.client?.login(url: url, success: {
			self.performSegue(withIdentifier: "loginToHome", sender: self)
			UserDefaults.standard.set(true, forKey: "isLoggedIn")
		}, failure: { error in
			print("Could not login: \(error.localizedDescription)")
		})
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
