//
//  RoomTapFirstView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI
import ExytePopupView

struct InfoView: View {
    @Binding var userToken : String
    @Binding var namelist : [String]
    @Binding var maniteename : String
    @Binding var groupToken : Int
    @Binding var showMenu: Bool
    @State var is_popup : Bool = false
    
    var body: some View {
        VStack{
            VStack(spacing : 0){
                
                HStack{
                    Button{
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image("appleLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    } // for side menu calling
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image("madcamp_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.primary)
                        
                    }
//                    // Navaigation Link
//                    NavigationLink{
//                        Text("navigate here")
//                    }//nav link , refered by BaseView
//                    label : {
//                        Image(systemName:)
//                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                Divider()
            } // vstack for top action bar
            .overlay(
                Image("molnitto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
            ) // 전체 action bar에 overlay 할 logo image
            
            Spacer()
            
            InnerInfoView(userToken: $userToken, namelist: $namelist, maniteename: $maniteename, groupToken: $groupToken, popup_enter:$is_popup)
            
        }
        .popup(isPresented: $is_popup, type:.floater(verticalPadding: 290), autohideIn:3.5,closeOnTap: false
        ){
            VStack(spacing:-10){
                LottiView(filename:"roulette")
                    .frame(width: 200, height: 200)
                VStack(
                    alignment: .center
                ){
                    
                    Text("마니또 매칭 중..")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.black)
                    
                }   .padding(.all)
                    .frame(width: 300, height: 50)
                    .background(Color.mint)
                    .cornerRadius(30)
                    .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 0)
        }
        }

    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
