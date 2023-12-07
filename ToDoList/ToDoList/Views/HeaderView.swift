//
//  HeaderView.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import SwiftUI

 struct HeaderView: View {
    let title : String
    let subtitle : String
    let angle1 : Double
    let background1 : Color
    let angle2 : Double
    let background2 : Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background1)
                .rotationEffect(Angle(degrees: angle1))
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background2)
                .rotationEffect(Angle(degrees: angle2))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width : UIScreen.main.bounds.width*3, //to take the width of the phone screen
               height :350)
        .offset(y:-150)
    }
}

#Preview {
    HeaderView(title: "Title",
               subtitle: "Subtitle",
               angle1: 15, background1: .black,
               angle2:  -15, background2: .green
    )
}
