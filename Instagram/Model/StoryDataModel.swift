//
//  StoryDataModel.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import Foundation

enum StoryType: Equatable {
	case myStory(isActive: Bool)
	case friendStory(isSeen: Bool)
}

struct StoryDataModel: Identifiable, Equatable {
	var id = UUID()
	var user: UserDataModel
	var type: StoryType
	var stories: [String]
}

extension StoryDataModel {
	var isMystory: Bool {
		switch type {
			case .myStory:
				return true
			case .friendStory:
				return false
		}
	}
	
	var isSeen: Bool {
		switch type {
			case let .myStory(isActive):
				return !isActive
			case let .friendStory(isSeen):
				return isSeen
		}
	}
}
