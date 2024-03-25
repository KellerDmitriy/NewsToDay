//
//  UserModel.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import Foundation

struct UserModel: Identifiable, Codable {
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

extension UserModel {
    static var MOCK_USER = UserModel(
        id: NSUUID().uuidString,
        userName: "Paul Hudson",
        email: "ph@gmail.com"
    )
}


