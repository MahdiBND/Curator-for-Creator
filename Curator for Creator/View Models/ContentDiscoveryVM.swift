//
//  ContentDiscoveryVM.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import Foundation

class ContentDiscoveryVM<Store>: ObservableObject where Store: PreferenceStorable  {
	private var store: Store
	
	var selectedItems: [Category] {
		store.favoriteCategoriesPreference
	}
	
	init(store: Store) {
		self.store = store
	}
	
	func isSelected(_ item: Category) -> Bool {
		return store.favoriteCategoriesPreference.contains(item)
	}
	
	// Select or deselect category items
	func toggleItem(_ category: Category) {
		if !isSelected(category) {
			select(category)
		} else {
			remove(category)
		}
	}
	
	private func select(_ category: Category) {
		store.favoriteCategoriesPreference.append(category)
	}
	
	private func remove(_ category: Category) {
		store.favoriteCategoriesPreference.removeAll { cat in
			category.id == cat.id
		}
	}
}
