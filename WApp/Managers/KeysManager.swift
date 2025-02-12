//
//  KeyConstants.swift
//  WApp
//
//  Created by Dragomir Mindrescu on 12.02.2025.
//

import Foundation

enum KeyConstant {
    static func loadAPIKeys() async throws {
        let request = NSBundleResourceRequest(tags: ["APIKey"])
        try await request.beginAccessingResources()
        
        let url = Bundle.main.url(forResource: "APIKeys", withExtension: "json")!
        let data = try Data(contentsOf: url)
        
        APIKeys.storage = try JSONDecoder().decode([String:String].self, from: data)
        
        request.endAccessingResources()
    }
    
    enum APIKeys {
        static fileprivate(set) var storage = [String: String]()
        
        static var testKey: String {storage["testAPIKey"] ?? ""}
        static var prodKey: String {storage["prodAPIKey"] ?? ""}
    }
}
