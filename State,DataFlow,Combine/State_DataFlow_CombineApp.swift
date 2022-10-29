//
//  State_DataFlow_CombineApp.swift
//  State,DataFlow,Combine
//
//  Created by Александр on 29.10.2022.
//

import SwiftUI

@main
struct State_DataFlow_CombineApp: App {
    private let user = DataManager.shared.fetch()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserManager(user: user))
        }
    }
}
