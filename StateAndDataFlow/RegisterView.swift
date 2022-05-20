//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Алексей Синяговский on 20.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userManager.name)
                    .multilineTextAlignment(.center)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                    .frame(width: 300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("\(userManager.name.count)")
                    .foregroundColor(userManager.correctName ? .green : .red)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled(!userManager.correctName)
            }
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

extension RegisterView {
    private func registerUser() {
        if !userManager.name.isEmpty {
            userManager.isRegistered = true
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil
        )
    }
}

