//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import Foundation
import FirebaseAuth //->try to log user in with provided email address and password

class LoginViewViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    // when it changes, a view will recompute and render any changes as a result of state changes, and the published property wrapper is no exception
    init(){}
    func login(){
        guard validate() else{
            return //stop
        }
        
        //try to log in user
        Auth.auth().signIn(withEmail: email, password: password)
        //reference to firebase authentication for email and password
    }
    private  func validate() -> Bool{
        //make this function return either True or False if we are able to validate all of the users input
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
               !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields!"
            return false//stop if email & password is empty
        }
        //check if email contains @ and .
        guard email.contains("@")&&email.contains(".") else{
            errorMessage = "Enter a valid email address!"
            return false
        }
        print("Filled")
        return true
    }
}
