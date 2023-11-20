//
//  SignInWithEmailView.swift
//  learn-firebase
//
//  Created by magistra aptam on 20/11/23.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("Email and password not found!")
            return
        }
        let returnedUserdata = try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
}

struct SignInWithEmailView: View {
    
    @StateObject private var signInEmailVM = SignInEmailViewModel()
    @Binding var showSignview: Bool
    var body: some View {
        VStack{
            TextField("Email", text: $signInEmailVM.email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("Password...", text: $signInEmailVM.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            
            Button {
                Task{
                    do{
                        try await signInEmailVM.signIn()
                        showSignview = false
                    }catch{
                        
                    }
                }
            } label: {
                Text("Sign in")
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .navigationTitle("Sign in with Email")
        .padding()
    }
}

struct SignInWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInWithEmailView(showSignview: .constant(false))
        }
    }
}
