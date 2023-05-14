//
//  TabBarVM.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/14/23.
//

import Foundation

protocol TabItemProvidable {
	var items: [String] { get set }
}

class TabBarVM: TabItemProvidable {
	@Published var items: [String]
	
	init(items: [String]) {
		self.items = items
	}
}
