//
//  showToken.swift
//  makeGroup
//
//  Created by 박강우 on 2022/07/18.
//

import SwiftUI
struct temp :Codable{
    var token : String
}
struct showToken: View {
    @ObservedObject var sgroupVM : GroupViewModel
    @State var isactive = false;
    @State var groupname : [String] = []
    var body: some View {
        
                VStack{
                    Spacer()
                    tokens(tgroupVM : sgroupVM)
                        .frame(width: 400, height: 500)
                        .cornerRadius(25)
                        .background()
                        .hoverEffect(.highlight)

                    NavigationLink(destination: Main_Page(groupjson: $groupname, userToken: $sgroupVM.group.MasterToken)
                                   ,isActive: $isactive, label:{
                        Button(action: {
                            sgroupVM.setEndDate(getDateWithCal(plus: sgroupVM.group.HowLong))
                            sgroupVM.setStartDate(getDate())
                            let encoder = JSONEncoder()
                            encoder.outputFormatting = .prettyPrinted
                            let da = try! encoder.encode(sgroupVM.group)
                            _ = requestPOST(urls: "/makeGroup",body: da)
                            let encoded = temp(token: sgroupVM.group.MasterToken)
                            let encoder1 = JSONEncoder()
                            encoder1.outputFormatting = .prettyPrinted
                            let dat = try! encoder1.encode(encoded)
                            let jsons = requestPOST(urls: "/listOfGroup", body: dat)
                            groupname = jsons["list"].arrayValue.map{$0.stringValue}
                            print(groupname)
                            isactive = true
                        }, label: {
                        Text("방 생성완료")
                            .frame(width: 400,height: 40)
                            .foregroundColor(.white)
                        })
                    })
                    .background(Color("hanyangOrange"))
                    .cornerRadius(8)
                    
                }.background(
                    Image("madcamp_pattern"))
        }
    
    func getDate() -> String{
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name : "ko_KR") as TimeZone?
        return dateFormatter.string(from: now)
    }
    func getDateWithCal(plus : Int) -> String{
        let today = Date()
        let plusDate = Calendar.current.date(byAdding: Calendar.Component.day,value: plus, to: today as Date)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name : "ko_KR") as TimeZone?
        return dateFormatter.string(from: plusDate)
    }
}

//struct showToken_Previews: PreviewProvider {
//    static var previews: some View {
//        showToken()
//    }
//}

