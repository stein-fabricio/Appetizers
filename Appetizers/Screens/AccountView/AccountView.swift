//
//  AccountView.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName
        case lastName
        case email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .onSubmit() {
                            focusedTextField = nil /// dismiss
                        }
                        .submitLabel(.continue)
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save Changes")
                            .fontWeight(.light)
                            .foregroundColor(.brandPrimary)
                    })
                }
                
                Section(header: Text("Requests")) {
                    Toggle(isOn: $viewModel.user.extraNapkins, label: {
                        Text("Extra Napkins")
                            .font(.headline)
                            .fontWeight(.light)
                    })
                    Toggle(isOn: $viewModel.user.frequentRefills, label: {
                        Text("Frequent Refills")
                            .font(.headline)
                            .fontWeight(.light)
                            .tint(.brandPrimary)
                    })
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("🪪 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
