//
//  ModuleDetailView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI
import SwiftData

struct ModuleDetailView: View {
    
   // @Binding var path:NavigationPath
    @Binding var path:[AppNav]
    var module:String
    @Environment(\.modelContext) private var context
    @Query private var items: [ModuleData]
    
    var body: some View {
        VStack{
            
            Text("This is the \(module) module")
            
            let rawValues = path.map { (appNav) -> String in
                switch appNav {
                case .module(let moduleNav):
                    return moduleNav.rawValue
                case .moduleDetail(let moduleDetailNav):
                    return moduleDetailNav.rawValue
                }
            }
            
            Button(action: {
                
                print(rawValues)
            }, label: {
                Text("Print path")
            })
            
            
            
        }
        .onAppear{
            
            let rawValues = path.map { (appNav) -> String in
                switch appNav {
                case .module(let moduleNav):
                    return moduleNav.rawValue
                case .moduleDetail(let moduleDetailNav):
                    return moduleDetailNav.rawValue
                }
            }
            
            // TODO: if module is first and is accessed, it deletes the other module
            
            //let item = ModuleData(recentlyAccessedModule: rawValues, moduleName: module)
            
            if items.reversed()[0].recentlyAccessedModule != rawValues {
                if items.count>2 {
                    context.delete(items[0])
                    print("deleted2 \(items[0])")
                }
                // add module back
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    NavigationManager.addRecentlyAccessed(itemToAdd: rawValues, moduleName: module, context: context)
                }
                
            }
            
            
                        
            
            
        }
    }
}

//#Preview {
//    ModuleDetailView(path: .constant([]), module: "Java")
//}
