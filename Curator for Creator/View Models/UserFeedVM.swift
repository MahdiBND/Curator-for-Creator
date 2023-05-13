//
//  UserFeedVM.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/13/23.
//

import Foundation

class UserFeedVM<Store>: ObservableObject where Store: PreferenceStorable {
	private var store: Store
	@Published var searchTerm = ""
	
	
	init(store: Store) {
		self.store = store
	}
	
	
	
}
