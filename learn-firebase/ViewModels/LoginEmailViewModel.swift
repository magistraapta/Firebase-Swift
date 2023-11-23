//
//  LoginEmailViewModel.swift
//  learn-firebase
//
//  Created by magistra aptam on 23/11/23.
//

import Foundation

final class loginEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func logIn()async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("You should fill the email and password")
            return
        }
        
        try await AuthenticationManager.shared.userLogIn(email: email, password: password)
    }
}
