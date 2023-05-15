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
	
	@Published var isLoggedIn = false
	
	init(user: User, store: Store) {
		self.user = user
		self.store = store
		self.isLoggedIn = store.loginPreference
		
		store.objectWillChange.sink { _ in
		  self.objectWillChange.send()
		}
		.store(in: &tasks)
	}
	
	var favoriteCategories: [Category] {
		store.favoriteCategoriesPreference
	}
	
	var loggedIn: Bool {
		isLoggedIn = store.loginPreference
		return isLoggedIn
	}
	
	func logout() {
		store.loginPreference = false
	}
}
