//
//  ModuleDetailView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

struct ModuleDetailView: View {
    
   // @Binding var path:NavigationPath
    @Binding var path:[AppNav]
    var module:String
    
    var body: some View {
        VStack{
            
            Button(action: {
                path = [.module(.python), .moduleDetail(.Swift)]
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            Text("This is the \(module) module")
            
        }
    }
}

#Preview {
    ModuleDetailView(path: .constant([]), module: "Java")
}
