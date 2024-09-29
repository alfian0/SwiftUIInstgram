//
//  StoryViewModel.swift
//  Instagram
//
//  Created by Alfian on 29/09/24.
//

import Combine

class StoryViewModel: ObservableObject {
	@Published var currentIndex = 0
	var viewModels: [StoryItemViewModel]
	var completion: (() -> Void)?
	
	init(currentIndex: Int, viewModels: [StoryItemViewModel], completion: (() -> Void)?) {
		self.currentIndex = currentIndex
		self.viewModels = viewModels
		self.viewModels.forEach { item in
			item.completion = { [weak self] in
				guard let self = self else { return }
				if self.currentIndex < (self.viewModels.count - 1) {
					self.currentIndex += 1
					self.viewModels[self.currentIndex].start()
				} else {
					self.completion?()
				}
			}
		}
		self.completion = completion
		self.viewModels[0].start()
	}
}
