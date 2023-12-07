//
//  TLButton.swift
//  ToDoList
//
//  Created by Christo on 05/12/23.
//

import SwiftUI

struct TLButton: View {
    let title : String
    let background : Color
    let action: () -> Void
    var body: some View {
        Button{
            //action
            action()
        } label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()

            }
        }
        
    }
}

#Preview {
    TLButton(title: "String", background: .pink) {
        //action
    }
}
