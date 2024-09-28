//
//  SearchView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct SearchView: View {
	@State var searchText: String = ""
	
    var body: some View {
			VStack {
				TextField("Search", text: $searchText)
					.modifier(PrefixView())
					.modifier(SuffixView())
					.modifier(RoundedBackgroundView())
					.padding(.horizontal)
				
				ScrollView(.vertical) {
					GridView(post: mockPostData)
				}
			}
    }
}

#Preview {
    SearchView()
}
