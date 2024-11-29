//
//  AFButton.swift
//  Apple Frameworks
//
//  Created by Stein on 03/09/24.
//

import SwiftUI

struct OrderButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(.brandPrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    OrderButton(title: "Test title")
}
