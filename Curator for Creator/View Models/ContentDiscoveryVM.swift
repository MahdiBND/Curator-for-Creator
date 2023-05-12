//
//  ContentDiscoveryVM.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import Foundation

class ContentDiscoveryVM: ObservableObject {
	@Published var selectedItems = [Category]()
	
	
	func isSelected(_ item: Category) -> Bool {
		return selectedItems.contains(item)
	}
	
	// Select or deselect category items
	func toggleItem(_ category: Category) {
		if !isSelected(category) {
			selectedItems.append(category)
		} else {
			selectedItems.removeAll { cat in
				category.id == cat.id
			}
		}
	}
}
