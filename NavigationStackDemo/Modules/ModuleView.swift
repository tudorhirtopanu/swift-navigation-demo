//
//  ModuleView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

enum ModuleDetailNavigation:Identifiable {
    
    case Java
    case Python
    case Swift
    
    var id: Self { self }
}

struct ModuleView: View {
    
    var module:String
    var destination:ModuleDetailNavigation
    @Binding var path:NavigationPath
    
    var body: some View {
        VStack {
            
            Text(module)
            
            NavigationLink(value: destination, label: {
                Text("Go to Detail View")
            })
            
        }
        .navigationDestination(for: ModuleDetailNavigation.self) { state in
            
            switch state {
            case .Java:
                ModuleDetailView(path: $path, module: "Java")
            case .Python:
                ModuleDetailView(path: $path, module: "Python")
            case .Swift:
                ModuleDetailView(path: $path, module: "Swift")
            }
            
        }
    }
}

#Preview {
    ModuleView(module: "Java", destination: .Java, path: .constant(NavigationPath()))
}
