//
//  LoginView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import SwiftUI

struct LoginView: View {
	@StateObject var viewModel = LoginVM()
	let imageSize: CGFloat = 120
	
    var body: some View {
		VStack(spacing: 15) {
			Image("logo")
				.resizable()
				.frame(width: imageSize, height: imageSize)
				.cornerRadius(imageSize/2)
			
			Text("Welcome Back!")
				.font(.title)
				.padding()
				.padding(.bottom)
			
			TextField("Email", text: $viewModel.email)
				.textFieldStyle(RoundTextFieldStyle())
			
			TextField("Password", text: $viewModel.password)
				.textFieldStyle(RoundTextFieldStyle())
			
			// Divider
			HStack {
				Rectangle().frame(height: 0.5)
				Text("Or")
				Rectangle().frame(height: 0.5)
			}
			.foregroundColor(.secondary)
			.opacity(0.8)
			.padding(.vertical)
			
			// Other login options
			
			HStack(spacing: 30) {
				Group {
					Image("facebook")
						.resizable()
					Image("google")
						.resizable()
					Image("apple")
						.resizable()
						.renderingMode(.template)
						.foregroundColor(.primary)
				}
				.frame(width: 40, height: 40)
				.roundedBorder()
			}
			.padding()
			
			
			HStack {
				Text("Don't have an account?")
					.foregroundColor(.secondary)
				
				// TODO: show signup view
				Button(action: {}) {
					Text("SignUp")
						.foregroundColor(.primary)
				}
			}
			
			Button(action: login) {
				Text("Login")
					.bold()
					.frame(maxWidth: .infinity)
					.roundedBorder()
					.padding(.vertical)
			}
		}
		.padding(30)
    }
	
	func login() {
		do {
			try viewModel.login()
				// Do anything else that needs to be done.
		} catch {
			print(error)
			// Show error feedback to user
		}
	}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
			.preferredColorScheme(.dark)
    }
}
