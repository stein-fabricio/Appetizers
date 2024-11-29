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
    
    //MARK: Network
    
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
    
    //MARK: Forms
    
    static let invalidEmail         = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please check your email."),
                                            dismissButton: .default(Text("Ok")))
    static let invalidField         = AlertItem(title: Text("Invalid Field"),
                                            message: Text("Please fill all fields."),
                                            dismissButton: .default(Text("Ok")))
    static let userSaveSuccess      = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was successfully saved."),
                                            dismissButton: .default(Text("Ok")))
    static let userSaveFailure      = AlertItem(title: Text("Profile Error"),
                                            message: Text("Your profile information could not be saved."),
                                            dismissButton: .default(Text("Ok")))
}
