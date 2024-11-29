//
//  ContentView.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI
import SwiftData

struct AppetizersTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {Label("Home", systemImage: "house")}
            
            AccountView()
                .tabItem {Label("Account", systemImage: "person")}
            
            OrderView()
                .tabItem {Label("Order", systemImage: "bag")}
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizersTabView()
}
