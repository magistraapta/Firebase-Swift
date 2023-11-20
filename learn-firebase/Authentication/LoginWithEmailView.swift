//
//  LoginWithEmailView.swift
//  learn-firebase
//
//  Created by magistra aptam on 20/11/23.
//

import SwiftUI

final class loginEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func logIn(){
        guard !email.isEmpty, !password.isEmpty else {
            print("You should fill the email and password")
            return
        }
        
        Task{
            do{
                let user = try await AuthenticationManager.shared.userLogIn(email: email, password: password)
                print("success")
                print(user)
            }catch{
                print("error: \(error)")
            }
        }
    }
}

struct LoginWithEmailView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoginWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithEmailView()
    }
}
