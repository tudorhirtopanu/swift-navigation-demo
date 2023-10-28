//
//  HomeView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Binding var path:[AppNav]
    
    @EnvironmentObject var nm: NavigationManager
    @Query private var items: [ModuleData]
    @Environment(\.modelContext) private var context
   // var map:[[AppNav]:ButtonModuleValue] = [:]
    @State var recentlyAccessedModules:[[AppNav]] = [[.module(.java), .moduleDetail(.Java)]]
    
    let stringValues: [String] = ["swift", "Swift", "java", "Java"]
    
    var body: some View {
        VStack {
            
            List{
                ForEach(items) {item in
                    
                    Button(action: {
                        for item in items {
                            for stringValue in item.recentlyAccessedModule {
                                if let moduleNavigation = ModuleNavigation(rawValue: stringValue) {
                                    path.append(.module(moduleNavigation))
                                } else if let moduleDetailNavigation = ModuleDetailNavigation(rawValue: stringValue) {
                                    path.append(.moduleDetail(moduleDetailNavigation))
                                }
                            }
                        }

                        print(item.recentlyAccessedModule)
                    }, label: {
                        Text("Recent Module")
                    })
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        deleteItem(items[index])
                    }
                })
            }
            
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
    
    func deleteItem(_ item: ModuleData){
        context.delete(item)
    }
    
}

#Preview {
    HomeView(path: .constant([]))
        .environmentObject(NavigationManager())
}
