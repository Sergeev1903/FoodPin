//
//  TutorialPage.swift
//  FoodPin
//
//  Created by Артем Сергеев on 21.10.2023.
//

import SwiftUI


struct TutorialPage: View {
	
	let image: String
	let heading: String
	let subHeading: String
	
	var body: some View {
		VStack(spacing: 70) {
			Image(image)
				.resizable()
				.scaledToFit()
			
			VStack(spacing: 10) {
				Text(heading)
					.font(.headline)
				
				Text(subHeading)
					.font(.body)
					.foregroundColor(.gray)
					.multilineTextAlignment(.center)
			}
			.padding(.horizontal, 40)
			
			Spacer()
		}
		.padding(.top)
	}
}



#Preview {
	TutorialPage(image: "onboarding-1", heading: "CREATE YOUR OWN FOOD GUIDE", subHeading: "Pin your favorite restaurants and create your own food guide")
		.previewLayout(.sizeThatFits)
		.previewDisplayName("TutorialPage")
}
