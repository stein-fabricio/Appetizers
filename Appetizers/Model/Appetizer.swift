//
//  Item.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import Foundation
import SwiftData

//@Model
//final class Appetizer {
//    var timestamp: Date
//    
//    init(timestamp: Date) {
//        self.timestamp = timestamp
//    }
//}
struct Appetizer: Identifiable, Decodable, Hashable { /// we only need to decode json. If both, Codable.
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let carbs: Int
    let protein: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 1,
                                           name: "Test Appetizers",
                                           description: "This is the description for my appetizer. Its yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 12,
                                           carbs: 34,
                                           protein: 50)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 0001,
                                           name: "Test Appetizers One",
                                           description: "This is the description for my appetizer. Its yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 12,
                                           carbs: 34,
                                           protein: 50)
    static let orderItemTwo = Appetizer(id: 0002,
                                           name: "Test Appetizers Two",
                                           description: "This is the description for my appetizer. Its yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 12,
                                           carbs: 34,
                                           protein: 50)
    static let orderItemThree = Appetizer(id: 0003,
                                           name: "Test Appetizers Three",
                                           description: "This is the description for my appetizer. Its yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 12,
                                           carbs: 34,
                                           protein: 50)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
