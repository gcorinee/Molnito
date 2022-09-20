//
//  tokens.swift
//  makeGroup
//
//  Created by 박강우 on 2022/07/18.
//

import SwiftUI

struct tokens: View {
    @ObservedObject var tgroupVM : GroupViewModel
    var body: some View {
        VStack{
            Spacer()
            Text("입장 토큰")
            Spacer()
            Text(String(tgroupVM.group.Token))
            Spacer()
            Image("korea")
                .resizable()
                .frame(width: 350, height: 400)
        }
    }
}

//struct tokens_Previews: PreviewProvider {
//    static var previews: some View {
//        tokens()
//    }
//}
