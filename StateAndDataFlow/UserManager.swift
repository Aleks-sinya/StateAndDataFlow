//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Алексей Синяговский on 20.05.2022.
//

import Foundation

final class UserManager: ObservableObject {
   
    @Published var isRegistered = false
    @Published var correctName = false
    @Published var name = "" {
        didSet {
            if name.count >= 3 {
                correctName = true
            }
        }
    }
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}
