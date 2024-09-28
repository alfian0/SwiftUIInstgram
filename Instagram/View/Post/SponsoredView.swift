//
//  SponsoredView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct SponsoredView: ViewModifier {

	func body(content: Content) -> some View {
		Group {
			content
			
			Button {
				// Handle learn more action
			} label: {
				HStack {
					Text("Learn more")
						.font(.subheadline.bold())
					Spacer()
					Image(systemName: "chevron.forward")
				}
				.padding(.vertical, 8)
			}
			.padding(.horizontal)
		}
	}
}

//#Preview {
//    SponsoredView()
//}
