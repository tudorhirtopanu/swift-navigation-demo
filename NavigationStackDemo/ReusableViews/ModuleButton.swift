//
//  ModuleButton.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 26/10/2023.
//

import SwiftUI

struct ModuleButton: View {
    
    var module:String
    
    var body: some View {
        VStack {
            Button(action: {
                
            }, label: {
                ZStack {
                    
                    VStack {
                        Image("\(module)Icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                        Text(module)
                    }
                }
            })
            .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    ModuleButton(module: "Java")
}
