//
//  User.swift
//  JobView
//
//  Created by Luka Brnetic on 2/26/25.
//

import Foundation


struct User: Codable {
    
    let email: String
    let JobsApplied: [Email]
}
