//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Алексей Синяговский on 20.05.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
