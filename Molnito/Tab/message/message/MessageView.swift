//
//  SecondRoomTapView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI

struct MessageView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
         //ResultList()
        ChatView()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
