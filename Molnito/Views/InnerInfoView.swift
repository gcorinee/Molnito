//
//  InnerInfoView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/18.
//

import SwiftUI



struct InnerInfoView: View {
    //@Binding var dDayleft : Int
    
    var body: some View {
        VStack{
            //dDayCardView(leftDay: <#T##Int#>)
            dDayCardView()
            
            ManiteeCardView()
            
            ScrollView{
                
            }
        }
    }
}

struct InnerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        InnerInfoView()
    }
}
