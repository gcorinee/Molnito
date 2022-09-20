//
//  GroupRowView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI

struct GroupRowView: View {
    @State var GN : String
    var body: some View {
        VStack(alignment: .leading){
            Text(GN)
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
                    .frame(height: 20)

            
            HStack{
                Text("Start:")
                    .fontWeight(.bold)
                Text("2022.07.16")
                Spacer()
                        .frame(width:20)

                Text("End:")
                    .fontWeight(.bold)
                Text("2022.07.20")
    
            }
            Divider()
                .overlay(.gray)
                //.frame(height: 2)
                .shadow(color: .gray, radius: 5, x: 0, y: 3)
        }
        //.padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        
    }
}

//struct GroupRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupRowView()
//    }
//}
