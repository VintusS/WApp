//
//  WeatherRow.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 12.02.2025.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            // logo
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(.gray.opacity(0.3))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                // row name
                Text(name)
                    .font(.caption)
                
                // row detail
                Text(value)
                    .font(.title)
                    .bold()
            }
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Feels like", value: "8º")
}
