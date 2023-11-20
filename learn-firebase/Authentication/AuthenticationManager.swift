//
//  AuthenticationManager.swift
//  learn-firebase
//
//  Created by magistra aptam on 20/11/23.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    var uid: String
    var email: String?
    var photoUrl: String?
    
    init(user:User){
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}
final class AuthenticationManager{
    
    static let shared = AuthenticationManager()
    private init(){}
    
    func userSignOut()throws{
        try Auth.auth().signOut()
    }
    
    func getAuthUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    @discardableResult
    func userLogIn(email: String, password: String) async throws -> AuthDataResultModel {
        let userLogin = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: userLogin.user)
    }
    
}
