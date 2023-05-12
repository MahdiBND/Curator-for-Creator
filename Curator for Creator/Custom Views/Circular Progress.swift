//
//  Circular Progress.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/12/23.
//

import SwiftUI

struct CircularProgress: View {
	@Binding var progress: CGFloat
	private let lineWidth: CGFloat = 10
	
	var body: some View {
		Circle()
			.stroke(Color.secondary, lineWidth: lineWidth)
			.overlay(
				Circle()
					// User has to select at least 5 items
					.trim(from: 0, to: progress/5)
					.stroke(Color.accentColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
					.rotationEffect(.degrees(-270))
					.shadow(radius: 1)
					.overlay(textOverlay)
			)
			.padding()
			.animation(.easeOut, value: progress)
	}
	
	var textOverlay: some View {
		Text(Int(progress).description)
	}
}

struct CircularProgress_Previews: PreviewProvider {
    static var previews: some View {
		CircularProgress(progress: .constant(1))
    }
}
