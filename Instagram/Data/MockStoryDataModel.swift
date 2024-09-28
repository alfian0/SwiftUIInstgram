//
//  MockStoryDataModel.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import Foundation

var mockStoryData: [StoryDataModel] = [
	StoryDataModel(user: mockUserData[0], type: .myStory(isActive: false), stories: ["img_avatar_1", "img_avatar_2"]),
	StoryDataModel(user: mockUserData[1], type: .friendStory(isSeen: false), stories: ["img_avatar_5", "img_avatar_3"]),
	StoryDataModel(user: mockUserData[2], type: .friendStory(isSeen: false), stories: ["img_avatar_2"]),
	StoryDataModel(user: mockUserData[3], type: .friendStory(isSeen: false), stories: ["img_avatar_1", "img_avatar_4"]),
	StoryDataModel(user: mockUserData[4], type: .friendStory(isSeen: true), stories: ["img_avatar_3"])
]
