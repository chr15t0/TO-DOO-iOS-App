//
//  NewItemView.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var NewItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form{
                // Title
                TextField("Title", text : $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle() )
                // Button
                TLButton(title: "Save",
                         background: .green) {
                            if viewModel.canSave{
                                //give alerts if the title is empty/ due date is wrong.
                                viewModel.save()
                                NewItemPresented = false
                                //trigger our view to go away when we press the save button
                            } else {
                                viewModel.showAlert = true
                            }
                        }
                         .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is today or newer!"))
            })
        }
    }
}

#Preview {
    NewItemView(NewItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
