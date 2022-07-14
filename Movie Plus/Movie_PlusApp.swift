//
//  Movie_PlusApp.swift
//  Movie Plus
//
//  Created by mac on 2022-07-07.
//

import SwiftUI
import Firebase

@main
struct Movie_PlusApp: App {
    @StateObject var viewModel =  AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
            
         }

    }
}
