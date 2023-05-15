//
//  ContentDiscoveryView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import SwiftUI
import SwiftUIMasonry

struct ContentDiscoveryView: View {
	@Environment(\.dismiss) var dismiss
	@StateObject var viewModel = ContentDiscoveryVM(store: PreferenceStore.shared)
	
	let column = [GridItem(.flexible()),
				  GridItem(.flexible())]
	
    var body: some View {
		VStack {
			CircularProgress(progress: $viewModel.count)
				.frame(width: 150, height: 150)
			
			Text("Choose contents you like")
				.padding(5)
			Text("Choose at least 5 items")
				.foregroundColor(.secondary)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HMasonry(rows: 2, spacing: 10) {
					ForEach(viewModel.selectedItems) { item in
						CategoryItem(category: item)
					}
				}
				.frame(height: 120)
				.padding()
			}
			
			ScrollView(showsIndicators: false) {
				VMasonry(columns: 2) {
					ForEach(testCategories) { category in
						CategoryItem(category: category)
							.overlay(RoundedRectangle(
								cornerRadius: Constants.cornerRadius)
										.stroke(.blue,
												lineWidth: viewModel.isSelected(category) ? 1 : 0))
							.onTapGesture {
								viewModel.toggleItem(category)
							}
					}
				}
				.padding(.horizontal)
			}
			
			Button(action: goToApp) {
				Text("Continue")
					.frame(maxWidth: .infinity)
					.roundedBorder()
			}
			.disabled(viewModel.count < 5) // User should select at least 5 items
			.padding()
		}
		.animation(.easeOut, value: viewModel.selectedItems)
    }
	
	private func goToApp() {
		viewModel.saveData()
		dismiss.callAsFunction()
	}
}

struct ContentDiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDiscoveryView()
			.preferredColorScheme(.dark)
//			.environmentObject(UserData(user: User(), store: PreferenceStore()))
    }
}
