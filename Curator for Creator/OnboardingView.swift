//
//  OnboardingView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/11/23.
//

import SwiftUI

struct OnboardingView: View {
	var body: some View {
		VStack(spacing: 16) {
			
			Button(action: {}) {
				Text("Login")
					.foregroundColor(.primary)
					.padding()
					.frame(maxWidth: .infinity)
					.background(.secondary)
					.cornerRadius(Constants.cornerRadius)
					.padding(.horizontal, 30)
			}
			
			HStack {
				Text("Don't have an account?")
					.foregroundColor(.secondary)
				Button(action: {}) {
					Text("Sign Up")
						.foregroundColor(.primary)
				}
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
