//
//  StoryItemViewModel.swift
//  Instagram
//
//  Created by Alfian on 29/09/24.
//

import Foundation
import Combine

protocol TimerProtocol {
	func getTimerPublisher() -> AnyPublisher<Date, Never>
	func stop()
}

extension Timer.TimerPublisher: TimerProtocol {
	func getTimerPublisher() -> AnyPublisher<Date, Never> {
		self
			.autoconnect()
			.eraseToAnyPublisher()
	}
	
	func stop() {
		self.connect().cancel()
	}
}

class StoryItemViewModel: ObservableObject {
	@Published var timerProgress = 0.0
	@Published var currentItemIndex = 0
	var completion: (() -> Void)?
	
	var story: StoryDataModel
	private var timer: TimerProtocol
	private var cancellables: Set<AnyCancellable> = []
	
	init(
		story: StoryDataModel,
		timer: TimerProtocol,
		completion: (() -> Void)? = nil
	) {
		self.story = story
		self.timer = timer
		self.completion = completion
	}
	
	func start() {
		timerProgress = 0.0
		currentItemIndex = 0
		timer.getTimerPublisher()
			.sink { [weak self] _ in
				guard let self = self else { return }
				guard timerProgress < CGFloat(story.stories.count) else {
					self.stop()
					self.completion?()
					return
				}
				self.timerProgress += 0.03
				self.currentItemIndex = min(Int(self.timerProgress), self.story.stories.count - 1)
			}
			.store(in: &cancellables)
	}
	
	func stop() {
		timer.stop()
		cancellables.forEach { cancellable in
			cancellable.cancel()
		}
		cancellables.removeAll()
	}
}
