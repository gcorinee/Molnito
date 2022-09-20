//
//  ManiteeCardView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/18.
//

import SwiftUI

// --------
// card modifier


struct ManiteeCardView: View {
    @Binding var manito : String
    var body: some View {
         /////////
        
        HStack(alignment: .center) {
            HStack{
                Text("나는")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                GroupBox{
                    Text("\(manito)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
                .padding(.top, -5)
                .padding(.bottom, -5)
                
                Text("의 마니또입니다")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
            }
            .padding()
            .padding(.top, 10)
            .padding(.bottom, 10)

        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("hanyangOrange"))
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

//struct ManiteeCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ManiteeCardView()
//    }
//}
