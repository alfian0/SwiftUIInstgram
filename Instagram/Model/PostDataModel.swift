//
//  PostDataModel.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import Foundation

struct PostDataModel: Identifiable {
	var id = UUID()
	var user: UserDataModel
	var location: String?
	var media: MediaType
	var isLiked: Bool
	var isSaved: Bool
	var likes: Int
	var views: Int
	var caption: String?
	var time: String
	var isSponsored: Bool
	
	// MARK: - MediaType Enum
	enum MediaType {
		case image(postImage: String, dimensions: Dimensions)
		case video(videoUrl: String, dimensions: Dimensions, views: Int)
	}
	
	var cover: String {
		switch media {
			case let .image(postImage, _):
				return postImage
			case .video:
				return "img_avatar_\(Int.random(in: 1...5))"
		}
	}
}

struct Dimensions: Identifiable {
	var id = UUID()
	var width: Float
	var height: Float
}
