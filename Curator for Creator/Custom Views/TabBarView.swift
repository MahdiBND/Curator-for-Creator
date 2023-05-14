//
//  TabBarView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/14/23.
//

import SwiftUI

struct TabBarView<Provider>: View where Provider: TabItemProvidable {
	private var provider: Provider
	@State var currentTab: Int = 0
	@Namespace var namespace
	
	init(provider: Provider) {
		self.provider = provider
	}
	
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 20) {
				ForEach(Array(zip(provider.items.indices,
								  provider.items)),
						id: \.0,
						content: {
					index, name in
					TabBarItem(currentTab: self.$currentTab,
							   namespace: namespace.self,
							   tabBarItemName: name,
							   tab: index)
					
				})
			}
			.padding(.horizontal)
		}
		.frame(height: 50)
		.edgesIgnoringSafeArea(.all)
	}
}

struct TabBarItem: View {
	@Binding var currentTab: Int
	let namespace: Namespace.ID
	
	var tabBarItemName: String
	var tab: Int
	
	var body: some View {
		Button {
			self.currentTab = tab
		} label: {
			VStack {
				Spacer()
				Text(tabBarItemName)
				if currentTab == tab {
					Color.primary
						.frame(height: 2)
						.matchedGeometryEffect(id: "underline",
											   in: namespace,
											   properties: .frame)
				} else {
					Color.clear.frame(height: 2)
				}
			}
			.animation(.spring(), value: self.currentTab)
		}
		.buttonStyle(.plain)
	}
}

struct Tabbar_Previews: PreviewProvider {
	static let items = testCategories.map { $0.name }
	
	static var previews: some View {
		TabBarView(provider: TabBarVM(items: items))
			.preferredColorScheme(.dark)
	}
}

struct TestTabs: View {
	let items = testCategories.map { $0.name }
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVStack {
					TabBarView(provider: TabBarVM(items: items))
					Image("team")
				}
			}
			.navigationTitle("Categories")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}
