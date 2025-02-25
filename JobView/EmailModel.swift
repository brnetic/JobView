//
//  EmailModel.swift
//  JobView
//
//  Created by Luka Brnetic on 2/24/25.
//

import Foundation

struct Email: Identifiable, Codable {
    let id = UUID() // For use in SwiftUI Lists
    let company: String
    let status: String
    let date: String
    let role: String// You can later convert this to a Date if needed.
}
