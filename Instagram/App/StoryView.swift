//
//  StoryView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 27/09/24.
//

import SwiftUI
import Combine

struct StoryView: View {
	@Environment(\.dismiss) var dismiss
	@State var stories: [StoryDataModel]
	@State var currentIndex: Int = 0
	
	var body: some View {
		TabView(selection: $currentIndex) {
			ForEach(stories.indices, id: \.self) { index in
				StoryItemView(storyData: stories[index]) {
					// Move to the next story or reset to the first
					if currentIndex < stories.count - 1 {
						currentIndex += 1
					} else {
						dismiss()
					}
				}
				.tag(index)
				.overlay(alignment: .topTrailing) {
					StoryHeaderView(story: stories[index]) {
						dismiss()
					}
				}
			}
		}
		.tabViewStyle(.page(indexDisplayMode: .never))
		.background(Color.black)
	}
}

struct StoryItemView: View {
	var storyData: StoryDataModel
	var onLastStoryReached: () -> Void
	@State private var timer = Timer.publish(every: 0.1, on: .main, in: .common)
	@State private var timerProgress: CGFloat = 0
	@State private var currentItemIndex: Int = 0
	@State private var cancellable: Cancellable?
	
	var body: some View {
		Image(storyData.stories[currentItemIndex])
			.resizable()
			.scaledToFit()
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.onAppear {
				startTimer()
			}
			.onDisappear {
				stopTimer()
			}
			.overlay(alignment: .top) {
				StoryProgressView(storiesCount: storyData.stories.count, progress: timerProgress)
			}
	}
	
	// Start the timer and manage the story progress
	private func startTimer() {
		timerProgress = 0
		currentItemIndex = 0
		cancellable = timer.autoconnect().sink { _ in
			guard timerProgress < CGFloat(storyData.stories.count) else {
				stopTimer()
				onLastStoryReached()
				return
			}
			timerProgress += 0.03
			currentItemIndex = min(Int(timerProgress), storyData.stories.count - 1)
		}
	}
	
	// Stop the timer when it's no longer needed
	private func stopTimer() {
		cancellable?.cancel()
		cancellable = nil
	}
}

// A simple header view for the story that includes user info and close button
struct StoryHeaderView: View {
	var story: StoryDataModel
	var onDismiss: () -> Void
	
	var body: some View {
		HStack {
			Image(story.user.profileImage)
				.resizable()
				.scaledToFit()
				.frame(width: 34, height: 34)
				.clipShape(Circle())
			
			Text(story.user.userName)
				.font(.headline)
				.foregroundColor(.white)
			
			Spacer()
			
			Button {
				onDismiss()
			} label: {
				Image(systemName: "xmark")
					.foregroundColor(.white)
			}
		}
		.padding(.top, 8)
		.padding(.horizontal)
	}
}

// A reusable progress view for stories
struct StoryProgressView: View {
	var storiesCount: Int
	var progress: CGFloat
	
	var body: some View {
		HStack(spacing: 4) {
			ForEach(0..<storiesCount, id: \.self) { index in
				GeometryReader { geometry in
					let width = geometry.size.width
					let relativeProgress = progress - CGFloat(index)
					let limitedProgress = min(max(relativeProgress, 0), 1)
					
					Capsule()
						.fill(Color.white.opacity(0.5))
						.overlay(alignment: .leading) {
							Capsule()
								.fill(Color.white)
								.frame(width: width * limitedProgress)
						}
				}
			}
		}
		.frame(height: 4)
		.padding(.horizontal)
	}
}

#Preview {
	StoryView(stories: mockStoryData)
}
