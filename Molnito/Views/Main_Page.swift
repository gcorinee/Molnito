//
//  Main_Page.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/15.
//

import SwiftUI
import ExytePopupView
import SwiftyJSON
import Lottie
import UIKit

struct LottiView: UIViewRepresentable{
    typealias UIViewType = UIView
    var filename: String
    
    func makeUIView(context:UIViewRepresentableContext<LottiView>)-> UIView{
        let view = UIView(frame:.zero)
        let animationView = AnimationView()
        animationView.animation = Animation.named(filename)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo:view.heightAnchor)])
        
        return view
    }
    
    func updateUIView(_ uiView:UIView, context: UIViewRepresentableContext<LottiView>) {
        
    }
   
}

struct Main_Page: View {
    ///////////////////////////////
//    @ObservedObject var userInfo : UserViewModel
    @State private var popup_enter : Bool = false
    @State private var code_enter : Bool = false
//    @ObservedObject var groupVM : GroupViewModel
    @Binding var groupjson : [String]
    @Binding var userToken : String
    
    @State var isActive : Bool = false
    
    var body: some View {
      
        ZStack{
            VStack{
                Image_Main()
                    .position(x: 200, y: 160)
                Spacer()
            }
            
            VStack{
                VStack{
                    LottiView(filename:"santa")
                        .frame(width:300, height:200)
                        .position(x: 108, y: 692)
                }
                .frame(width: 200, height: 200)  // for 배경 이미지
                VStack(alignment: .center,spacing: 30){
                    
                    Room_Create_Enter(is_popup: $popup_enter, userToken: $userToken)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    //Room_Create_Enter()
                    Group_List(userToken: $userToken, groupname: $groupjson)
                    
                }
            }
        }
        .popup(isPresented: $popup_enter, type:.floater(verticalPadding: 290), closeOnTap: false
        ){
            Room_Enter_Popup(is_popup: $popup_enter,userToken: $userToken)
        }
    
    
    
}
}



struct Main_Page_Previews: PreviewProvider {
    static var previews: some View {
        Main_Page(groupjson: .constant(["그룹1","그룹2","그룹3"]), userToken: .constant("2"))
    }
}



