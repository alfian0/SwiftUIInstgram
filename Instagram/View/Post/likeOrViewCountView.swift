//
//  likeOrViewCount.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct likeOrViewCountView: ViewModifier {
	let mediaType: PostDataModel.MediaType
	let likes: Int
	let views: Int
	
	func body(content: Content) -> some View {
		Group {
			content
			
			Group {
				switch mediaType {
					case .image:
						Text("\(likes) likes")
							.font(.caption.bold())
					case .video:
						Text("\(views) views")
							.font(.caption.bold())
				}
			}
			.padding(.horizontal)
		}
	}
}

//#Preview {
//    likeOrViewCountView()
//}
