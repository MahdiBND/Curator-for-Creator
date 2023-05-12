//
//  UserFeedView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/13/23.
//

import SwiftUI

struct UserFeedView: View {
	@State var searchTerm = ""
	
    var body: some View {
		NavigationView {
			ScrollView {
				// TODO: make dynamic
				ForEach(1..<10) { _ in
					FeedItemView(item: mockFeedItem)
						.padding(14)
				}
			}
			.navigationTitle("Categories")
			.navigationBarTitleDisplayMode(.inline)
			.searchable(text: $searchTerm)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Image(systemName: "circle.grid.3x3.fill")
						.font(.body.weight(.ultraLight))
						.foregroundColor(.secondary)
				}
			}
		}
    }
}

struct UserFeedView_Previews: PreviewProvider {
    static var previews: some View {
        UserFeedView()
			.preferredColorScheme(.dark)
    }
}

