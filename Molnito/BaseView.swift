//
//  BaseView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/18.
//

import SwiftUI

struct BaseView: View {
    @Binding var userToken : String
    @Binding var namelist : [String]
    @Binding var maniteename : String
    @Binding var groupToken : Int
    @Binding var showMenu : Bool
    @Binding var groupname : [String]
    @Binding var userName : String
    @Binding var userNick : String
    // Hiding Native One
//    init(){
//        UITabBar.appearance().isHidden = true
//    }
    
    // Offset for Both Drag Gesture and showing Menu
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @State var currTab = "Home"
    //////@Binding var selectedIdx: Int
    
    // Gesture Offset
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        // side bar width
        let sidebarWidth = getRect().width - 90
        
       // NavigationView{
            
            HStack(spacing: 0){
                
                // Side Menu
                SideMenuView(userToken : $userToken,showMenu: $showMenu,groupname: $groupname,userName: $userName,userNick: $userNick)
                
                // Main Tap View
                VStack(spacing: 0){
                    
                    //////MainTapView(selectedIdx: <#T##Int#>)
                    
                    TabView(selection: $currTab){
                        
                        InfoView(userToken: $userToken, namelist: $namelist, maniteename: $maniteename, groupToken: $groupToken, showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Home")
                        
                        MessageView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Message")
                        
                        MissionView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Mission")
 
                    }
                    
                    Divider()
                    
                    // Custom Tab Bar
                    HStack(spacing: 0){
                        
                        // Tab Buttons
                        TabButton(image: "Home")
                        
                        TabButton(image: "Message")
                        
                        TabButton(image: "Mission")
                        //TabButton(image: "house") <- input 으로 이미지 이름 string을 받아야함
                    }
                    .padding(.top, 10)
                }
                .frame(width: getRect().width)
                // BackGround when menu is showing
                .overlay(
                    Rectangle().fill(
                        Color.primary
                            .opacity(Double((offset / sidebarWidth) / 5))
                    )
                    .ignoresSafeArea(.container, edges: .vertical)
                    .onTapGesture{
                        withAnimation{
                            showMenu.toggle()
                        }
                    }
                )
                
            }
            //max Size
            .frame(width: getRect().width + sidebarWidth)
            .offset(x: -sidebarWidth/2)
            .offset(x : offset > 0 ? offset : 0)
            // Gesture
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: {value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value: ))
            )
            
            // no Nav Bar
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
       // } // Nav View
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu){ newValue in
            
            if showMenu && offset == 0{
                offset = sidebarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sidebarWidth{
                offset = 0
                lastStoredOffset = 0
            }
            
        }
        .onChange(of: gestureOffset){ newValue in
            onChange()
        }
    }
    
    func onChange(){
        let sidebarWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sidebarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    func onEnd(value: DragGesture.Value){
        let sidebarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            if translation > 0{
                if translation > (sidebarWidth / 2){
                // side menu 보여주기
                offset = sidebarWidth
                showMenu = true
            }
                else{
                    offset = 0
                    showMenu = false
                }
            }
            else{
                if -translation > (sidebarWidth / 2){
                    offset = 0
                    showMenu = false
                }
                else{
                    offset = sidebarWidth
                    showMenu = true
                }
            }
        }
        
        // storing last offset
        lastStoredOffset = offset
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View{
        Button{
            withAnimation{currTab = image}
        } label: {
            
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22)
                .foregroundColor(currTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
            
        }
        
    } // viewBuillder

}

/*
struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(userToken: .constant("2"), namelist: .constant("2"), maniteename: .constant("2"), groupToken: .constant(3), showMenu: .constant(false), groupname: .constant(["2"]), userName: .constant("2"), userNick: .constant("2"))
    }
}
*/
