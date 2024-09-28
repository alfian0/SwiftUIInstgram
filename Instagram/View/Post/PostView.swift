//
//  PostView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI
import AVKit

struct PostView: View {
	@State var postData: PostDataModel
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			HeaderView(
				image: postData.user.profileImage,
				title: postData.user.userName,
				subtitle: postData.isSponsored ? "Sponsored" : postData.location ?? ""
			)
			.modifier(MediaView(mediaType: postData.media))
			.if(postData.isSponsored, transform: { view in
				view.modifier(SponsoredView())
			})
			.modifier(InteractionView(isLiked: postData.isLiked, isSaved: postData.isSaved))
			.modifier(likeOrViewCountView(mediaType: postData.media, likes: postData.likes, views: postData.views))
			.modifier(CaptionView(name: postData.user.userName, caption: postData.caption))
			.if(postData.isSponsored, transform: { view in
				view.modifier(TimestampView(timestamp: postData.time))
			})
		}
	}
}

#Preview {
	PostView(postData: mockPostData[0])
}
