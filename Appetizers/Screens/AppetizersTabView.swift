//
//  ContentView.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI
import SwiftData

struct AppetizersTabView: View {

    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizersTabView()
}
