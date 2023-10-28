//
//  SavedView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 25/10/2023.
//

import SwiftUI
import SwiftData

struct SavedView: View {
    
    @Binding var path:[AppNav]
    @Environment(\.modelContext) private var context
    @EnvironmentObject var nm: NavigationManager
    
    var body: some View {
        VStack{
            
            Button(action: {
               // nm.moduleDestination = .swift
                addItem()
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
    
    func addItem() {
        
        let item = ModuleData(recentlyAccessedModule: ["swift", "Swift"])
        print("item added")
        context.insert(item)
        
    }
    
}

#Preview {
    SavedView(path: .constant([]))
        .environmentObject(NavigationManager())
}
