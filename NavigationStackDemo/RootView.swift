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
    
    @State var path:NavigationPath = NavigationPath()
    @State var stackPath:[String] = []
    
    var body: some View {
        
        NavigationStack(path: $path){
            TabView{
                
                
                
                HomeView(path: $path)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                LearnView(path: $path)
                    .tabItem {
                        Label("Learn", systemImage: "list.bullet")
                    }
            }
        }
        
    }
}

#Preview {
    RootView()
}
