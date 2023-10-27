//
//  LearnView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

enum ModuleNavigation: Identifiable {
    case java
    case python
    case swift
    
    var id: Self { self }
}

struct LearnView: View {
    
    @Binding var path:[AppNav]
    
    var body: some View {
        
        NavigationStack(path: $path){
            
            VStack{
                
                List{
                                        
                    NavigationLink(value: AppNav.module(.java), label: {
                        HStack {
                            Image("JavaIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                            Text("Java")
                        }
                    })
                    
                    NavigationLink(value: AppNav.module(.python), label: {
                        HStack {
                            Image("PythonIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                            Text("Python")
                        }
                    })
                    
                    NavigationLink(value: AppNav.module(.swift), label: {
                        HStack {
                            Image("SwiftIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                            Text("Swift")
                        }
                    })
                                                            
                }
                
            }
            .navigationDestination(for: AppNav.self) { state in
                switch state {
                    
                case .module(.java):
                    ModuleView(module: "Java", destination: .moduleDetail(.Java), path: $path)
                case .module(.python):
                    ModuleView(module: "Python", destination: .moduleDetail(.Python), path: $path)
                case .module(.swift):
                    ModuleView(module: "Swift", destination: .moduleDetail(.Swift), path: $path)
                case .moduleDetail(.Java):
                    ModuleDetailView(path: $path, module: "Java")
                case .moduleDetail(.Python):
                    ModuleDetailView(path: $path, module: "Python")
                case .moduleDetail(.Swift):
                    ModuleDetailView(path: $path, module: "Swift")
                    
                }
            }
            
        }
        
    }
}

#Preview {
    LearnView(path: .constant([]))
}
