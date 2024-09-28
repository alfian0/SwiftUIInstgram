//
//  InteractionView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct InteractionView: ViewModifier {
	let isLiked: Bool
	let isSaved: Bool
	
	func body(content: Content) -> some View {
		Group {
			content
			
			HStack {
				LikeButton(isLiked: isLiked) {
					
				}
				
				Button { /* Comment action */ } label: {
					Image(systemName: "bubble")
						.foregroundStyle(.black)
				}
				
				Button { /* Share action */ } label: {
					Image(systemName: "paperplane")
						.foregroundStyle(.black)
				}
				
				Spacer()
				
				Button { /* Save action */ } label: {
					Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
						.foregroundStyle(.black)
				}
			}
			.padding(.vertical, 8)
			.padding(.horizontal)
		}
	}
}

//#Preview {
//    InteractionView()
//}
