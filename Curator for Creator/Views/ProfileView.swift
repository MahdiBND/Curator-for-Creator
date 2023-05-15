//
//  ProfileView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/14/23.
//

import SwiftUI

struct ProfileView: View {
	@EnvironmentObject var userData: UserData<PreferenceStore>
	private let imageSize: CGFloat = 120
	
    var body: some View {
			VStack {
				// not gonna implement
				Image("team")
					.resizable()
					.frame(width: imageSize, height: imageSize)
					.clipShape(Circle())
					.padding(.top)
				
				// Name & ID
				VStack(spacing: 5) {
					Text("John Doe")
						.font(.title2)
						.bold()
					Text("@John.Doe")
						.fontWeight(.light)
						.foregroundColor(.secondary)
				}
				.padding(.top)
				
				Divider()
					.padding()
				
				// some info
				HStack {
					VStack {
						Text("10/100")
						Text("Scans")
					}
					
					Spacer()
					
					VStack {
						Text("\(userData.favoriteCategories.count)/5")
						Text("Topics")
					}
				}
				.padding()
				.padding(.horizontal)
				.foregroundColor(.secondary)
				
				// Profile Settings
				VStack {
					List {
						Section {
							Label("Settings", systemImage: "gear")
							Label("Billing", systemImage: "creditcard")
							Label("User Management", systemImage: "person.fill")
						}
						.padding(.vertical, 10)
						
						Section {
							Label("Information", systemImage: "exclamationmark.square")
							Button(action: userData.logout) {
								Label("Logout", systemImage: "arrow.right")
							}
							
						}
					}
					.listStyle(.insetGrouped)
					.font(.title3)
					.foregroundColor(.primary)
				}
				.background(.background)
				.cornerRadius(Constants.cornerRadius*2)
				.padding(.top)
				
			} // vstack
			.edgesIgnoringSafeArea(.bottom)
			.background(Color.fieldColor)
			.navigationTitle("Profile")
			.navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
			.preferredColorScheme(.dark)
			.environmentObject(UserData(user: User(), store: PreferenceStore.shared))
    }
}
