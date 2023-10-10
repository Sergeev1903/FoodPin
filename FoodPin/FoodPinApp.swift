//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Артем Сергеев on 02.10.2023.
//

import SwiftUI


@main
struct FoodPinApp: App {
	var body: some Scene {
		WindowGroup {
			RestaurantListView()
		}
	}
	
	init() {
		let navBarAppearance = UINavigationBarAppearance()
		navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.appAccent, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
		navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.appAccent, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
		navBarAppearance.backgroundColor = .clear
		navBarAppearance.backgroundEffect = .none
		navBarAppearance.shadowColor = .clear
		
		UINavigationBar.appearance().standardAppearance = navBarAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
		UINavigationBar.appearance().compactAppearance = navBarAppearance
	}
	
}
