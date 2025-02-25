//
//  EmailViewModel.swift
//  JobView
//
//  Created by Luka Brnetic on 2/24/25.
//

import Foundation
import FirebaseFirestore

class EmailViewModel: ObservableObject {
    @Published var emails: [Email] = []
    private var db = Firestore.firestore()
    
    func fetchEmails() {
        let db = Firestore.firestore()
        let userRef = db.collection("users").document("luka.brnetic@gmail.com")
        
        userRef.getDocument { [weak self] document, error in
            guard let self = self else { return } // Prevent memory leaks
            if let document = document, document.exists {
                if let emailRefs = document.get("jobsApplied") as? [DocumentReference] {
                    for ref in emailRefs {
                        ref.getDocument { emailDoc, error in
                            if let emailDoc = emailDoc, emailDoc.exists {
                                do {
                                    let temp = try emailDoc.data(as: Email.self) // Decode Firestore data into Email model
                                    DispatchQueue.main.async {
                                        self.emails.append(temp) // Ensure UI updates happen on the main thread
                                    }
                                } catch {
                                    print("Error decoding Email: \(error)")
                                }
                            } else {
                                print("Email document not found.")
                            }
                        }
                    }
                } else {
                    print("No email references found.")
                }
            } else {
                print("User document not found.")
            }
        }
    }
}
