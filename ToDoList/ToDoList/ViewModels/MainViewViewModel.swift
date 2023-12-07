//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import Foundation
import FirebaseAuth
class MainViewViewModel: ObservableObject{
    @Published var currentUserId : String = ""
    // whenever the user is signed in / out this published will be triggered
    //it will update our view
    private var handler : AuthStateDidChangeListenerHandle? //by default it is nil, so make it optional
    init(){
        //observe from firebease when current user is changed
        self.handler = Auth.auth().addStateDidChangeListener { [weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        //return the current user not being nil
        return Auth.auth().currentUser != nil //or null
            //if there's a value or not nil, that means it will be signed in
            //if it's nil, then we are not signed in
    }
}
