//
//  cursoSwift2App.swift
//  cursoSwift2
//
//  Created by user250318 on 9/13/24.
//

import SwiftUI

@main
struct cursoSwift2App: App {
    
    
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userViewModel)
        }
    }
}
