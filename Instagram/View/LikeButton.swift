//
//  LikeButton.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 27/09/24.
//

import SwiftUI

struct LikeButton: View {
	@State var isLiked: Bool
	var action: () -> Void
	
	init(isLiked: Bool = false, action: @escaping () -> Void) {
		self.isLiked = isLiked
		self.action = action
	}
	
	var body: some View {
		Button {
			isLiked.toggle()
			action()
		} label: {
			ZStack {
				Image(systemName: "heart.fill")
					.tint(.red)
					.scaleEffect(isLiked ? 1 : 0)
					.opacity(isLiked ? 1 : 0)
				
				Image(systemName: "heart")
					.tint(.black)
					.scaleEffect(!isLiked ? 1 : 0)
					.opacity(!isLiked ? 1 : 0)
			}
		}
		.animation(.spring, value: isLiked)
	}
}

#Preview {
	LikeButton {
		
	}
}
