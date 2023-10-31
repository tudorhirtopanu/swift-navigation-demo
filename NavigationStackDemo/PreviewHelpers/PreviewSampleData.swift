//
//  PreviewSampleData.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 31/10/2023.
//

import Foundation
import SwiftData

let previewContainer:ModelContainer = {
    
    do{
        let container  = try ModelContainer(for: ModuleData.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        Task{ @MainActor in
            let context = container.mainContext
            
            let module = ModuleData.example()
            context.insert(module)
        }
        
        return container
    } catch {
        fatalError("Failed to create container with error: \(error.localizedDescription)")
    }
    
}()
