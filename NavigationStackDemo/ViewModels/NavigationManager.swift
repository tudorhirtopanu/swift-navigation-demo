//
//  NavigationManager.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 26/10/2023.
//

import Foundation
import SwiftData

class NavigationManager: ObservableObject {
    
    @Published var moduleDestination:ModuleNavigation = .java
    @Published var moduleDetailDestination:ModuleDetailNavigation? = .Java
   // @Environment(\.modelContext) private var context
    @Published var arrayOfRecentModules:[[String]] = []
    
    static func addRecentlyAccessed(itemToAdd:[String], moduleName:String, context:ModelContext) {
        
        let item = ModuleData(recentlyAccessedModule: itemToAdd, moduleName: moduleName)
        context.insert(item)
        
    }
    
}
