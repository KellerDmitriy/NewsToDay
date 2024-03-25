//
//  AuthManagerWithFirebase.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 25.03.2024.
//

import Foundation
import Firebase
import FirebaseFirestore

final class AuthManagerWithFirebase {
    public static let shared = AuthManagerWithFirebase()
    @Published var userSession: FirebaseAuth.User?
    
    private init() {}
    
    func signIn(withEmail email: String, password: String) async throws -> FirebaseAuth.User {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            return result.user
        } catch {
            throw error
        }
    }
    
    func createUser(email: String, password: String, userName: String) async throws -> FirebaseAuth.User {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, userName: userName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            return result.user
        } catch {
            throw error
        }
    }
    
    func signOut() async throws {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            throw error
        }
    }
    
    func fetchCurrentUser() async throws -> User? {
        guard let uid = self.userSession?.uid else { return nil }
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            let userData = try snapshot.data(as: User.self)
                return userData
        } catch {
            throw error
        }
    }
}

