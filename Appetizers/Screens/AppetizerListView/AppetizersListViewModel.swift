//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI

@MainActor final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var selectedAppetizer: Appetizer?
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    
    /*
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [weak self] result in
            DispatchQueue.main.async { [weak self] in/// we are on the main thread since we're updating appetizers
                self?.isLoading = false
                switch result {
                case .success(let appetizers):
                    self?.appetizers = appetizers
                
                case .failure(let error):
                    print(error.localizedDescription)
                    switch error {
                    case .invalidData:
                        self?.alertItem = AlertContext.invalidData
                        
                    case .invalidResponse:
                        self?.alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        self?.alertItem = AlertContext.invalidURL
                        
                    case .unableToComplete:
                        self?.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }*/
     // async await approach:
    func getAppetizers() async {
        isLoading = true /// it's UI update, need to set class as MainActor
        do {
            let appetizers = try await NetworkManager.shared.getAppetizers()
            /// DispatchQueue.main.async { [weak self] in ...
            isLoading = false
            self.appetizers = appetizers
        } catch {
            if let error = error as? APError {
                switch error {
                case .invalidData:
                    alertItem = AlertContext.invalidData
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .unableToComplete:
                    alertItem = AlertContext.unableToComplete
                }
            } else {
                alertItem = AlertContext.unableToComplete
            }
            isLoading = false
        }
    }
}
