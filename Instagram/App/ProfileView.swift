//
//  ProfileView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct ProfileView: View {
	@State var selected = "square.grid.3x3"
	
    var body: some View {
			NavigationStack {
				ScrollView(.vertical) {
					VStack(alignment: .leading) {
						VStack {
							HStack {
								AvatarView(name: "img_avatar_2")
									.frame(width: 72, height: 73)
								
								Spacer()
								
								StatsView()
							}
							
							VStack(alignment: .leading) {
								Text("jane_smith")
									.font(.headline)
								
								Text("Apply toolbarBackground to all child views is quite repetitive and error-prone.")
									.font(.subheadline)
							}
							
							ActionButtonsView()
						}
						.padding(.horizontal)
						
						SegmentedView(selected: $selected, items: [
							"square.grid.3x3",
							"play.display",
							"person.bubble"
						])
						
						GridView(post: mockPostData)
					}
				}
				.toolbarBackground(.white, for: .navigationBar)
				.toolbar {
					ToolbarItem(placement: .topBarLeading) {
						Text("jane_smith")
							.font(.system(size: 20, weight: .bold))
					}
					
					ToolbarItem {
						Button {
							
						} label: {
							Image(systemName: "dollarsign.circle")
								.foregroundStyle(.black)
						}
					}
					
					ToolbarItem {
						Button {
							
						} label: {
							Image(systemName: "plus.app")
								.foregroundStyle(.black)
						}
					}
					
					ToolbarItem {
						Button {
							
						} label: {
							Image(systemName: "line.3.horizontal")
								.foregroundStyle(.black)
						}
					}
				}
			}
    }
}

#Preview {
    ProfileView()
}
