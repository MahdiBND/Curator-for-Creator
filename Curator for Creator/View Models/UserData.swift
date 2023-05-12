//
//  UserData.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import Foundation

class UserData: ObservableObject {
	@Published var user = User()
	@Published var loggedIn = false
	
	var defaults = UserDefaults.standard
	
	func loginSetup() {
		defaults.set(true, forKey: "login")
		DispatchQueue.main.async {
			self.loggedIn = true
		}
	}
	
	func launchOptions() {
		loggedIn = defaults.bool(forKey: "login")
	}
}
