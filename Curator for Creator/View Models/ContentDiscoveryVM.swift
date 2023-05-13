//
//  ContentDiscoveryVM.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import Foundation

class ContentDiscoveryVM<Store> where Store: PreferenceStorable  {
	private var store: Store
	
	init(store: Store) {
		self.store = store
	}
	
	func isSelected(_ item: Category) -> Bool {
		return store.favoriteCategoriesPreference.contains(item)
	}
	
	// Select or deselect category items
	func toggleItem(_ category: Category) {
		if !isSelected(category) {
			store.favoriteCategoriesPreference.append(category)
		} else {
			store.favoriteCategoriesPreference.removeAll { cat in
				category.id == cat.id
			}
		}
	}
}
