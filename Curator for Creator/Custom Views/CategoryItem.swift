//
//  CategoryItem.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import SwiftUI

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


struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
		CategoryItem(category: testCategories.first!)
    }
}
