//
//  CustomBackgroundView.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 13.02.2025.
//

import SwiftUI

struct CustomBackgroundView: View {
    @State var appear = false
    
    // Initial state
    let initialPoints: [SIMD2<Float>] = [
        SIMD2(0.0, 0.0), SIMD2(0.5, 0.0), SIMD2(1.0, 0.0),
        SIMD2(0.0, 0.5), SIMD2(0.3, 0.7), SIMD2(1.0, 0.5),
        SIMD2(0.0, 1.0), SIMD2(0.5, 1.0), SIMD2(1.0, 1.0)
    ]
    let initialColors: [Color] = [
        .blue, .cyan, .indigo,
        .purple, .teal, .mint,
        .blue.opacity(0.8), .indigo.opacity(0.9), .cyan.opacity(0.7)
    ]
        
    // Final state
    let finalPoints: [SIMD2<Float>] = [
        SIMD2(0.0, 0.0), SIMD2(0.5, 0.0), SIMD2(1.0, 0.0),
        SIMD2(0.0, 0.5), SIMD2(0.7, 0.3), SIMD2(1.0, 0.5),
        SIMD2(0.0, 1.0), SIMD2(0.5, 1.0), SIMD2(1.0, 1.0)
    ]
    let finalColors: [Color] = [
        .cyan, .indigo, .blue,
        .mint, .teal, .purple,
        .indigo.opacity(0.9), .cyan.opacity(0.7), .blue.opacity(0.8)
    ]
    
    var body: some View {
        MeshGradient (
            width: 3,
            height: 3,
            points: appear ? initialPoints : finalPoints,
            colors: appear ? initialColors : finalColors
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(
                .easeInOut(duration: 2)
                .repeatForever(autoreverses: true)
            ) {
                appear.toggle()
            }
        }
    }
}

#Preview {
    CustomBackgroundView()
}
