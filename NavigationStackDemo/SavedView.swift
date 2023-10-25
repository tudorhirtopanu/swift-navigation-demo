//
//  SavedView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 25/10/2023.
//

import SwiftUI

struct SavedView: View {
    
    @Binding var path:NavigationPath
    
    var body: some View {
        Text("Saved View")
    }
}

#Preview {
    SavedView(path: .constant(NavigationPath()))
}
