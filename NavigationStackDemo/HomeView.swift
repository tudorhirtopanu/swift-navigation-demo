//
//  HomeView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var path:NavigationPath
    
    var body: some View {
        VStack {
            
            Button(action: {
                path.append(ModuleNavigation.java)
            }, label: {
                Text("Feature View")
            })
            
            Text("Home View")
        }
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
}
