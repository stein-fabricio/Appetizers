//
//  Error.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
