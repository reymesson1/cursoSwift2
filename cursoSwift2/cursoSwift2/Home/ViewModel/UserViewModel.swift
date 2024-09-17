//
//  UserViewModel.swift
//  cursoSwift2
//
//  Created by Rey Messon on 9/13/24.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    
    @Published var users : [User] = []
    
    init() {
        loadUsers()
    }
    
    func addUser(name: String) {
        
        let newUser = User(id: Int64(users.count + 1),  name: name)
        
        let userRepository = UserRepository()
        userRepository.insertUser(user: newUser)
        
        loadUsers()
    }
    
    func loadUsers() {
        let userRepository = UserRepository()
        users = userRepository.fetchUser()
    }
    
    func deleteUser(user: User) {
        
        let userRepository = UserRepository()
        userRepository.deleteUser(user: user)
        
        loadUsers()
    }
    
}
