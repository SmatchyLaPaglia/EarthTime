//
//  ContentView.swift
//  EarthTime Watch App
//
//  Created by Jesse Wonder Clark on 9/9/23.
//

import UIKit
import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var screenSize: CGSize = .zero
    var formattedLongitude: String {
        if let location = locationManager.currentLocation {
            return String(format: "Longitude: %.4f", location.coordinate.longitude)
        } else {
            return "Fetching location..."
        }
    }
    
    var body: some View {
        ZStack {
            // Capture screen size using GeometryReader
            GeometryReader { geometry in
                Color.clear.onAppear {
                    screenSize = geometry.size
                }
            }
            
            // Main content
            VStack() {
                Spacer()
                // Sun Image
                Image("sun")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenSize.width * 0.08, height: screenSize.width * 0.08)
                
                // Earth Image
                Image("earthFromNorthPole")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenSize.width * 0.9, height: screenSize.width * 0.9)
                Spacer()
                // Longitude Text
                Text(formattedLongitude)
                    .font(.system(size: screenSize.width * 0.064))
                Spacer()

            }
            .scaledToFill()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
