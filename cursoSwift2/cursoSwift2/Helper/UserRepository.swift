//
//  UserRepository.swift
//  cursoSwift2
//
//  Created by Rey Messon on 9/13/24.
//
//

import Foundation
import SQLite

class UserRepository {
    
    private let db = DatabaseManager.shared.db
    private let usersTable = Table("users")

    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    
    init() {    
        createTable()
    }
    
    private func createTable() {
        do {
            try db?.run(usersTable.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                
            })
        } catch {
            print("Unable to creata table: \(error)")
        }
    }
    
    func insertUser(user: User) {
        do {
            let insert = usersTable.insert(name <- user.name)
            try db?.run(insert)
        }catch {
            print("Insert failed: \(error)")
        }
    }
    func fetchUser() -> [User]{
        var users: [User] = []
        do {
            for user in try db!.prepare(usersTable) {
                users.append(User(id: user[id], name: user[name]))
            }
        }catch {
            print("Insert failed: \(error)")
        }
        return users
    }
    func deleteUser(user: User) {
        let userToDelete = usersTable.filter(id == user.id)
        do {
            try db?.run(userToDelete.delete())
        }catch {
            print("Insert failed: \(error)")
        }
    }
}

