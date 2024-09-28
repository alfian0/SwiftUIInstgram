//
//  ExploreView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct GridView: View {
	@State var post: [PostDataModel]
	
	var body: some View {
		GeometryReader(content: { geometry in
			LazyVGrid(columns: [
				GridItem(.flexible(), spacing: 1),
				GridItem(.flexible(), spacing: 1),
				GridItem(.flexible(), spacing: 1)
			], spacing: 1) {
				ForEach(post) { datum in
					Image(datum.cover)
						.resizable()
						.scaledToFill()
						.frame(width: (geometry.size.width-2)/3, height: (geometry.size.width-2)/3)
						.clipped()
				}
			}
		})
	}
}

#Preview {
	GridView(post: mockPostData)
}
