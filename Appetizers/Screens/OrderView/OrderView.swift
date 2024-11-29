//
//  OrderView.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel = OrderViewModel()
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        //ForEach(MockData.orderItems) { appetizer in
//                        ForEach(viewModel.appetizers) { appetizer in
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                                .onTapGesture {
                                    //                            viewModel.selectedAppetizer = appetizer
                                    //                            viewModel.isShowingDetail = true
                                }
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.removeAppetizer(indexSet)
                            order.deleteItems(at: indexSet)
                        })
                    }
                    .listStyle(.plain) /// so it's not a rounded rect different from bg
                    .navigationTitle("🛎️ Order")
                    //                .disabled(viewModel.isShowingDetail)
                }
                
                Spacer()
                
//                if !viewModel.isEmpty {
                if !order.items.isEmpty {
                    Button {
                        // order
                        print("Order placed.")
                    } label: {
                        OrderButton(title: "$\(order.totalPrice) - Place Order")
                            .padding()
                    }
                }
            }
            .onAppear {
                viewModel.getAppetizers()
            }
//            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isLoading {
                LoadingView()
                //            } else if viewModel.appetizers.isEmpty {
            } else if order.items.isEmpty {
                EmptyState(imageName: "empty-order", message: "No appetizer to order.")
            } else {
                
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    OrderView()
}
