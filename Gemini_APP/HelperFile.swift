//
//  HelperFile.swift
//  Gemini_APP
//
//  Created by R93 on 07/06/24.
//

import Foundation
import UIKit
import SQLite3

struct UserData {
    var email: String
    var password: String
}

class SqliteHelper{
    public static var userArray = [UserData]()
    static var file : OpaquePointer?
    
    static func CreateFile(){
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathComponent("My login.db")
        sqlite3_open(a.path, &file)
        print("Create A File")
        print(a.path)
        CreateTable()
    }
    
    static func CreateTable(){
        let q = "Create Table if not exists Login (email text, password text)"
        var table: OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        sqlite3_step(table)
        print("Create Table")
    }
    
    static func addData(email: String , password: String){
        let q = "insert into login values ('\(email)','\(password)')"
        var add: OpaquePointer?
        sqlite3_prepare(file, q, -1, &add, nil)
        sqlite3_step(add)
        print("SuccessFully addData")
    }
    static func getData() {
        var emailUser = ""
        var passwordUser = ""
        let q = "SELECT * FROM login"
        var read: OpaquePointer?
        sqlite3_prepare(file, q, -1, &read, nil)
        while sqlite3_step(read) == SQLITE_ROW {
            if let email = sqlite3_column_text(read, 0),
               let password = sqlite3_column_text(read, 1){
                let userEmail = String(cString: email)
                let userPassword = String(cString: password)
                let userData = UserData(email: userEmail, password: userPassword)
                userArray.append(userData)
                print("Email: \(userEmail), Password: \(userPassword)")
                print("YAsh")
            }
        }
    }
}

