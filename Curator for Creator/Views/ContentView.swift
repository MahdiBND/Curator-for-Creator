//
//  ContentView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/11/23.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var userData: UserData<PreferenceStore>
	
	var body: some View {
		if userData.isLoggedIn {
				// -test: change to real user feed.
			UserFeedView(provider: MockUserFeed())
				.environmentObject(userData)
		} else {
			OnboardingView()
				.environmentObject(userData)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
			.environmentObject(UserData(user: User(), store: PreferenceStore()))
    }
}
