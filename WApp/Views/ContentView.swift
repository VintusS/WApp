//
//  ContentView.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 12.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    @State private var keys: String = ""
    
    var body: some View {
        VStack {
            Button {
                showKeys()
            } label: {
                Text("Show keys")
                    .foregroundStyle(.white)
            }
            .buttonStyle(.bordered)
            Text("Keys: \(keys)")
                .foregroundStyle(.white)
            
//            if let location = locationManager.location {
//                Text("testing coordinates: \(location.latitude), \(location.longitude)")
//            } else {
//                if locationManager.isLoading {
//                    LoadingView()
//                } else {
//                    WelcomeView()
//                        .environmentObject(locationManager)
//                }
//            }
        }
        .padding()
        .preferredColorScheme(.dark)
        .ignoresSafeArea(edges: .all)
        .background(Color.blue.opacity(0.5))
    }
    
    func showKeys() {
        keys = """
                \(KeyConstant.APIKeys.testKey)
                \(KeyConstant.APIKeys.prodKey)
                """
    }
    
}

#Preview {
    ContentView()
}
