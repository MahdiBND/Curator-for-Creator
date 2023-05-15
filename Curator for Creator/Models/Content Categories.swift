//
//  Content Categories.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import Foundation

struct Category: Identifiable, Hashable, Codable {
	var id: UUID { UUID() }
	var name: String
	var icon: String
}

let testCategories = [
	Category(name: "Religion", icon: "religion"),
	Category(name: "Biography", icon: "biography"),
	Category(name: "Economy", icon: "economy"),
	Category(name: "History", icon: "history"),
	Category(name: "Philosophy", icon: "philosophy"),
	Category(name: "Politics", icon: "politics"),
	Category(name: "Psychology", icon: "psychology"),
	Category(name: "Technology", icon: "technology"),
	Category(name: "Self Development", icon: "self development"),
]
