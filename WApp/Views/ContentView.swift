//
//  ContentView.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 12.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("testing coordinates: \(location.latitude), \(location.longitude)")
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .padding()
        .preferredColorScheme(.dark)
        .ignoresSafeArea(edges: .all)
        .background(Color.blue.opacity(0.5))
    }
}

#Preview {
    ContentView()
}
