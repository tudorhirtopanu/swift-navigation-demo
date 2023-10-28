//
//  NavigationStackDemoApp.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 19/10/2023.
//

import SwiftUI
import SwiftData

@main
struct NavigationStackDemoApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: ModuleData.self)
    }
}
