//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Stein on 04/10/24.
//

import SwiftUI

final class OrderViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
//    @EnvironmentObject var order: Order
    
    var isEmpty: Bool {
//        return order.items.isEmpty
        return appetizers.isEmpty
    }
    
    func getAppetizers() {
        isLoading = true
//        self.appetizers = appetizersGlobal
//        self.appetizers = order.items
        
        isLoading = false
//        NetworkManager.shared.getAppetizers { [weak self] result in
//            DispatchQueue.main.async { [weak self] in/// we are on the main thread since we're updating appetizers
//                self?.isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self?.appetizers = appetizers
//                
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    switch error {
//                    case .invalidData:
//                        self?.alertItem = AlertContext.invalidData
//                        
//                    case .invalidResponse:
//                        self?.alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidURL:
//                        self?.alertItem = AlertContext.invalidURL
//                        
//                    case .unableToComplete:
//                        self?.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
    }
    
    func removeAppetizer(_ at: IndexSet) {
        appetizers.remove(atOffsets: at)
//        appetizersGlobal.remove(atOffsets: at)
//        order.items.remove(atOffsets: at)
    }
}

