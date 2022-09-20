//
//  InnerInfoView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/18.
//

import SwiftUI



struct InnerInfoView: View {
    //@Binding var dDayleft : Int
    @Binding var userToken : String
    @Binding var namelist : [String]
    @Binding var maniteename : String
    @Binding var groupToken : Int
    @Binding var popup_enter : Bool
    
    var body: some View {
        VStack{
            //dDayCardView(leftDay: <#T##Int#>)
            
            //dDayCardView()
            Spacer()
                .frame(height: 10)
            StartEnd(groupToken : $groupToken, userToken: $userToken,is_popup: $popup_enter)
            
            ManiteeCardView(manito: $maniteename)
            
            GroupMemberList(namelist : $namelist)
        }
            }
}

//struct InnerInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InnerInfoView()
//    }
//}
