//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else {return}
        print("\(#function)")
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            self.alertItem = AlertContext.userSaveSuccess
        } catch {
            self.alertItem = AlertContext.userSaveFailure
        }
    }
    
    func retrieveUser() {
        guard let userData else {return}
        print("\(#function)")
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            self.user = user
        } catch {
            // error
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            self.alertItem = AlertContext.invalidField
            return false}
        guard user.email.isValidEmail else {
            self.alertItem = AlertContext.invalidEmail
            return false}
        self.alertItem = nil
        return true
    }
}
