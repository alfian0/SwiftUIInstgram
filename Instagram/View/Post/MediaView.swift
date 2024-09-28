//
//  MediaView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI
import AVKit

struct MediaView: ViewModifier {
	let mediaType: PostDataModel.MediaType
	
	func body(content: Content) -> some View {
		Group {
			content
			
			switch mediaType {
				case let .image(postImage, _):
					Image(postImage)
						.resizable()
						.scaledToFit()
				case let .video(videoUrl, _, _):
					VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: videoUrl, withExtension: "mp4")!))
						.scaledToFit()
			}
			
			Divider()
		}
	}
}

//#Preview {
//	MediaView(mediaType: .image(postImage: "img_avatar_1", dimensions: Dimensions(width: 0, height: 0)))
//}
