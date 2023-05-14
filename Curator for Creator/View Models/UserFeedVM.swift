//
//  UserFeedVM.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/13/23.
//

import Foundation
import SwiftUI

protocol FeedContentProvidable: ObservableObject {
	// Categories
	var categoryItems: [Category] { get set }
	var names: [String] { get }
	// Search
	var searchTerm: String { get set }
	// FeedItems(posts)
	var posts: [FeedItem] { get set }
	var postView: AnyView { get }
}

class UserFeedVM: ObservableObject, FeedContentProvidable {
	@Published var searchTerm = ""
	@Published var categoryItems = [Category]()
	@Published var posts = [FeedItem]()
	
	var postView: AnyView {
		posts.isEmpty ?
		AnyView(Group {
			ForEach(posts) { post in
				FeedItemView(item: post)
					.padding(14)
			}
		})
		: AnyView(EmptyView())
	}
	
	var names: [String] {
		categoryItems.map { $0.name }
	}
}


	// MARK: - Mock Data
class MockUserFeed: ObservableObject, FeedContentProvidable {
	@Published var searchTerm = ""
	@Published var categoryItems: [Category] = testCategories
	@Published var posts = [FeedItem]()
	
	var postView: AnyView {
		AnyView(Group {
			ForEach(1..<10) { _ in
				FeedItemView(item: mockFeedItem)
					.padding(14)
			}
		})
	}
	
	var names: [String] {
		categoryItems.map { $0.name }
	}
}
