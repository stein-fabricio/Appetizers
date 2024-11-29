//
//  User.swift
//  Appetizers
//
//  Created by Stein on 03/10/24.
//

import UIKit

struct User: Codable { /// have to convert do Data before saving it
    
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthday: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
    
}
