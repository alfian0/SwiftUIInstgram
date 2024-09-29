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
	@StateObject var viewModel: StoryViewModel
	
	var body: some View {
		TabView(selection: $viewModel.currentIndex) {
			ForEach(viewModel.viewModels.indices, id: \.self) { index in
				StoryItemView(viewModel: viewModel.viewModels[index])
				.tag(index)
				.overlay(alignment: .topTrailing) {
					StoryHeaderView(story: viewModel.viewModels[index].story) {
						dismiss()
					}
				}
			}
		}
		.tabViewStyle(.page(indexDisplayMode: .never))
		.background(Color.black)
	}
}

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

#Preview {
	StoryView(
		viewModel: StoryViewModel(
			currentIndex: 0,
			viewModels: mockStoryData
				.map({ StoryItemViewModel(
					story: $0,
					timer: Timer.TimerPublisher(interval: 0.1, runLoop: .main, mode: .common)
				)}), completion: {
		
	}))
}
