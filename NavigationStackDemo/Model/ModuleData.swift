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
    
    //@Attribute(.unique)
    var recentlyAccessedModule:[String]
    var moduleName:String
    
    init(recentlyAccessedModule:[String], moduleName:String){
        
        self.id = UUID().uuidString
        self.recentlyAccessedModule = recentlyAccessedModule
        self.moduleName = moduleName
    }
    
}
