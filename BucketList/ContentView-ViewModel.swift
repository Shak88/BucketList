//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Shokri Alnajjar on 12/07/2022.
//

import Foundation
import MapKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        @Published var locations = [Location]()
        
        @Published var selectedPlace : Location?
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(newLocation)
        }
        
        func update(location: Location){
            guard let selectedPlace = selectedPlace else {
                return
            }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
        
    }
}
