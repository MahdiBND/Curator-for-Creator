//
//  Curator_for_CreatorApp.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/11/23.
//

import SwiftUI

@main
struct Curator_for_CreatorApp: App {
	var userData = UserData()
	
	init() {
		launchOptions()
	}
	
	func launchOptions() {
		userData.launchOptions()
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(userData)
        }
    }
}
