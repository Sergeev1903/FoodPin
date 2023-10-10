//
//  Restaurant.swift
//  FoodPin
//
//  Created by Артем Сергеев on 07.10.2023.
//

import Foundation


struct Restaurant {
	var name: String
	var type: String
	var location: String
	var phone: String
	var description: String
	var image: String
	var isFavorite: Bool
	
	init(name: String, type: String, location: String, phone: String, description: String, image: String, isFavorite: Bool = false) {
		self.name = name
		self.type = type
		self.location = location
		self.phone = phone
		self.description = description
		self.image = image
		self.isFavorite = isFavorite
	}
	
	init() {
		self.init(name: "", type: "", location: "", phone: "", description: "", image: "", isFavorite: false)
	}
}
