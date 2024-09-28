//
//  HeaderView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct HeaderView: View {
	let image: String
	let title: String
	let subtitle: String
	
	var body: some View {
		Group {
			HStack {
				AvatarView(name: image)
					.frame(width: 32, height: 32)
				
				VStack(alignment: .leading) {
					Text(title)
						.font(.caption.bold())
					
					Text(subtitle)
						.font(.caption2)
				}
				
				Spacer()
				
				Button {
					// Handle ellipsis action
				} label: {
					Image(systemName: "ellipsis")
						.foregroundStyle(.black)
				}
			}
			.padding(.vertical, 8)
			.padding(.horizontal)
			
			Divider()
		}
	}
}

#Preview {
	HeaderView(image: "img_avatar_1", title: "Jane Doe", subtitle: "Sponsored")
}
