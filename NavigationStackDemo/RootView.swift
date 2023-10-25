//
//  ContentView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 19/10/2023.
//

import SwiftUI

enum AppNav {
    
}

struct RootView: View {
    
    @State var selectedTab: Tabs = .home
    
    @State var path:NavigationPath = NavigationPath()
    @State var stackPath:[String] = []
    
    var body: some View {
        
        NavigationStack(path: $path){
                            
                VStack(spacing:0){
                    
                    switch selectedTab {
                    case .home:
                        HomeView(path: $path)
                    case .modules:
                        LearnView(path: $path)
                    case .saved:
                        SavedView(path: $path)
                    }
                    
                    Spacer()
                    
                    CustomTabBar(selectedTab: $selectedTab)
                }
                .navigationDestination(for: ModuleNavigation.self) { state in
                    switch state {
                    case .java:
                        ModuleView(module: "Java", destination: .Java, path: $path)
                    case .python:
                        ModuleView(module: "Python", destination: .Python, path: $path)
                    case .swift:
                        ModuleView(module: "Swift", destination: .Swift, path: $path)
                    }
                }
            
        }
        
    }
}

#Preview {
    RootView()
}
