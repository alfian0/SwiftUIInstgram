//
//  AvatarView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct AvatarView: View {
	let name: String
	
	var body: some View {
		Image(name)
			.resizable()
			.scaledToFit()
			.clipShape(Circle())
	}
}

#Preview {
	AvatarView(name: "img_avatar_1")
		.frame(width: 64, height: 64)
		.if(true, transform: { view in
			view.modifier(RingView(isLoading: .constant(false)))
		})
		.if(true) { view in
			view.modifier(ComposeView())
		}
}
