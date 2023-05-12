//
//  ContentView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/11/23.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var userData: UserData
	
    var body: some View {
		if userData.loggedIn {
			// TODO: We need real contents here
			EmptyView()
		} else {
			OnboardingView()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
