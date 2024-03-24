//
//  UserVM.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import Foundation

struct UserVM: Identifiable, Codable {
    let id: String
    let userName: String
    let email: String
    
    var initials: String {
        let formater = PersonNameComponentsFormatter()
        if let components = formater.personNameComponents(from: userName) {
            formater.style = .abbreviated
            return formater.string(from: components)
        }
        return ""
    }
}

extension UserVM {
    static var MOCK_USER = UserVM(id: NSUUID().uuidString, userName: "Dev P", email: "dev@gmail.com")
}


