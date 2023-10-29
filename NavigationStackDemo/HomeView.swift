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
        
    var body: some View {
        VStack {
            Text("Recently Accessed")
            List{
                ForEach(items.reversed()) {item in
                    
                    Button(action: {
                        
                        path = item.recentlyAccessedModule.compactMap { stringValue in
                            if let moduleNavigation = ModuleNavigation(rawValue: stringValue) {
                                return .module(moduleNavigation)
                            } else if let moduleDetailNavigation = ModuleDetailNavigation(rawValue: stringValue) {
                                return .moduleDetail(moduleDetailNavigation)
                            } else {
                                return nil
                            }
                        }

                    }, label: {
                        Text(item.moduleName)
                    })
                    
                    
                    
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        deleteItem(items[index])
                    }
                })
            }
            
            Button(action: {
                //var lastItem = items.count - 1
                deleteItem(items[0])
            }, label: {
                Text("Shuffle")
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
