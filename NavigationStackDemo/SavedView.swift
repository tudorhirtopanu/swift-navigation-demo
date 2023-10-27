//
//  SavedView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 25/10/2023.
//

import SwiftUI

struct SavedView: View {
    
    @Binding var path:[AppNav]
    @EnvironmentObject var nm: NavigationManager
    
    var body: some View {
        VStack{
            
            Button(action: {
                nm.moduleDestination = .swift
            }, label: {
                ZStack {
                    
                    VStack {
                        Image("SwiftIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                        Text("Swift")
                    }
                }
            })
            .foregroundStyle(Color.black)
            
        }
    }
}

#Preview {
    SavedView(path: .constant([]))
        .environmentObject(NavigationManager())
}
