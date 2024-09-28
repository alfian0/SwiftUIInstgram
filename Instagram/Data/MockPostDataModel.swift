//
//  MockPostDataModel.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import Foundation

let mockPostData: [PostDataModel] = [
	PostDataModel(
		user: UserDataModel(userName: "User1", profileImage: "img_avatar_1"),
		location: "New York",
		media: .image(postImage: "img_avatar_1", dimensions: Dimensions(width: 1080, height: 720)),
		isLiked: true,
		isSaved: false,
		likes: 230,
		views: 100,
		caption: "Loving the view!",
		time: "2h ago",
		isSponsored: false
	),
	PostDataModel(
		user: UserDataModel(userName: "User2", profileImage: "img_avatar_3"),
		location: nil,
		media: .video(videoUrl: "reel_1", dimensions: Dimensions(width: 1920, height: 1080), views: 1200),
		isLiked: false,
		isSaved: true,
		likes: 540,
		views: 100,
		caption: nil,
		time: "5h ago",
		isSponsored: true
	),
	PostDataModel(
		user: UserDataModel(userName: "User3", profileImage: "img_avatar_3"),
		location: "San Francisco",
		media: .image(postImage: "img_avatar_2", dimensions: Dimensions(width: 720, height: 1080)),
		isLiked: false,
		isSaved: false,
		likes: 320,
		views: 100,
		caption: "What a day at the beach!",
		time: "10h ago",
		isSponsored: false
	),
	PostDataModel(
		user: UserDataModel(userName: "User4", profileImage: "img_avatar_4"),
		location: nil,
		media: .video(videoUrl: "reel_1", dimensions: Dimensions(width: 1280, height: 720), views: 4000),
		isLiked: true,
		isSaved: false,
		likes: 850,
		views: 100,
		caption: "A quick workout session",
		time: "15h ago",
		isSponsored: true
	),
	PostDataModel(
		user: UserDataModel(userName: "User5", profileImage: "img_avatar_5"),
		location: "Tokyo",
		media: .image(postImage: "img_avatar_3", dimensions: Dimensions(width: 1080, height: 1080)),
		isLiked: true,
		isSaved: true,
		likes: 1340,
		views: 100,
		caption: "Tokyo at night",
		time: "1d ago",
		isSponsored: false
	)
]
