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
		
	}

}
