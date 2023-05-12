//
//  Modifiers.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import SwiftUI

struct RoundTextFieldStyle: TextFieldStyle {
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.textFieldStyle(.plain)
			.roundedBorder()
	}
}

struct roundedItem: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding(10)
			.background(RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke(.secondary))
	}
}

extension View {
	func roundedBorder() -> some View {
		self.modifier(roundedItem())
	}
}

extension Color {
	static var fieldColor: Color {
		return Color(UIColor.secondarySystemBackground)
	}
}
