//
//  ActionButtonsView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct ActionButtonsView: View {
    var body: some View {
			HStack {
				Button {
					
				} label: {
					Text("Edit Profile")
						.font(.subheadline.bold())
						.frame(maxWidth: .infinity)
				}
				.buttonStyle(.bordered)
				
				Button {
					
				} label: {
					Text("Share Profile")
						.font(.subheadline.bold())
						.frame(maxWidth: .infinity)
				}
				.buttonStyle(.bordered)
				
				Button {
					
				} label: {
					Image(systemName: "person.badge.plus")
				}
				.buttonStyle(.bordered)
			}
			.frame(maxWidth: .infinity)
    }
}

#Preview {
    ActionButtonsView()
}
