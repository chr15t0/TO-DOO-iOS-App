//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate =  Date()
    @Published var showAlert = false
    init(){}
    
    func  save(){
        guard canSave else{
            return
        }
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        //create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false )
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
            // convert created model to a dictionary that can be inserted into the database
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            //-86400 is previous 24h in seconds, to make sure the due date is >= yesterday
            return false
        }
        return true
    }
}
