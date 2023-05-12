//
//  ContentDiscoveryView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import SwiftUI
import SwiftUIMasonry

struct ContentDiscoveryView: View {
	@State var selectedItems = [Category]()
	let column = [GridItem(.flexible()),
				  GridItem(.flexible())]
	
    var body: some View {
		@State var count = CGFloat(selectedItems.count)
		return	VStack {
			CircularProgress(progress: $count)
				.frame(width: 150, height: 150)
			
			Text("Choose contents you like")
				.padding(5)
			Text("Choose at least 5 items")
				.foregroundColor(.secondary)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HMasonry(rows: 2, spacing: 10) {
					ForEach(selectedItems) { item in
						CategoryItem(category: item)
					}
				}
				.frame(height: 120)
				.padding()
			}
			
			LazyVGrid(columns: column, alignment: .leading) {
				ForEach(testCategories) { category in
					CategoryItem(category: category)
						.overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke(.blue, lineWidth: isSelected(category) ? 1 : 0))
					.onTapGesture {
						if !isSelected(category) {
							selectedItems.append(category)
						} else {
							selectedItems.removeAll { cat in
								cat.id == category.id
							}
						}
					}
				}
			}
			.padding()
			
			Button(action: {}) {
				Text("Continue")
					.frame(maxWidth: .infinity)
					.roundedBorder()
			}
			.disabled(count < 5)
			.padding()
		}
		.animation(.easeOut, value: selectedItems)
    }
	
	func isSelected(_ item: Category) -> Bool {
		return selectedItems.contains(item)
	}
}

struct ContentDiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDiscoveryView()
			.preferredColorScheme(.dark)
    }
}

struct CategoryItem: View {
	var category: Category
	
	var body: some View {
		HStack {
			Image(category.icon)
				.resizable()
				.renderingMode(.template)
				.frame(width: 30, height: 30)
				.foregroundColor(.blue)
			Text(category.name)
				.lineLimit(1)
		}
		.padding(10)
		.background(Color.fieldColor)
		.cornerRadius(Constants.cornerRadius)
	}
}
