//
//  ModuleData.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 28/10/2023.
//

import Foundation
import SwiftData

@Model
class ModuleData: Identifiable {
    
    var id:String
    var recentlyAccessedModule:[[String]]
    
    init(recentlyAccessedModule:[[String]]){
        
        self.id = UUID().uuidString
        self.recentlyAccessedModule = recentlyAccessedModule
        
    }
    
}
