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
    
    @Binding var path:NavigationPath
    
    var body: some View {
        
        NavigationStack(path: $path){
            
            VStack{
                
                List{
                    
                    NavigationLink(value: ModuleNavigation.java, label: {
                        Text("Java")
                    })
                    
                    NavigationLink(value: ModuleNavigation.python, label: {
                        Text("Python")
                    })
                    
                    NavigationLink(value: ModuleNavigation.swift, label: {
                        Text("Swift")
                    })
                    
                }
                
            }
            .navigationDestination(for: ModuleNavigation.self) { state in
                switch state {
                case .java:
                    ModuleView(module: "Java", destination: .Java, path: $path)
                case .python:
                    ModuleView(module: "Python", destination: .Python, path: $path)
                case .swift:
                    ModuleView(module: "Swift", destination: .Swift, path: $path)
                }
            }
            
        }
        
    }
}

#Preview {
    LearnView(path: .constant(NavigationPath()))
}
