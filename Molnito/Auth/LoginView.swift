//
//  LoginView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI
import SwiftyJSON


struct LoginView: View {
    //@ObservedObject var userViewModel = UserViewModel()
//    @State var userToken = "2"
    //ggggggggggggggggggggggg
    @ObservedObject var userViewModel = UserViewModel()
    @State private var id = ""
    @State private var password = ""
    @State var isactive = false
    var jsons : JSON = JSON()
    @State var glist : [String] = []
    var body: some View {
        // top container
        NavigationView {
            VStack{
               //header
                VStack(alignment: .leading){
                
                    HStack{ Spacer()} // fetch to full width
                    
                    Text("Welcome,")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Molnitto")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .frame(height: 260)
                .padding()
                .foregroundColor(.white)
                .background(Color("hanyangBlue"))
                .clipShape(RoundShape(corners: [.bottomRight]))
                
                // text field
                VStack(spacing: 40){
                    //TextField("ID", text: $id)
                    CustomInptField(imageName: "person.circle", placeHolderText: "Enter your id", text: $id)
                    //TextField("Password", text: $password)
                    CustomInptField(imageName: "lock", placeHolderText: "Enter your password", text: $password)
//                    userViewModel.setUserPwd(password)
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                // forgot Password?
//                HStack{
//                    Spacer()
//
//                    NavigationLink{
//                        //Main_Page(userToken:$usertoken)
//                        Text("Reset Password view")
//                    } label: {
//                        Text("Forgot Password?")
//                            .font(.caption)
//                            .fontWeight(.bold)
//                            .padding()
//                            .foregroundColor(Color("hanyangBlue"))
//                    }
//                }
                
                NavigationLink(destination: Main_Page(groupjson: $glist, userToken: $userViewModel.user.token),isActive: $isactive, label: {
                Button{
                    //////////////////////////////////////////////////////////////
                    userViewModel.setUserID(id)
                    userViewModel.setUserPwd(password)
                    print("log in")
                    let encoder = JSONEncoder()
                    encoder.outputFormatting = .prettyPrinted
                    let da = try! encoder.encode(userViewModel.user)
                    let JSON = requestPOST(urls: "/login", body: da)
                    if(JSON["isValid"].boolValue){
                        userViewModel.setName(JSON["user_name"].stringValue)
                        userViewModel.setToken(JSON["token"].stringValue)
                        userViewModel.setNickName(JSON["nickname"].stringValue)
                        let encode = JSONEncoder()
                        encode.outputFormatting = .prettyPrinted
                        let dat = try! encode.encode(userViewModel.user)
                        let jsons = requestPOST(urls: "/listOfGroup", body: dat)
//                        insertlist(json: jsons)
                        glist = jsons["list"].arrayValue.map{$0.stringValue}
//                        groups.setName(JSONs["groupName"].stringValue)
//                        groups.putinToken(JSONs["groupToken"].intValue)
//                        groups.setStartDate(JSONs["startDate"].stringValue)
//                        groups.setEndDate(JSONs["endDate"].stringValue)
                        
                        isactive = true;
                        print("???")
                        print(userViewModel.user.token)
                    }
                } label:{
                    Text("로그인하기")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color("hanyangBlue"))
                        .clipShape(Capsule())
                        .padding()
                }
                    .shadow(color: .gray.opacity(0.7), radius: 7, x: 0, y: 0)})
                
                VStack{
                    LottiView(filename:"login")
                        //.frame(width:200, height:200)
                }
                .frame(width:200, height:200)
                .overlay(Circle().strokeBorder(Color.white,lineWidth: 3).foregroundColor(Color.white))
                  
                
                Spacer()
                
                NavigationLink{
                    RegisterView(userViewModel : userViewModel)
                        .navigationBarHidden(true)
                } label :{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color("hanyangBlue"))
                }
                .padding(.bottom , 25)
            }
            .ignoresSafeArea() // screen의 safe area까지 꽉 채움
        .navigationBarHidden(true)
        }
        
        
    }
   
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

