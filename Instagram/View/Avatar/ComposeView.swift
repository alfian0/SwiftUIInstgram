//
//  PlusIndicatorView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct ComposeView: ViewModifier {
	let systemName: String
	let alignment: Alignment
	let size: CGSize
	
	init(
		systemName: String = "plus",
		alignment: Alignment = .bottomTrailing,
		size: CGSize = CGSize(width: 24, height: 24)
	) {
		self.systemName = systemName
		self.alignment = alignment
		self.size = size
	}
	
	func body(content: Content) -> some View {
		content
			.overlay(alignment: alignment) {
				Button {
					
				} label: {
					Circle()
						.foregroundStyle(.blue)
						.frame(width: size.width, height: size.height)
						.overlay(Circle().stroke(.white, lineWidth: 2))
						.overlay {
							Image(systemName: systemName)
								.font(.caption.bold())
								.foregroundStyle(.white)
						}
				}
			}
	}
}
