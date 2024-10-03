//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
            Text(appetizer.name)
            Text(appetizer.description)
            HStack {
                VStack {
                    Text("Calories")
                    Text("\(appetizer.calories)")
                }
                VStack {
                    Text("Carbs")
                    Text("\(appetizer.carbs)")
                }
                VStack {
                    Text("Protein")
                    Text("\(appetizer.protein)")
                }
            }
            Button {
                
            } label: {
                Text("\(appetizer.price) - Add to Order")
            }
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}
