//
//  SideMenuView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI
import SwiftyJSON

struct temp2 : Codable{
    var userToken : String
}
struct SideMenuView: View {
    @Binding var userToken : String
    @Binding var showMenu : Bool
    @Binding var groupname : [String]
    @Binding var userName : String
    @Binding var userNick :String
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){ // side menu container
            
            VStack(alignment: .leading, spacing: 10){
                Image("appleLogo") // profile Image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                Text(userName)
                    .font(.title2.bold())
                Text(userNick)
                    .font(.title2.bold())
                
            }
            .padding(.horizontal)
            .padding(.leading) // top profile view
            
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 45){
                    
                    //Tab Buttons
                    TabButton(title: "Profile", image: "person.circle")
                    
                    TabButton(title: "LogOut", image: "arrow.left.square")
                    
                    TabButton(title: "Developers", image: "wrench.and.screwdriver")
                    
                    
                }
                .padding()
                .padding(.leading)
                .padding(.top, 35) // vstack of each option
            }
            
            
        }
        .frame(width : getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
//        VStack(alignment:.leading, spacing: 30){
//            //Profile Img
//            VStack(alignment:.leading) {
//                Circle()
//                    .frame(width: 60, height: 60)
//
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("김예은")
//                        .font(.system(size: 25, weight: .semibold))
//                }
//            }
//            .padding(.leading)
//
//
//            ForEach(SideMenuViewModel.allCases, id: \.rawValue){
//                option in
//
//                HStack{
//                    Image(systemName: option.imageName)
//                        .font(.headline)
//                        .foregroundColor(.gray)
//
//                    Text(option.description)
//                        .font(.subheadline)
//
//                    Spacer()
//                }
//                .frame(height: 60)
//                .padding(.horizontal)
//            }
//
//            Spacer()
//        }
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View{
        NavigationLink{
            switch title{
            case "Profile":
                ProfileView(nickname: $userNick, name: $userName,groupname: $groupname)
                    .navigationTitle(title)
                
            case "LogOut":
//                Text("LOGOUT")
                LoginView()
                    .navigationTitle(title)
                
            case "Developers":
                DevelopersView()
                    .navigationTitle(title)
                
            default:
                Text("Nowhere")
            }
        
        }label: {
            HStack(spacing: 14){
                Image(systemName : image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }
        
    } // viewBuillder
}

//struct SideMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        BaseView()
//    }
//}

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
