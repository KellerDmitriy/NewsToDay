//
//  AuthViewModel.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 25.03.2024.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let authManager = AuthManagerWithFirebase.shared
    
    init() {
        self.userSession = authManager.userSession
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let user = try await authManager.signIn(withEmail: email, password: password)
            self.userSession = user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUsers(email: String, userName: String, password: String) async throws {
        do {
            let user = try await authManager.createUser(
                email: email,
                password: password,
                userName: userName
            )
            self.userSession = user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() async {
        do {
            try await authManager.signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        do {
            self.currentUser = try await authManager.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to fetch current user with error \(error.localizedDescription)")
        }
    }
}

