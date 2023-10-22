//
//  ContentView.swift
//  FoodPin
//
//  Created by Артем Сергеев on 02.10.2023.
//

import SwiftUI


import SwiftUI

struct RestaurantListView: View {
	@Environment(\.managedObjectContext) var context
	
	@FetchRequest(
		entity: Restaurant.entity(),
		sortDescriptors: [])
	var restaurants: FetchedResults<Restaurant>
	
	@AppStorage("hasViewedWalkthrough") var hasViewedWalkthrough: Bool = false
	
	@State private var showNewRestaurant = false
	@State private var searchText = ""
	@State private var showWalkthrough = false
	
	var body: some View {
		NavigationView {
			List {
				if restaurants.count == 0 {
					Image("emptydata")
						.resizable()
						.scaledToFit()
				} else {
					ForEach(restaurants.indices, id: \.self) { index in
						ZStack(alignment: .leading) {
							NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])) {
								EmptyView()
							}
							.opacity(0)
							
							BasicTextImageRow(restaurant: restaurants[index])
						}
					}
					.onDelete(perform: deleteRecord)
					.listRowSeparator(.hidden)
				}
			}
			
			.listStyle(.plain)
			
			.navigationTitle("FoodPin")
			.navigationBarTitleDisplayMode(.automatic)
			
			.toolbar {
				Button(action: {
					self.showNewRestaurant = true
				}) {
					Image(systemName: "plus")
				}
			}
		}
		.accentColor(.primary)
		.sheet(isPresented: $showNewRestaurant) {
			NewRestaurantView()
		}
		.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search restaurants...")
		.onChange(of: searchText) { searchText in
			let predicate = searchText.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "name CONTAINS[c] %@ OR location CONTAINS[c] %@", searchText, searchText)
			restaurants.nsPredicate = predicate
		}
		.sheet(isPresented: $showWalkthrough) {
			TutorialView()
		}
		.onAppear() {
				showWalkthrough = hasViewedWalkthrough ? false : true
		}
	}
	
	private func deleteRecord(indexSet: IndexSet) {
		
		for index in indexSet {
			let itemToDelete = restaurants[index]
			context.delete(itemToDelete)
		}
		
		DispatchQueue.main.async {
			do {
				try context.save()
				
			} catch {
				print(error)
			}
		}
	}
}




#Preview {
	RestaurantListView()
		.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

