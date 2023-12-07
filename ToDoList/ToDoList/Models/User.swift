//
//  User.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import Foundation

struct User: Codable{
    // to convert anything that is codable to a dictionary
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
