//
//  RegisterView.swift
//  State,DataFlow,Combine
//
//  Created by Александр on 29.10.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .padding(.trailing)
                    .foregroundColor(
                        name.count < 3 ? Color.red : Color.green
                    )
                
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: name.count < 3
                          ? "checkmark.circle"
                          : "checkmark.circle.fill"
                    )
                    Text("Ok")
                }
            }
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if name.count > 2 {
            userManager.user.name = name
            userManager.user.isRegister.toggle()
            DataManager.shared.save(user: userManager.user)
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
