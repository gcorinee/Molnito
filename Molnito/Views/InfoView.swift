//
//  RoomTapFirstView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI

struct InfoView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack{
            VStack(spacing : 0){
                
                HStack{
                    Button{
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image("dodam")
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
            
            InnerInfoView()
            
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
