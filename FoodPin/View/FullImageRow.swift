//
//  SwiftUIView.swift
//  FoodPin
//
//  Created by Артем Сергеев on 04.10.2023.
//

import SwiftUI


struct FullImageRow: View {
	
	@State private var showOptions = false
	@State private var showError = false
	@Binding var restaurant: Restaurant
	
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Image(restaurant.image)
				.resizable()
				.scaledToFill()
				.frame(height: 200)
				.cornerRadius(20)
			
			VStack(alignment: .leading) {
				Text(restaurant.name)
					.font(.system(.title2, design: .rounded))
				
				Text(restaurant.type)
					.font(.system(.body, design: .rounded))
				
				Text(restaurant.location)
					.font(.system(.subheadline, design: .rounded))
					.foregroundColor(.gray)
			}
			.padding(.horizontal)
			.padding(.bottom)
		}
		.onTapGesture {
			showOptions.toggle()
		}
		.confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
			
			Button("Reserve a table") {
				showError.toggle()
			}
			
			Button(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite") {
				self.restaurant.isFavorite.toggle()
			}
		}
		.alert("Not yet available", isPresented: $showError) {
			Button("OK") {}
		} message: {
			Text("Sorry, this feature is not available yet. Please retry later.")
		}
	}
}


#Preview {
	FullImageRow(restaurant:.constant(
		Restaurant(
			name: "Cafe Deadend",
			type: "Cafe",
			location: "Hong Kong",
			image: "cafedeadend",
			isFavorite: true)))
}
