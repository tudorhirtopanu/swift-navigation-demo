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
    
    var body: some View {
        VStack {
            
            Button(action: {
//                path.append(nm.moduleDestination)
//                if nm.moduleDetailDestination != nil {
//                    path.append(nm.moduleDetailDestination)
//                }
                //path.append(nm.moduleDetailDestination)
                //path.append(AppNav.module(.java))
                path.append(contentsOf: [.module(.java), .moduleDetail(.Java)])
                
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
