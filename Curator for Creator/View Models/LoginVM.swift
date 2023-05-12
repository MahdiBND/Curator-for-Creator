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

class LoginVM: ObservableObject {
	@Published var email = ""
	@Published var password = ""
	
	func login() throws {
		if self.email == "" && self.password == "" {
			throw LoginError.formIsEmpty
		} else if self.email == "" {
			throw LoginError.usernameIsEmpty
		} else {
			throw LoginError.passwordIsEmpty
		}
	}
}
