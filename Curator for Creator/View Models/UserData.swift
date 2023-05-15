//
//  UserData.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import Foundation
import Combine

class UserData<Store>: ObservableObject where Store: PreferenceStorable {
	private let user: User
	private var store: Store
	private var tasks: Set<AnyCancellable> = []
		// removed `isLoggedIn
	init(user: User, store: Store) {
		self.user = user
		self.store = store
		
		store.objectWillChange.sink { _ in
		  self.objectWillChange.send()
		}
		.store(in: &tasks)
	}
	
	var favoriteCategories: [Category] {
		store.favoriteCategoriesPreference
	}
	
	var loggedIn: Bool {
		store.loginPreference
	}
	
	func logout() {
		store.loginPreference = false
	}
}
