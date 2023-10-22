//
//  FormTextField.swift
//  FoodPin
//
//  Created by Артем Сергеев on 18.10.2023.
//

import SwiftUI


struct FormTextField: View {
	let label: String
	var placeholder: String = ""
	
	@Binding var value: String
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(label.uppercased())
				.font(.system(.headline, design: .rounded))
				.foregroundColor(Color(.darkGray))
			
			TextField(placeholder, text: $value)
				.font(.system(.body, design: .rounded))
				.textFieldStyle(PlainTextFieldStyle())
				.padding(10)
				.overlay(
					RoundedRectangle(cornerRadius: 5)
						.stroke(Color(.systemGray5), lineWidth: 1)
				)
				.padding(.vertical, 10)
			
		}
	}
}

#Preview {
	FormTextField(label: "NAME", placeholder: "Fill in the restaurant name", value: .constant(""))
		.previewLayout(.fixed(width: 300, height: 200))
		.previewDisplayName("FormTextField")
}
