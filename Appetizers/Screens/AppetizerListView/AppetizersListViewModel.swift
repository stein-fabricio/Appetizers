//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI

final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
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
    }
    
    func getImage() {
        
    }
}
