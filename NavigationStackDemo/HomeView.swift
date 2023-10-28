//
//  HomeView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var path:[AppNav]
    @EnvironmentObject var nm: NavigationManager
    
   // var map:[[AppNav]:ButtonModuleValue] = [:]
    @State var recentlyAccessedModules:[[AppNav]] = [[.module(.java), .moduleDetail(.Java)]]
    
    let stringValues: [String] = ["swift", "Swift", "java", "Java"]
    
    var body: some View {
        VStack {
            
            Text(String(recentlyAccessedModules.count))
            
            
            
            Button(action: {
                
               // path.append(contentsOf: [.module(.java), .moduleDetail(.Java)])
                
                path.append(contentsOf: stringValues.compactMap { stringValue in
                    if let moduleNavigation = ModuleNavigation(rawValue: stringValue) {
                        return .module(moduleNavigation)
                    } else if let moduleDetailNavigation = ModuleDetailNavigation(rawValue: stringValue) {
                        return .moduleDetail(moduleDetailNavigation)
                    } else {
                        return nil
                    }
                })
                
            }, label: {
                Text("Feature View")
            })
            
            Text("Home View")
        }
        
    }
}

#Preview {
    HomeView(path: .constant([]))
        .environmentObject(NavigationManager())
}
