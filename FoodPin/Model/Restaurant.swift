//
//  Restaurant.swift
//  FoodPin
//
//  Created by Артем Сергеев on 07.10.2023.
//

import Foundation


struct Restaurant {
	var name: String = ""
	var type: String = ""
	var location: String = ""
	var image: String = ""
	var isFavorite: Bool = false
	
	init(name: String, type: String, location: String, image: String, isFavorite: Bool) {
		self.name = name
		self.type = type
		self.location = location
		self.image = image
		self.isFavorite = isFavorite
	}
}
