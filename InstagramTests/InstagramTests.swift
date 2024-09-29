//
//  InstagramTests.swift
//  InstagramTests
//
//  Created by Alfian on 29/09/24.
//

import XCTest
import Combine
@testable import Instagram

final class InstagramTests: XCTestCase {
	func test_storyItemViewModel_1_miliseconds_equal_0_33() {
		let sut = StoryItemViewModel(
			story: mockStoryData[0],
			timer: MockTimer(retryCount: 1)
		) {
				XCTFail()
		}
		
		sut.start()
		
		XCTAssertEqual(sut.timerProgress, 0.03)
		XCTAssertEqual(sut.currentItemIndex, 0)
	}
	
	func test_storyItemViewModel_3_3_miliseconds_equal_0_99() {
		let sut = StoryItemViewModel(
			story: mockStoryData[0],
			timer: MockTimer(retryCount: 33)
		) {
			XCTFail()
		}
		
		sut.start()
		
		XCTAssertEqual(sut.timerProgress, 0.9900000000000007)
		XCTAssertEqual(sut.currentItemIndex, 0)
	}
	
	func test_storyItemViewModel_3_4_miliseconds_equal_1_02() {
		let sut = StoryItemViewModel(
			story: mockStoryData[0],
			timer: MockTimer(retryCount: 34)
		) {
			XCTFail()
		}
		
		sut.start()
		
		XCTAssertEqual(sut.timerProgress, 1.0200000000000007)
		XCTAssertEqual(sut.currentItemIndex, 1)
	}
	
	func test_storyItemViewModel_3_5_miliseconds_equal_1_02() {
		let expectation = XCTestExpectation(description: "Should be call completion")
		
		let sut = StoryItemViewModel(
			story: mockStoryData[0],
			timer: MockTimer(retryCount: 35)
		) {
			expectation.fulfill()
		}
		
		sut.start()
		
		XCTAssertEqual(sut.timerProgress, 1.0200000000000007)
		XCTAssertEqual(sut.currentItemIndex, 1)
		
		wait(for: [expectation])
	}
	
	func test_storyViewModel() {
		let expectation = XCTestExpectation(description: "Should be call completion")
		
		let sut = StoryViewModel(viewModels: [
			StoryItemViewModel(
				story: mockStoryData[0],
				timer: MockTimer(retryCount: 36)
			),
			StoryItemViewModel(
				story: mockStoryData[1],
				timer: MockTimer(retryCount: 36)
			)
		]) {
			expectation.fulfill()
		}
		
		XCTAssertEqual(sut.currentIndex, 1)
		
		wait(for: [expectation])
	}
}

class MockTimer: TimerProtocol {
	private let retryCount: Int
	
	init(retryCount: Int) {
		self.retryCount = retryCount
	}
	
	func getTimerPublisher() -> AnyPublisher<Date, Never> {
		var dates = [Date]()
		for _ in 0..<retryCount {
			dates.append(Date())
		}
		return dates.publisher.eraseToAnyPublisher()
	}
	
	func stop() {
		
	}
}
