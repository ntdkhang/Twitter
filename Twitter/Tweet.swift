//
//  Tweet.swift
//  Twitter
//
//  Created by Nguyen Tran Duy Khang on 3/11/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import Foundation

struct Tweet: Codable {
	let content: String
	let user: User
	let id: Int // this must be used with a 64-bit machine otherwise it will crash
	let liked: Bool
	let retweeted: Bool
	
	enum CodingKeys: String, CodingKey {
		case content = "text"
		case user
		case id
		case liked = "favorited"
		case retweeted
	}
}

struct User: Codable {
	let name: String
	let profileImageURL: String
	
	enum CodingKeys: String, CodingKey {
		case profileImageURL = "profile_image_url_https"
		case name
	}
}
