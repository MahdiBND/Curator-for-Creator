//
//  UserFeedView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/13/23.
//

import SwiftUI

struct UserFeedView<Provider>: View where Provider: FeedContentProvidable {
	@ObservedObject private var provider: Provider
	
	init(provider: Provider = UserFeedVM() as! Provider) {
		self.provider = provider
	}
	
    var body: some View {
		NavigationView {
			ScrollView {
				LazyVStack {
					TabBarView(provider: TabBarVM(items: provider.names))
					provider.postView
				}
			}
			.navigationTitle("Categories")
			.navigationBarTitleDisplayMode(.inline)
			.searchable(text: $provider.searchTerm)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					NavigationLink(destination: ProfileView()) {
						Image(systemName: "circle.grid.3x3.fill")
							.font(.body.weight(.ultraLight))
							.foregroundColor(.secondary)
					}
				}
			}
		}
    }
}

struct UserFeedView_Previews: PreviewProvider {
    static var previews: some View {
        UserFeedView(provider: MockUserFeed())
			.preferredColorScheme(.dark)
    }
}

