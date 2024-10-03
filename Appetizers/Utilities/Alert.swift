//
//  Alert.swift
//  Scanner
//
//  Created by Stein on 02/10/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text // SwiftUI
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title: Text("Server Error 1.1"),
                                            message: Text("The data received from server was invalid. Please try again later or contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let invalidResponse  = AlertItem(title: Text("Server Error 1.2"),
                                            message: Text("The response received from server was invalid. Please try again later or contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let invalidURL       = AlertItem(title: Text("Server Error 1.3"),
                                            message: Text("The URL used was invalid. Please try again later or contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server Error 1.4"),
                                            message: Text("Unable to complete your request at the time. Please check your connection."),
                                            dismissButton: .default(Text("Ok")))
}
