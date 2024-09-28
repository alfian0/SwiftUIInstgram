//
//  SuffixView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct SuffixView: ViewModifier {
	
	func body(content: Content) -> some View {
		HStack {
			content
			
			Image(systemName: "xmark.circle.fill")
				.foregroundColor(.secondary)
		}
	}
}
