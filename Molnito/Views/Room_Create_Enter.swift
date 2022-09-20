//
//  Room_Create_Enter.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/15.
//

import SwiftUI

struct Room_Create_Enter: View {
    @Binding var is_popup : Bool // 버튼 클릭시 true로
    @Binding var userToken : String
    @State var isactive = false;
    var body: some View {
        HStack(alignment: .center, spacing: 30)
        {
            NavigationLink(destination: startmakeGroup(masterToken: $userToken),isActive: $isactive, label:{
            Button(action:{
                print("CREATE ROOM")
                isactive = true
            }){
                VStack(spacing:-13){
                    Image("Lion")
                        .resizable()
                        .frame(width: 150, height: 150)
                    VStack(
                        alignment: .center,
                        spacing: 50
                    ){
                        
                        Text("방 만들기")
                            .font(.headline)
                        
                        Text("마니또 시작하기")
                            .font(.system(size:10))
                            .lineLimit(1)
                        
                        
                    }   .padding(.all)
                        .frame(width: 150, height: 150)
                        .overlay(RoundedRectangle(cornerRadius:5)
                        .stroke(Color.black, lineWidth: 2))
                }
            }})
            Button(action:{
                is_popup = true
                print("ENTER ROOM")
            }){
                VStack(spacing:-18){
                    Image("Tiger")
                        .resizable()
                        .frame(width: 150, height: 150)
                    VStack(
                        alignment: .center,
                        spacing: 50
                    ){
                        Text("방 입장하기")
                            .font(.headline)
                            
                        Text("입장 코드 입력하기")
                            .font(.system(size:10))
                            .lineLimit(1)
                    }   .padding(.all)
                        .frame(width: 150, height: 150)
                        .overlay(RoundedRectangle(cornerRadius:5)
                        .stroke(Color.black, lineWidth: 2))
                }
            }
            }
            
                
        }
}



struct Room_Create_Enter_Previews: PreviewProvider {
    @State private var a : Bool = false
    static var previews: some View {
        Room_Create_Enter(is_popup: .constant(true), userToken: .constant("123"))
    }
}
 
