//
//  NewTweetViewController.swift
//  Twitter
//
//  Created by Nguyen Tran Duy Khang on 3/18/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController {
	@IBOutlet weak var tweetTextView: UITextView!
	
	@IBAction func cancel(_ sender: Any) {
		dismiss(animated: true)
	}
	
	
	@IBAction func tweet(_ sender: Any) {
		if !tweetTextView.text.isEmpty {
			TwitterAPICaller.client?.postTweet(tweetContent: tweetTextView.text,
											   success: {
				self.dismiss(animated: true)
			}, failure: { error in
				print("Error posting tweet: \(error.localizedDescription)")
			})
		} else {
			print("Empty tweet")
			self.dismiss(animated: true)
		}
	}
	
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
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
