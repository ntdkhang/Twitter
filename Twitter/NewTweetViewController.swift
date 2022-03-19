//
//  NewTweetViewController.swift
//  Twitter
//
//  Created by Nguyen Tran Duy Khang on 3/18/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController, UITextViewDelegate {
	@IBOutlet weak var tweetTextView: UITextView! {
		didSet {
			tweetTextView.delegate = self
		}
	}
	@IBOutlet weak var characterCountLabel: UILabel!
	
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
	
	func textView(_ textView: UITextView,
				  shouldChangeTextIn range: NSRange,
				  replacementText text: String) -> Bool {
		let characterLimit = 280
		let newText = NSString(string: textView.text!).replacingCharacters(in: range,
																		  with: text)
		characterCountLabel.text = "\(newText.count)/280"
		return newText.count < characterLimit
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
