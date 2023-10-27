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
