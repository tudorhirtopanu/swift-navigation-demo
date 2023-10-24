//
//  CustomTabBar.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

enum Tabs:Int {
    case home = 0
    case modules = 1
}

struct CustomTabButtonStyle: ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
        .cornerRadius(10)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
        .opacity(configuration.isPressed ? 0.9 : 1)
        
    }
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                selectedTab = .home
            }, label: {
                TabBarButton(buttonText: "Home", imageName: "house")
            })
            .buttonStyle(CustomTabButtonStyle())
            .foregroundColor(selectedTab == .home ? Color.black : Color.gray)
            
            Button(action: {
                selectedTab = .modules
            }, label: {
                TabBarButton(buttonText: "Modules", imageName: "list.bullet")
            })
            .buttonStyle(CustomTabButtonStyle())
            .foregroundColor(selectedTab == .modules ? Color.black : Color.gray)
            
        }
        .padding(.horizontal)
        .frame(height: 55)
        
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.home))
}
