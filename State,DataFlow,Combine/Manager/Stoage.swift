//
//  Stoage.swift
//  State,DataFlow,Combine
//
//  Created by Александр on 29.10.2022.
//

import Foundation

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        let encoder = JSONEncoder()
        userData = try? encoder.encode(user)
    }
    
    func fetch() -> User {
        let decoder = JSONDecoder()
        guard let user = try? decoder.decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func delete(userManager: UserManager) {
        userManager.user.isRegister = false
        userManager.user.name = ""
        userData = nil

    }
}
