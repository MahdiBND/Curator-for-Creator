//
//  LoginVM.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import Foundation
import SwiftUI

enum LoginError: Error {
  case formIsEmpty, usernameIsEmpty, passwordIsEmpty
}

class LoginVM<Store>: ObservableObject where Store: PreferenceStorable {
	@Published var email = ""
	@Published var password = ""
	private var store: Store
	
	init(store: Store = PreferenceStore() as! Store) {
		self.store = store
	}
	
	func login() throws {
		if self.email == "" && self.password == "" {
			throw LoginError.formIsEmpty
		} else if self.email == "" {
			throw LoginError.usernameIsEmpty
		} else if password == "" {
			throw LoginError.passwordIsEmpty
		} else {
				// now that there is no problem, attempt login
				// for now just accept any user & pass
			store.loginPreference = true
		}
	}
}
