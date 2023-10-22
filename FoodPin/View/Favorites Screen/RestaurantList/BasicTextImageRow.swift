//
//  BasicTextImageRow.swift
//  FoodPin
//
//  Created by Артем Сергеев on 08.10.2023.
//

import SwiftUI


struct BasicTextImageRow: View {
	
	// MARK: - Binding
	
	@ObservedObject var restaurant: Restaurant
	
	// MARK: - State variables
	
	@State private var showOptions = false
	@State private var showError = false
	
	var body: some View {
		HStack(alignment: .top, spacing: 20) {
			Image(uiImage: UIImage(data: restaurant.image) ?? UIImage())
				.resizable()
				.frame(width: 120, height: 118)
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
			
			if restaurant.isFavorite {
				Spacer()
				
				Image(systemName: "heart.fill")
					.foregroundColor(.yellow)
			}
		}
		.contextMenu {
			
			Button(action: {
				self.showError.toggle()
			}) {
				HStack {
					Text("Reserve a table")
					Image(systemName: "phone")
				}
			}
			
			Button(action: {
				self.restaurant.isFavorite.toggle()
			}) {
				HStack {
					Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
					Image(systemName: "heart")
				}
			}
			
			Button(action: {
				self.showOptions.toggle()
			}) {
				HStack {
					Text("Share")
					Image(systemName: "square.and.arrow.up")
				}
			}
		}
		.alert("Not yet available", isPresented: $showError) {
			Button("OK") {}
		} message: {
			Text("Sorry, this feature is not available yet. Please retry later.")
		}
		.sheet(isPresented: $showOptions) {
			
			let defaultText = "Just checking in at \(restaurant.name)"
			
			if let imageToShare = UIImage(data: restaurant.image) {
				ActivityView(activityItems: [defaultText, imageToShare])
			} else {
				ActivityView(activityItems: [defaultText])
			}
		}
		
	}
}

#Preview {
	BasicTextImageRow(restaurant: (PersistenceController.testData?.first)!)
		.previewLayout(.sizeThatFits)
}
