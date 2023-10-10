//
//  ActivityView.swift
//  FoodPin
//
//  Created by Артем Сергеев on 08.10.2023.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
	
	var activityItems: [Any]
	var applicationActivities: [UIActivity]? = nil
	
	func makeUIViewController(context: Context) -> some UIViewController {
		let activityController = UIActivityViewController(
			activityItems: activityItems,
			applicationActivities: applicationActivities)
		return activityController
	}
	
	func updateUIViewController(
		_ uiViewController: UIViewControllerType,
		context: Context) {
		
	}
}
