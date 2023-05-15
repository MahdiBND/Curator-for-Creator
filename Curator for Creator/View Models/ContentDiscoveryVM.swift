//
//  ContentDiscoveryVM.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import SwiftUI

class ContentDiscoveryVM<Store>: ObservableObject where Store: PreferenceStorable  {
	private var store: Store
	
	@Published var selectedItems = [Category]() {
		willSet {
			self.count = CGFloat(newValue.count)
		}
	}
	
	@Published var count: CGFloat = 0
	
	init(store: Store) {
		self.store = store
	}
	
	func isSelected(_ item: Category) -> Bool {
		return selectedItems.contains(item)
	}
	
	// Select or deselect category items
	func toggleItem(_ category: Category) {
		if !isSelected(category) {
			select(category)
		} else {
			remove(category)
		}
	}
	
	func saveData() {
		store.favoriteCategoriesPreference = selectedItems
	}
	
	private func select(_ category: Category) {
		selectedItems.append(category)
	}
	
	private func remove(_ category: Category) {
		selectedItems.removeAll { cat in
			category.id == cat.id
		}
	}
}
