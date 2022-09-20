//
//  Group_List.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/14.
//

import SwiftUI
import SwiftyJSON
struct req : Codable{
    var groupName : String
    var userToken : String
}
struct Group_List: View {
    
    @Binding var userToken : String
    // [{groupName:"그룹 이름" groupToken : "그룹 토큰" startDate:"시작 날짜EndDate:"끝나는 날짜}~~~~~~~]
//    @ObservedObject var groupVM : GroupViewModel
    @Binding var groupname : [String]
    @State var isactive : Bool = false //[Bool] = [Bool](repeating : false, count: groupname.count)
    @State var namelist : [String] = []
    @State var maniteename : String = ""
    @State var groupToken : Int = 0
    @State var falses  = false
    @State var name : String = ""
    @State var nick = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("가입한 그룹")
                .fontWeight(.bold)
                .padding([.top, .leading], 15)
            List {
                ForEach(groupname, id: \.self){ temp in
                    Button(action: {
                        print("1111111")
                        let reques = req(groupName: temp, userToken: userToken)
                        let encoder = JSONEncoder()
                        encoder.outputFormatting = .prettyPrinted
                        let da = try! encoder.encode(reques)
                        let data = requestPOST(urls: "/inGroup",body: da)
                        namelist = data["namelist"].arrayValue.map{$0.stringValue}
                        maniteename = data["maniteeName"].stringValue
                        groupToken = data["groupToken"].intValue
                        name = data["userName"].stringValue
                        nick = data["userNick"].stringValue
                        print(maniteename)
//                            isactive = true
                    }, label: {
                        Text(temp)
                    })
                    NavigationLink(destination: BaseView(userToken : $userToken, namelist : $namelist, maniteename : $maniteename, groupToken : $groupToken, showMenu: $falses,groupname: $groupname,userName: $name,userNick: $nick),label:{
                        Text("상세 보기")
                    })
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                }
            }.listStyle(PlainListStyle())
        
        }
        
    }
}
        

/*
struct Group_List_Previews: PreviewProvider {
    static var previews: some View {
        Group_List(userToken: "")
    }
}

*/
