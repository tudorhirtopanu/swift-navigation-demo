//
//  LearnView.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

struct LearnView: View {
    
    @Binding var path:NavigationPath
    
    var body: some View {
        Text("Learn View")
    }
}

#Preview {
    LearnView(path: .constant(NavigationPath()))
}
