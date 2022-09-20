//
//  Room_Enter_Popup.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/15.
//

import SwiftUI

struct HELLO : Codable{
    var groupToken : Int
    var userToken : String
}

struct Room_Enter_Popup: View {
    @Binding var is_popup : Bool
    @State var code : String = ""
    @State var alert : Bool = false
    @State var is_right : Bool = false // 입장 코드가 맞는지
    @Binding var userToken : String
    var body: some View {
            VStack(alignment:.center,spacing: 10){
                Text("입장코드를 입력하세요")
                    .frame(width: 300, height: 20)
                    .font(.system(size: 15))
                    .foregroundColor(.blue)
                TextField("Enter your code..",text: $code)
                    .padding()
                    .frame(width: 300, height: 30)
                    .background(Color(uiColor: .secondarySystemBackground))
                Button(action: {
                    /*
                    if(enterGroup(groupToken:code, usertoken:usertoken)==200){
                        is_right = true
                        hold = inGroup(groupToken:code, usertoken:usertoken)   // 어떤 정보가 오는지
                        Group_List(groupToken:code)
                        Group_detail()
                    
                    }
                    */
                    let test = HELLO(groupToken: Int(code) ?? 0, userToken: userToken)
                    let encoder = JSONEncoder()
                    encoder.outputFormatting = .prettyPrinted
                    let da = try! encoder.encode(test)
                    let JSON = requestPOST(urls: "/enterGroup", body: da)
                    if(JSON["success"]=="success"){
                        print("그룹 가입 성공")
                        is_right = true
                    }else{
                        print("Wrong Code")
                    }
                    alert = true
                }){
                    Text("확인")
                        .font(.system(size: 15))
                        .background((RoundedRectangle(cornerRadius: 10).padding(-3).foregroundColor(Color.blue)))
                        .foregroundColor(Color.white)
                }
                .alert(isPresented: $alert){
                    Alert(title: Text("Success"), message: Text("그룹 입장 성공!"),dismissButton: .default(Text("확인")))
                    /*
                    if(is_right){
                        Alert(title: Text("Success"), message: Text("Add Group"),dismissButton: .default(Text("확인")))
                    }else{
                        Alert(title: Text("Fail"), message: Text("Wrong Code"),dismissButton: .default(Text("확인")))
                    }*/
                }
            }
            .padding(.horizontal)
            .frame(width: 320, height: 100)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
            // 안에 frame 고정으로 안하고 밖 stack 크기로 캡쳐!
    }
}


//struct Room_Enter_Popup_Previews: PreviewProvider {
//    static var previews: some View {
//        Room_Enter_Popup(is_popup: .constant(true),userToken: "123")
//    }
//}




