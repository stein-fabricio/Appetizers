//
//  Empty State.swift
//  Appetizers
//
//  Created by Stein on 15/10/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(imageName)//"empty-order")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)//"No appetizer to order.")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -30)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "No appetizer to order.")
}
