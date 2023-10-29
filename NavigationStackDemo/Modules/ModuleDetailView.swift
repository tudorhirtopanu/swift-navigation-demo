//
//  ModuleDetailView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI
import SwiftData

struct ModuleDetailView: View {
    
   // @Binding var path:NavigationPath
    @Binding var path:[AppNav]
    var module:String
    @Environment(\.modelContext) private var context
    @Query private var items: [ModuleData]
    
    var body: some View {
        VStack{
            
            Button(action: {
                path = [.module(.python), .moduleDetail(.Swift)]
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            Text("This is the \(module) module")
            
            let rawValues = path.map { (appNav) -> String in
                switch appNav {
                case .module(let moduleNav):
                    return moduleNav.rawValue
                case .moduleDetail(let moduleDetailNav):
                    return moduleDetailNav.rawValue
                }
            }
            
            Button(action: {
                
                print(rawValues)
            }, label: {
                Text("Print path")
            })
            
            
            
        }
        .onAppear{
            
            let rawValues = path.map { (appNav) -> String in
                switch appNav {
                case .module(let moduleNav):
                    return moduleNav.rawValue
                case .moduleDetail(let moduleDetailNav):
                    return moduleDetailNav.rawValue
                }
            }
            
            if items.count>1 {
                context.delete(items[0])
            }
            
            NavigationManager.addRecentlyAccessed(itemToAdd: rawValues, moduleName: module, context: context)
        }
    }
}

//#Preview {
//    ModuleDetailView(path: .constant([]), module: "Java")
//}
