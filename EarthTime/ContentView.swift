//
//  ContentView.swift
//  EarthTime
//
//  Created by Jesse Wonder Clark on 9/9/23.
//

import CoreLocation
import SwiftUI

struct CompanionContentView: View {
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.currentLocation {
                Text("Latitude: \(location.coordinate.latitude)")
                Text("Longitude: \(location.coordinate.longitude)")
                Image("earthFromNorthPole")
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Fetching location...")
            }
        }
        .padding()
    }
}


struct CompanionContentView_Previews: PreviewProvider {
    static var previews: some View {
        CompanionContentView()
    }
}
