//
//  AvatarStoryActiveView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct RingView: ViewModifier {
	@Binding var isLoading: Bool
	
	private let gradient = LinearGradient(
		gradient: Gradient(colors: [
			Color.yellow,
			Color.storyOrange,
			Color.storyPink,
			Color.storyPurple,
			Color.storyDarkPurple
		]),
		startPoint: .bottomLeading,
		endPoint: .topTrailing
	)
	
	func body(content: Content) -> some View {
		content
			.padding(.all, 4)
			.overlay {
				Circle()
					.stroke(
						gradient,
						style: StrokeStyle(
							lineWidth: 2,
							dash: [isLoading ? 8 : 0]
						)
					)
					.rotationEffect(.degrees(isLoading ? 360 : 0))
					.animation(.default.speed(0.4).repeatForever(autoreverses: false), value: isLoading)
			}
	}
}
