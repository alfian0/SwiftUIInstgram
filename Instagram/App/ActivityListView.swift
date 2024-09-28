//
//  ActivityListView.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import SwiftUI

struct ActivityListView: View {
	@State var activities: [ActivityDataModel]
	
	var body: some View {
		NavigationStack {
			ScrollView(.vertical, showsIndicators: false) {
				LazyVStack {
					ForEach(activities) { datum in
						 ActivityView(activity: datum)
					}
				}
			}
			.toolbarBackground(.white, for: .navigationBar)
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					Text("Activity")
						.font(.system(size: 20, weight: .bold))
				}
			}
		}
	}
}

#Preview {
	ActivityListView(activities: mockActivitiesData)
}
