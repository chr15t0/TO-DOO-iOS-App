//
//  RegisterView.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            //head
            HeaderView(title: "TO DOOO",
                       subtitle: "Get Your Life Organized",
                       angle1: -15, background1: .black,
                       angle2: 15, background2: .pink)
            Form{
                TextField("Full Name",text:$viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled() 
                TextField("Email",text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password",text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(
                    title: "Create Account",
                    background: .green
                ) {
                    viewModel.register()
                    //register account
                }
                .padding()
            }
            .offset(y:-50)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
