//
//  FeedItem.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/13/23.
//

import Foundation

struct FeedItem: Identifiable {
	let id = UUID()
	var title: String
	var image: String
	var text: String
}


let mockFeedItem = FeedItem(title: "Behind the Scenes",
							image: "team",
							text: """
 Share a glimpse of what goes on behind the scenes of your business or organization.
 This could include photos or videos of your team at work,
 """)
