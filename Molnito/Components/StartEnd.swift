//
//  Room_Create_Enter.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/15.
//

import SwiftUI
import SwiftyJSON

struct startends : Codable{
    var groupToken: Int
    var userToken : String
    
}

struct StartEnd: View {
    @Binding var groupToken : Int
    @Binding var userToken : String
    @State var isactive = false
    @State var isactives = false
    @Binding var is_popup : Bool
    @State var ret : JSON = JSON()
    @State var resultlist : [Result] = []
    @State var _id : Int = 1
    var body: some View {
        HStack(alignment: .center, spacing: 30)
        {
           // NavigationLink(destination: StartEnd(),isActive: $isactive, label:{
            Button(action:{
                is_popup = true
                print("Start")
                let tems = startends(groupToken : groupToken, userToken : userToken)
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let da = try! encoder.encode(tems)
                let data = requestPOST(urls: "/startMatch",body: da)
                if(data["success"] == "success"){
                    //애니메이션 띄우기
                    print(data["maniteeName"].stringValue)
                    print("##########        ###################")
                }
                isactive = true
            }){
                VStack(spacing:-13){
                   
                    VStack(
                        alignment: .center
                    ){
                        
                        Text("시작하기")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                       
                        
                        
                    }   .padding(.all)
                        .frame(width: 150, height: 150)
                        .background(Color("hanyangBlue"))
                        .cornerRadius(30)
                        .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 0)
                        
                }
            }//})
            NavigationLink(destination: ResultList(results: resultlist),isActive: $isactives, label:{
            Button(action:{
                let tems = startends(groupToken : groupToken, userToken : userToken)
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let da = try! encoder.encode(tems)
                ret = requestPOSTwithList(urls: "/showEnd",body: da)
                if(ret["success"] == "fail"){
                    
                }
                else{
                    for (index,subJson) : (String,JSON) in ret{
                        resultlist.append(Result(name: subJson["name"].stringValue, manitee: subJson["manitee"].stringValue, id: _id))
                        _id = _id + 1
                    }
                    requestPOST(urls: "/deleteGroup", body: da)
                    
                    isactives = true
                }
                print("aaaaaa")
            }){
                VStack(spacing:-13){
                   
                    VStack(
                        alignment: .center
                    ){
                        
                        Text("끝내기")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                       
                        
                        
                    }   .padding(.all)
                        .frame(width: 150, height: 150)
                        .background(Color("hanyangBlue"))
                        .cornerRadius(30)
                        .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 0)
                        
                }
            }})
        }
            
                
        }
}



struct StartEnd_Previews: PreviewProvider {
    @State private var a : Bool = false
    static var previews: some View {
        StartEnd(groupToken : .constant(1), userToken: .constant("2"), is_popup: .constant(false))
    }
}

