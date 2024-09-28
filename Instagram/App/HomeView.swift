//
//  HomeView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct HomeView: View {
	@State private var selectedItem: StoryDataModel?
	
    var body: some View {
			NavigationStack {
				ScrollView(.vertical) {
					LazyVStack {
						StoryListView(storyData: mockStoryData) { item in
							selectedItem = item
						}
						.frame(height: 100)
						
						Divider()
						
						ForEach(mockPostData) { datum in
							PostView(postData: datum)
						}
					}
				}
				.toolbarBackground(.white, for: .navigationBar)
				.toolbar {
					ToolbarItem(placement: .topBarLeading) {
						Image("img_logo")
					}
					
					ToolbarItem(placement: .topBarTrailing) {
						Button {
							
						} label: {
							Image(systemName: "heart")
								.foregroundStyle(.black)
						}
					}
					
					ToolbarItem(placement: .topBarTrailing) {
						Button {
							
						} label: {
							ZStack {
								Image(systemName: "bubble")
									.foregroundStyle(.black)
								
								Text("5")
									.font(.caption.bold())
									.padding(.all, 4)
									.background(.red)
									.foregroundStyle(.white)
									.clipShape(Circle())
									.offset(x: 8, y: -8)
							}
						}
					}
				}
				.fullScreenCover(item: $selectedItem, content: { item in
					if let index = mockStoryData.enumerated().filter({ $0.element == item }).map({ $0.offset }).first {
						StoryView(stories: mockStoryData, currentIndex: index)
					} else {
						EmptyView()
					}
				})
			}
    }
}

#Preview {
    HomeView()
}
