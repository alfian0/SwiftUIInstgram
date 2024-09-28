//
//  NotificationBubleView.swift
//  Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct NotificationBubleView: ViewModifier {
	let value: String
	
	func body(content: Content) -> some View {
		content
			.overlay(alignment: .topTrailing) {
				Text(value)
					.frame(minWidth: 10)
					.frame(maxHeight: 10)
					.font(.caption.bold())
					.padding(.all, 4)
					.background(.red)
					.foregroundStyle(.white)
					.clipShape(Capsule())
					.offset(x: 4, y: -4)
			}
	}
}
