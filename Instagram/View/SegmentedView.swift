//
//  SegmentedView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 27/09/24.
//

import SwiftUI

struct SegmentedView: View {
	@Binding var selected: String
	@Namespace var animation
	
	let items: [String]
	
	var body: some View {
		HStack(spacing: 0) {
			ForEach(items, id:\.self) { image in
				SegementedItemView(systemName: image, animation: animation, selected: $selected)
			}
		}
	}
}

#Preview {
	SegmentedView(
		selected: .constant("square.grid.3x3"),
		items: [
			"square.grid.3x3",
			"play.display",
			"person.bubble"
		]
	)
}

struct SegementedItemView: View {
	var systemName: String
	var animation: Namespace.ID
	@Binding var selected: String
	
	var body: some View {
		VStack {
			Button {
				selected = systemName
			} label: {
				Image(systemName: systemName)
					.frame(maxWidth: .infinity)
					.tint(.black)
			}
			.frame(height: 32)
			
			if selected == systemName {
				Rectangle().fill(.black)
					.frame(height: 1)
					.matchedGeometryEffect(id: "TAB", in: animation)
			} else {
				Rectangle().fill(.clear)
					.frame(height: 1)
			}
		}
		.animation(.spring, value: selected)
	}
}
