//
//  ContentView.swift
//  JobView
//
//  Created by Luka Brnetic on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = EmailViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.emails) { email in
                EmailRowView(email: email)
            }
            .navigationTitle("Job Applications")
            .onAppear {
                viewModel.fetchEmails()
            }
        }
    }
}




#Preview {
    ContentView()
}
