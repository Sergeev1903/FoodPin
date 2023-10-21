//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Артем Сергеев on 18.10.2023.
//

import SwiftUI

struct NewRestaurantView: View {
	
	@State private var restaurantImage = UIImage(named: "newphoto")!
	@State private var showPhotoOptions = false
	@State private var photoSource: PhotoSource?
	@Environment(\.dismiss) var dismiss
	
	enum PhotoSource: Identifiable {
		case photoLibrary
		case camera
		
		var id: Int {
			hashValue
		}
	}
	
	var body: some View {
		
		NavigationView {
			
			ScrollView {
				
				VStack {
					
					Image(uiImage: restaurantImage)
						.resizable()
						.scaledToFill()
						.frame(minWidth: 0, maxWidth: .infinity)
						.frame(height: 200)
						.background(Color(.systemGray6))
						.clipShape(RoundedRectangle(cornerRadius: 20.0))
						.padding(.bottom)
						.onTapGesture {
							self.showPhotoOptions.toggle()
						}
					
					FormTextField(label: "NAME", placeholder: "Fill in the restaurant name", value: .constant(""))
					
					FormTextField(label: "TYPE", placeholder: "Fill in the restaurant type", value: .constant(""))
					
					FormTextField(label: "ADDRESS", placeholder: "Fill in the restaurant address", value: .constant(""))
					
					FormTextField(label: "PHONE", placeholder: "Fill in the restaurant phone", value: .constant(""))
					
					FormTextView(label: "DESCRIPTION", height: 100, value: .constant(""))
				}
				.padding()
			}
			// Navigation bar configuration
			.navigationTitle("New Restaurant")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button(action: {
						dismiss()
					}) {
						Image(systemName: "xmark")
							.accentColor(.primary)
					}
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					Text("Save")
						.font(.headline)
						.foregroundColor(Color("NavigationBarTitle"))
				}
			}
		}
		.actionSheet(isPresented: $showPhotoOptions) {
			ActionSheet(title: Text("Choose your photo source"),
									message: nil,
									buttons: [
										.default(Text("Camera")) {
											self.photoSource = .camera
										},
										.default(Text("Photo Library")) {
											self.photoSource = .photoLibrary
										},
										.cancel()
									])
		}
		.fullScreenCover(item: $photoSource) { source in
			switch source {
			case .photoLibrary: ImagePicker(sourceType: .photoLibrary, selectedImage: $restaurantImage).ignoresSafeArea()
			case .camera: ImagePicker(sourceType: .camera, selectedImage: $restaurantImage).ignoresSafeArea()
			}
		}
	}
}

#Preview {
	NewRestaurantView()
}
