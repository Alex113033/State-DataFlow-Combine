//
//  UserManager.swift
//  State,DataFlow,Combine
//
//  Created by Александр on 29.10.2022.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var user = User()
    
    init(user: User) {
        self.user = user
    }
    
    init() {}
}
