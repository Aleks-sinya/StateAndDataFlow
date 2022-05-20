//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Алексей Синяговский on 20.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 200)
            Spacer()
            
            VStack {
                ButtonView(timer: timer)
            }
            Spacer()
            ButtonLogOut(user: _user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        VStack {
            Button(action: timer.startTimer) {
                Text(timer.buttonTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(.red)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
        }
    }
}

struct ButtonLogOut: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Button(action: { self.logOutUser() }) {
                Text("Log Out")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(.blue)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20,
                                      style: .continuous).stroke(.black,
                                                                 lineWidth: 4))
        }
    }
    
    private func logOutUser() {
        user.name = ""
        user.isRegistered = false
        user.correctName = false
    }
}
