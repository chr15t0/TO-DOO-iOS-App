//
//  Extensions.swift
//  ToDoList
//
//  Created by Christo on 05/12/23.
//

import Foundation

extension Encodable {
    func asDictionary()->[String : Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:] //if it fails, it is going to return an empty dictionary
        }
        //if we got gata
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        }catch{
            return [:] //if we catch an error,  we get an empty dictionary
        }
    }
}
