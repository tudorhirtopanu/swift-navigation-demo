//
//  ModuleButton.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 26/10/2023.
//

import SwiftUI

enum ButtonModuleValue{
    case java(module: ModuleNavigation, detailView: ModuleDetailNavigation)
}

struct ModuleButton: View {
    
    var module:String
    
    var body: some View {
            Button(action: {
                
            }, label: {
                ZStack {
                    Rectangle()
                        .clipShape(.rect(cornerSize: CGSize(width: 10, height: 10)))
                        .shadow(radius: 5)
                        .foregroundStyle(.gray.opacity(0.15))
                        .frame(width: 150, height: 150)
                    VStack {
                        Image("\(module)Icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        //Text(module)
                    }
                }
            })
            .foregroundStyle(Color.black)
    }
}

#Preview {
    ModuleButton(module: "Java")
}
