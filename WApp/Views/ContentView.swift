//
//  ContentView.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 12.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    Text("weather data fetched")
                } else {
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
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
