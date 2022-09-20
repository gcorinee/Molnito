//
//  CustomInptField.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI

struct CustomInptField: View {
    let imageName: String
    let placeHolderText: String
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                TextField(placeHolderText, text: $text)
            }
            //.padding()
            
            Divider()
                .background(.gray)
        }
    }
}

struct CustomInptField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInptField(imageName: "person.circle.fill",
                        placeHolderText: "Enter Your ID",
                        text: .constant(""))
    }
}
