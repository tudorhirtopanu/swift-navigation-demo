//
//  TabBarButton.swift
//  NavigationStackDemo
//
//  Created by Tudor Hirtopanu on 24/10/2023.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText:String
    var imageName: String
    
    var body: some View {
        
        GeometryReader { geo in
                      
            VStack(alignment: .center, spacing: 4){
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                Text(buttonText)
                    .font(.caption)
                
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        
    }
}

#Preview {
    TabBarButton(buttonText: "Home", imageName: "house")
}
