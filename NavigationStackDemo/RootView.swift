//
//  ContentView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 19/10/2023.
//

import SwiftUI
import SwiftData

enum AppNav:Hashable, Identifiable{
    case module(ModuleNavigation)
    case moduleDetail(ModuleDetailNavigation)
    
    var id: Self { self }
}

struct RootView: View {
    
    @State var selectedTab: Tabs = .home
    
    @State var path:[AppNav] = []
    @StateObject var nm = NavigationManager()
    
    var body: some View {
        
        NavigationStack(path: $path){
                            
                VStack(spacing:0){
                    
                    switch selectedTab {
                    case .home:
                        HomeView(path: $path)
                            .environmentObject(nm)
                    case .modules:
                        LearnView(path: $path)
                    case .saved:
                        SavedView(path: $path)
                            .environmentObject(nm)
                    }
                    
                    Spacer()
                    
                    CustomTabBar(selectedTab: $selectedTab)
                }
                .navigationDestination(for: AppNav.self) { state in
                    switch state {
                        
                    case .module(.java):
                        ModuleView(module: "Java", destination: .moduleDetail(.Java), path: $path)
                    case .module(.python):
                        ModuleView(module: "Python", destination: .moduleDetail(.Python), path: $path)
                    case .module(.swift):
                        ModuleView(module: "Swift", destination: .moduleDetail(.Swift), path: $path)
                    case .moduleDetail(.Java):
                        ModuleDetailView(path: $path, module: "Java")
                    case .moduleDetail(.Python):
                        ModuleDetailView(path: $path, module: "Python")
                    case .moduleDetail(.Swift):
                        ModuleDetailView(path: $path, module: "Swift")
                        
                    }
                }                
            
        }
        
    }
}

#Preview {
    RootView()
        .modelContainer(previewContainer)
}
