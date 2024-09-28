//
//  RoundedBackgroundView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct RoundedBackgroundView: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding(.all, 8)
			.background(.gray.opacity(0.2))
			.clipShape(RoundedRectangle(cornerRadius: 8))
	}
}
