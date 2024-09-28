//
//  ActivityView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct ActivityView: View {
	@State var activity: ActivityDataModel
	
	var body: some View {
		HStack {
			// User profile image
			AvatarView(name: activity.user.profileImage)
				.frame(width: 40, height: 40)
			
			// Main content based on activity type
			VStack(alignment: .leading) {
				activityContent
				
				// Duration text (common for all cases)
				Text(activity.duration)
					.font(.caption)
					.foregroundStyle(.gray)
			}
			
			Spacer()
			
			// Optional follow button
			if case .suggestFollower = activity.type {
				followButton
			} else if case .newFollower = activity.type {
				followButton(isFollowing: true)
			}
		}
		.padding(.vertical, 4)
		.padding(.horizontal)
	}
	
	// MARK: - Activity Content
	
	@ViewBuilder
	private var activityContent: some View {
		switch activity.type {
			case let .liked(post):
				Text(post.user.userName)
					.font(.headline) +
				Text(" and others liked your post.")
					.font(.subheadline)
				
			case let .comment(user, _, comment):
				Text(user.userName)
					.font(.headline) +
				Text(" mentioned you in a comment: ")
					.font(.subheadline) +
				Text(comment)
					.font(.body.bold())
				
			case let .suggestFollower(user):
				Text(user.userName)
					.font(.headline) +
				Text(" who you might know, is on Instagram.")
					.font(.subheadline)
				
			case let .newFollower(user):
				Text(user.userName)
					.font(.headline) +
				Text(" started following you.")
					.font(.subheadline)
		}
	}
	
	// MARK: - Follow Button
	
	@ViewBuilder
	private var followButton: some View {
		Button(action: {}) {
			Text("Follow")
				.font(.body.bold())
		}
		.buttonStyle(.borderedProminent)
	}
	
	private func followButton(isFollowing: Bool) -> some View {
		Button(action: {}) {
			Text(isFollowing ? "Following" : "Follow")
				.font(.body.bold())
		}
		.buttonStyle(.bordered)
	}
}

#Preview {
	ActivityView(activity: mockActivitiesData[2])
}
