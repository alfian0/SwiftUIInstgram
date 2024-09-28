//
//  MockActivityDataModel.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import Foundation

let mockActivitiesData: [ActivityDataModel] = [
	ActivityDataModel(type: .liked(post: mockPostData[0]), duration: "2h ago"),
	ActivityDataModel(type: .newFollower(user: mockUserData[2]), duration: "3h ago"),
	ActivityDataModel(type: .suggestFollower(user: mockUserData[0]), duration: "4h ago"),
	ActivityDataModel(type: .comment(user: mockUserData[1], post: mockPostData[2], comment: "This is awesome! @john_doe"), duration: "5h ago"),
	ActivityDataModel(type: .liked(post: mockPostData[2]), duration: "6h ago")
]
