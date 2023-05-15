//
//  OnboardingView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/11/23.
//

import SwiftUI

struct OnboardingView: View {
	@EnvironmentObject var userData: UserData<PreferenceStore>
	@StateObject private var viewModel = OnboardingVM()
	var body: some View {
		VStack(spacing: 20) {
			
			Button(action: {
				viewModel.showLogin.toggle()
			}) {
				Text("Login")
					.bold()
					.foregroundColor(.black)
					.padding()
					.frame(maxWidth: .infinity)
					.background(.white)
					.cornerRadius(Constants.cornerRadius)
					.padding(.horizontal, 30)
			}
			.sheet(isPresented: $viewModel.showLogin) {
				LoginView()
					.environmentObject(userData)
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
					.environmentObject(userData)
			}
		}
		.frame(maxHeight: .infinity, alignment: .bottom)
		.background(Image("background"))
		.padding(.bottom, 50)
	}
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
			.preferredColorScheme(.dark)
    }
}
