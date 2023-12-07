//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import Foundation
import FirebaseFirestore
//View Model for list of items view
class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    /// delete to do list item
    /// - Parameter id: item id to delete
    func delete(id : String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
