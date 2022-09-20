//
//  startmakeGroup.swift
//  makeGroup
//
//  Created by 박강우 on 2022/07/18.
//

import SwiftUI

struct startmakeGroup: View {
    @ObservedObject var groupVM = GroupViewModel()
    @Binding var masterToken : String
    var body: some View {
                VStack{
                    Spacer()
                    makeGroup(mgroupVM : groupVM,masterToken: $masterToken)
                        .frame(width: 400, height: 600)
                        .cornerRadius(25)
                        .background()
                        .hoverEffect(.highlight)

                    NavigationLink(destination: showToken(sgroupVM:groupVM), label:{
                        
                        Text("방생성하기")
                            .frame(width: 400,height: 40)
                            .foregroundColor(.white)
                    })
                    .background(Color("hanyangOrange"))
                    .cornerRadius(8)
                    
                }.background(
                    Image("madcamp_pattern"))
        
    }
}

//struct startmakeGroup_Previews: PreviewProvider {
//    static var previews: some View {
//        startmakeGroup()
//    }
//}
