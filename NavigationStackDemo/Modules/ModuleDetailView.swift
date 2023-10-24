//
//  ModuleDetailView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

struct ModuleDetailView: View {
    
    @Binding var path:NavigationPath
    var module:String
    
    var body: some View {
        VStack{
            
            Text("This is the \(module) module")
            
        }
    }
}

#Preview {
    ModuleDetailView(path: .constant(NavigationPath()), module: "Java")
}
