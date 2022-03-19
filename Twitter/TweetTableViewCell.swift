//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Nguyen Tran Duy Khang on 3/11/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class TweetTableViewCell: UITableViewCell {

	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var tweetContentLabel: UILabel!
	
	@IBOutlet weak var likeButton: UIButton!
	@IBOutlet weak var retweetButton: UIButton!
	
	var liked = false {
		didSet {
			if liked {
				likeButton.setImage(UIImage(systemName: "heart.fill")!,
									for: UIControl.State.normal)
				likeButton.tintColor = .red
			} else {
				likeButton.setImage(UIImage(systemName: "heart")!,
									for: UIControl.State.normal)
				likeButton.tintColor = .secondaryLabel
			}
		}
	}
	var retweeted = false {
		didSet {
			if retweeted {
				retweetButton.tintColor = .green
			} else {
				retweetButton.tintColor = .secondaryLabel
			}
		}
	
	}
	var id: Int = -1
	
	@IBAction func like(_ sender: Any) {
		if liked {
			TwitterAPICaller.client?.removeLikeTweet(tweetID: id) {
				self.liked = false
			} failure: {
				print("Cannot remove like: \($0.localizedDescription)")
			}
		} else {
			TwitterAPICaller.client?.likeTweet(tweetID: id) {
				self.liked = true
			} failure: {
				print("Cannot like tweet: \($0.localizedDescription)")
			}
		}
	}
	
	@IBAction func retweet(_ sender: Any) {
		if retweeted {
			TwitterAPICaller.client?.unRetweet(tweetID: id) {
				self.retweeted = false
			} failure: {
				print("Cannot un-retweet: \($0.localizedDescription)")
			}
		} else {
			TwitterAPICaller.client?.retweet(tweetID: id) {
				self.retweeted = true
			} failure: {
				print("Cannot retweet: \($0.localizedDescription)")
			}
		}
	}
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configure(with tweet: Tweet) {
		userNameLabel.text! = tweet.user.name
		tweetContentLabel.text! = tweet.content
		let imgUrl = URL(string: tweet.user.profileImageURL)!
		if let imgData = try? Data(contentsOf: imgUrl) {
			profileImageView.image = UIImage(data: imgData)
		}
		liked = tweet.liked
		retweeted = tweet.retweeted
		id = tweet.id
	}

}
