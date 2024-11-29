//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI
import SwiftData

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizersTabView().environmentObject(order)
        }
    }
}
