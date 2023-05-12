//
//  OnboardingView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/11/23.
//

import SwiftUI

struct OnboardingView: View {
	@StateObject private var viewModel = OnboardingVM()
	var body: some View {
		VStack(spacing: 16) {
			
			Button(action: {
				viewModel.showLogin.toggle()
			}) {
				Text("Login")
					.foregroundColor(.primary)
					.padding()
					.frame(maxWidth: .infinity)
					.background(.secondary)
					.cornerRadius(Constants.cornerRadius)
					.padding(.horizontal, 30)
			}
			// TODO: open login view
			.sheet(isPresented: $viewModel.showLogin) {
				EmptyView()
			}
			
			HStack {
				Text("Don't have an account?")
					.foregroundColor(.secondary)
				Button(action: {
					viewModel.showSignup.toggle()
				}) {
					Text("Sign Up")
						.foregroundColor(.primary)
				}
			}
				// TODO: open signup view
			.sheet(isPresented: $viewModel.showSignup) {
				EmptyView()
			}
		}
	}
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
			.preferredColorScheme(.dark)
    }
}
