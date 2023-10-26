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
    
    //@Binding var path:NavigationPath
    @Binding var path:[AppNav]
    
    var body: some View {
        
        NavigationStack(path: $path){
            
            VStack{
                
                List{
                    
                    NavigationLink(value: ModuleNavigation.java, label: {
                        HStack {
                            Image("JavaIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                            Text("Java")
                        }
                    })
                    
                    NavigationLink(value: AppNav.module(.java), label: {
                        HStack {
                            Image("JavaIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                            Text("Java")
                        }
                    })
                    
                    NavigationLink(value: ModuleNavigation.python, label: {
                        HStack {
                            Image("PythonIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                            Text("Python")
                        }
                    })
                    
                    NavigationLink(value: ModuleNavigation.swift, label: {
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
            
            .navigationDestination(for: AppNav.self) { state in
                switch state {
                    
                case .module(.java):
                    ModuleView(module: "Java", destination: .Java, path: $path)
                case .module(.python):
                    ModuleView(module: "Python", destination: .Python, path: $path)
                case .module(.swift):
                    ModuleView(module: "Swift", destination: .Swift, path: $path)
                case .moduleDetail(_):
                    EmptyView()
                    
                }
            }
            
        }
        
    }
}

#Preview {
    LearnView(path: .constant([]))
}
