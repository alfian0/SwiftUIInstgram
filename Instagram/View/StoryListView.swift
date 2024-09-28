//
//  StoryView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct StoryListView: View {
	@State var storyData: [StoryDataModel]
	var didSelect: (StoryDataModel) -> Void
	
	private let gradient = LinearGradient(
		gradient: Gradient(colors: [
			Color.yellow,
			Color.storyOrange,
			Color.storyPink,
			Color.storyPurple,
			Color.storyDarkPurple
		]),
		startPoint: .bottomLeading,
		endPoint: .topTrailing
	)
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHGrid(rows: [GridItem(.flexible())], spacing: 8) {
				ForEach(storyData) { datum in
					VStack {
						AvatarView(name: datum.user.profileImage)
							.frame(width: 64, height: 64)
							.if(!datum.isSeen, transform: { view in
								view.modifier(RingView(isLoading: .constant(false)))
							})
							.if(datum.isMystory) { view in
								view.modifier(ComposeView())
							}
						
						Text(datum.user.userName)
							.foregroundStyle(datum.isSeen ? .secondary : .primary)
							.font(.caption)
							.lineLimit(1)
							.frame(width: 64)
					}
					.onTapGesture {
						didSelect(datum)
					}
				}
			}
			.padding(.horizontal)
		}
	}
}

#Preview {
	StoryListView(storyData: mockStoryData) { _ in }
}

