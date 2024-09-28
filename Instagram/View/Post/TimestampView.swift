//
//  TimestampView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct TimestampView: ViewModifier {
	let timestamp: String
	
	func body(content: Content) -> some View {
		Group {
			content
			
			Text(timestamp)
				.font(.caption)
				.foregroundStyle(.gray)
				.padding(.vertical, 8)
				.padding(.horizontal)
		}
	}
}

//#Preview {
//    TimestampView()
//}
