//
//  Test.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/15.
//

import SwiftUI

struct Test : View {

    @State var showingPopup = false // 1
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.2)
            Button("Push me") {
                showingPopup = true // 2
            }
        }
        .overlay(alignment: .bottom){
            if(showingPopup){
                Room_Enter_Popup()
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
