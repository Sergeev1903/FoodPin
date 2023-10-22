//
//  FormTextView.swift
//  FoodPin
//
//  Created by Артем Сергеев on 18.10.2023.
//

import SwiftUI


struct FormTextView: View {
	
	let label: String
	
	@Binding var value: String
	
	var height: CGFloat = 200.0
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(label.uppercased())
				.font(.system(.headline, design: .rounded))
				.foregroundColor(Color(.darkGray))
			
			TextEditor(text: $value)
				.frame(maxWidth: .infinity)
				.frame(height: height)
				.padding(10)
				.overlay(
					RoundedRectangle(cornerRadius: 5)
						.stroke(Color(.systemGray5), lineWidth: 1)
				)
				.padding(.top, 10)
			
		}
	}
}

#Preview {
	FormTextView(label: "Description", value: .constant(""))
		.previewLayout(.sizeThatFits)
		.previewDisplayName("FormTextView")
}
