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
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
}
