//
//  WAppApp.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 12.02.2025.
//

import SwiftUI

@main
struct WAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        try await KeyConstant.loadAPIKeys()
                    } catch {
                        debugPrint(error.localizedDescription)
                    }
                }
        }
    }
}
