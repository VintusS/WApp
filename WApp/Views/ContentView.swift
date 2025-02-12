//
//  ContentView.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 12.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State var weatherManager: WeatherManager?
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    //weather view
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                if weatherManager == nil {
                                    weatherManager = try await WeatherManager()
                                }
                                if let manager = weatherManager {
                                    weather = try await weatherManager?.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                }
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
        .task {
            do {
                weatherManager = try await WeatherManager()
            } catch {
                print("Failed ot initialize WeatherManager: \(error)")
            }
        }
    }
    
}

#Preview {
    ContentView()
}
