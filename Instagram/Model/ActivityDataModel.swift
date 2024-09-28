//
//  ActivityDataModel.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import Foundation

enum ActivityType {
	case liked(post: PostDataModel)
	case newFollower(user: UserDataModel)
	case suggestFollower(user: UserDataModel)
	case comment(user: UserDataModel, post: PostDataModel, comment: String)
}

struct ActivityDataModel: Identifiable {
	let id = UUID()
	let type: ActivityType
	let duration: String // Easier to show on UI.
	
	var user: UserDataModel {
		switch type {
			case let .liked(post):
				return post.user
			case let .newFollower(user):
				return user
			case let .suggestFollower(user):
				return user
			case let .comment(user, _, _):
				return user
		}
	}
}
