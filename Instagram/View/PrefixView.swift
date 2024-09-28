//
//  PrefixView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct PrefixView: ViewModifier {
	
	func body(content: Content) -> some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.foregroundColor(.secondary)
			
			content
		}
	}
}
