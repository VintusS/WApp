//
//  WelcomeView.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 12.02.2025.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                VStack(spacing: 20) {
                    Text("Welcome to the WApp")
                        .bold()
                        .font(.title)
                    
                    Text("In order to check the weather in your location, please share your current location")
                        .padding()
                }
                .multilineTextAlignment(.center)
                .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .clipShape(Capsule())
                .symbolVariant(.fill)
                .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    WelcomeView()
}
