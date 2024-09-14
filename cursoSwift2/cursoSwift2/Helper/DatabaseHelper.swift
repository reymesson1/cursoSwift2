//
//  DatabaseHelper.swift
//  cursoSwift2
//
//  Created by Rey Messon on 9/13/24.
//

import Foundation
import SQLite

class DatabaseManager {
    
    static let shared = DatabaseManager()
    var db: Connection?
    private init() {
        connectToDatabase()
    }
    private func connectToDatabase() {
        do {
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("my_database3.sqlite3").path
            db = try Connection(path)
        } catch {
            print("Unable to connect to database: \(error)")
        }
    }
}
