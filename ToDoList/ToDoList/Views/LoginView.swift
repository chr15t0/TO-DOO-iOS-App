//
//  LoginView.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //head
                HeaderView(title: "TO DOOO",
                           subtitle: "Get Your Life Organized",
                           angle1: 15, background1: .black,
                           angle2: -15, background2: .blue)
                //login
               
                Form{
                    //make sure it's not empty
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text : $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text : $viewModel.password)
                         .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(
                        title: "Log In",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                    .padding()
                }
                
                .offset(y:-50 )
                //register
                VStack{
                    Text("New here ?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                    //creates a button and goes to the register view
                }
                .padding(.bottom,50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
