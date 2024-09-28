//
//  ContentView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 24/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			TabView {
				Group {
					HomeView()
						.tabItem {
							Image(systemName: "house")
						}
					
					SearchView()
						.tabItem {
							Image(systemName: "magnifyingglass")
						}
					
					Text("Home")
						.tabItem {
							Image(systemName: "plus.app")
						}
					
					ActivityListView(activities: mockActivitiesData)
						.tabItem {
							Image(systemName: "heart")
						}
					
					ProfileView()
						.tabItem {
							Image(systemName: "person")
						}
				}
				.toolbarBackground(.white, for: .tabBar)
			}
			.tint(.black)
    }
}

#Preview {
    ContentView()
}
