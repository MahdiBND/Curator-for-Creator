//
//  ContentDiscoveryView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import SwiftUI
import SwiftUIMasonry

struct ContentDiscoveryView: View {
	@StateObject var viewModel = ContentDiscoveryVM(store: PreferenceStore())
	
	let column = [GridItem(.flexible()),
				  GridItem(.flexible())]
	
    var body: some View {
		@State var count = CGFloat(viewModel.selectedItems.count)
		return	VStack {
			CircularProgress(progress: $count)
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
			
			LazyVGrid(columns: column, alignment: .leading) {
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
			.padding()
			
			Button(action: {}) {
				Text("Continue")
					.frame(maxWidth: .infinity)
					.roundedBorder()
			}
			.disabled(count < 5) // User should select at least 5 items
			.padding()
		}
		.animation(.easeOut, value: viewModel.selectedItems)
    }
	
	
}

struct ContentDiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDiscoveryView()
			.preferredColorScheme(.dark)
    }
}
