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
            WelcomeView()
                .environmentObject(locationManager)
        }
        .padding()
        .ignoresSafeArea(edges: .all)
        .background(Color.blue.opacity(0.2))
    }
}

#Preview {
    ContentView()
}
