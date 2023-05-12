//
//  FeedItemView.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/13/23.
//

import SwiftUI

struct FeedItemView: View {
	var item: FeedItem
	
	init(item: FeedItem) {
		self.item = item
	}
	
	var body: some View {
		HStack(spacing: 20) {
			Image(item.image)
				.resizable()
				.aspectRatio(1, contentMode: .fit)
				.cornerRadius(Constants.cornerRadius)
				.frame(maxWidth: 130)
				
			
			VStack(alignment: .leading, spacing: 20) {
				Text(item.title)
					.bold()
					
				Text(item.text)
					.fontWeight(.light)
					.lineLimit(3)
			}
		}
		.padding()
		.background(Color.fieldColor)
		.cornerRadius(Constants.cornerRadius*2)
	}
}

struct FeedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeedItemView(item: mockFeedItem)
    }
}
