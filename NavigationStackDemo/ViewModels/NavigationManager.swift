//
//  NavigationManager.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 26/10/2023.
//

import Foundation

class NavigationManager: ObservableObject {
    
    @Published var moduleDestination:ModuleNavigation = .java
    @Published var moduleDetailDestination:ModuleDetailNavigation? = .Java
    
}
