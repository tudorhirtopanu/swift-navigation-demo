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
    
    // Define the rawValue for each case
       var rawValue: String {
           switch self {
           case .Java: return "Java"
           case .Python: return "Python"
           case .Swift: return "Swift"
           }
       }
       
       // Initialize from rawValue
       init?(rawValue: String) {
           switch rawValue {
           case "Java": self = .Java
           case "Python": self = .Python
           case "Swift": self = .Swift
           default: return nil
           }
       }
}

struct ModuleView: View {
    
    var module:String
    var destination:AppNav
   // @Binding var path:NavigationPath
    @Binding var path:[AppNav]
    
    var body: some View {
        VStack {
            
            Text(module)
            
            Image("\(module)Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
            NavigationLink(value: destination, label: {
                Text("Go to Detail View")
            })
            
            
            
        }
        
    }
}

#Preview {
    ModuleView(module: "Java", destination: .moduleDetail(.Java), path: .constant([]))
}
