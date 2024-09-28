//
//  StatsView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
			GeometryReader(content: { geometry in
				HStack {
					VStack {
						Text("80")
							.font(.subheadline.bold())
						Text("Post")
							.font(.subheadline)
					}
					.frame(width: geometry.size.width/3, height: geometry.size.height)
					
					VStack {
						Text("100K")
							.font(.subheadline.bold())
						Text("Followers")
							.font(.subheadline)
					}
					.frame(width: geometry.size.width/3, height: geometry.size.height)
					
					VStack {
						Text("99")
							.font(.subheadline.bold())
						Text("Following")
							.font(.subheadline)
					}
					.frame(width: geometry.size.width/3, height: geometry.size.height)
				}
			})
    }
}

#Preview {
    StatsView()
}
