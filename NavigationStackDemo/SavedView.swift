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
                addItem(itemToAdd: ["swift", "Swift"], moduleName: "Swift")
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
            
            Button(action: {
               // nm.moduleDestination = .swift
                addItem(itemToAdd: ["python", "Python"], moduleName: "Python")
            }, label: {
                ZStack {
                    
                    VStack {
                        Image("PythonIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                        Text("Python")
                    }
                }
            })
            .foregroundStyle(Color.black)
            
        }
    }
    
    func addItem(itemToAdd:[String], moduleName:String) {
        
        let item = ModuleData(recentlyAccessedModule: itemToAdd, moduleName: moduleName)
        print("item added")
        context.insert(item)
        
    }
    
}

#Preview {
    SavedView(path: .constant([]))
        .environmentObject(NavigationManager())
}
