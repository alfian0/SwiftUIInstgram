//
//  StoryItemView.swift
//  Instagram
//
//  Created by Alfian on 29/09/24.
//

import SwiftUI
import Combine

struct StoryItemView: View {
	@StateObject var viewModel: StoryItemViewModel

	var body: some View {
		Image(viewModel.story.stories[viewModel.currentItemIndex])
			.resizable()
			.scaledToFit()
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.onAppear {
				viewModel.start()
			}
			.onDisappear {
				viewModel.stop()
			}
			.overlay(alignment: .top) {
				StoryProgressView(storiesCount: viewModel.story.stories.count, progress: viewModel.timerProgress)
			}
	}
}

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
