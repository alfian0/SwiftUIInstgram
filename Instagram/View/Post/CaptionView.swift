//
//  CaptionView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 28/09/24.
//

import SwiftUI

struct CaptionView: ViewModifier {
	let name: String
	let caption: String?
	
	func body(content: Content) -> some View {
		Group {
			content
			
			if let caption = caption {
				Group {
					Text(name)
						.font(.body.bold()) +
					Text(" ") +
					Text(caption)
						.font(.body)
				}
				.padding(.horizontal)
			} else {
				EmptyView()
			}
		}
	}
}

//#Preview {
//    CaptionView()
//}
