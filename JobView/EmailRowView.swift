//
//  EmailRowView.swift
//  JobView
//
//  Created by Luka Brnetic on 2/24/25.
//

import SwiftUI

struct EmailRowView: View {
    let email: Email

    // Determine the color for the status text.
    var statusColor: Color {
        switch email.status {
        case "accepted":
            return .green
        case "Rejected":
            return .red
        default:
            return .gray
        }
    }

    var body: some View {
        HStack {
            Text(email.company)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(email.role)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(email.status.capitalized)
                .foregroundColor(statusColor)
                .frame(maxWidth: .infinity, alignment: .center)
            Text(email.date)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.vertical, 5)
    }
}

struct EmailRowView_Previews: PreviewProvider {
    static var previews: some View {
        EmailRowView(email: Email(company: "Test Co", status: "Pending", date: "2025-02-24", role: "Software Engineer"))
            .previewLayout(.sizeThatFits)
    }
}

