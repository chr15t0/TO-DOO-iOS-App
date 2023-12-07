//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
//View Model for single to do list item view
class ToDoListItemViewViewModel: ObservableObject{
    init(){}
    func toggleIsDone(item : ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        // if isDone is true -> false
        // if isDone is false -> true
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        // update data for existing item
    }
}
