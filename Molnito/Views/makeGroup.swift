//
//  makeGroup.swift
//  makeGroup
//
//  Created by 박강우 on 2022/07/18.
//

import SwiftUI

struct makeGroup: View {
    @State var text = ""
    @State var isTapped = false
    @ObservedObject var mgroupVM : GroupViewModel
    @State var member = "2명"
    @State var members = ["2명","3명","4명","5명","6명","7명","8명","9명"]
    @State var dat = "날짜 설정"
    @State var dates = ["날짜 설정","1일","2일","3일","4일","5일","6일","7일"]
    @Binding var masterToken : String
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(spacing:15){
                    TextField("",text: $text){(status) in
                        if status{
                            withAnimation(.easeIn){
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        if text == ""{
                            withAnimation(.easeOut){
                                isTapped = false
                            }
                        }
                    }
                    
                    Button(action: {
                        mgroupVM.setName(text)
                    }, label: {
                        Text("확인")
                            .foregroundColor(.gray)
                        
                    })
                }
                .padding(.top,isTapped ? 15:0)
                
                .background(
                    Text("방 이름")
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x: isTapped ? -7:0,y:isTapped ? -15:0)
                        .foregroundColor(isTapped ? .accentColor : .gray)
                    
                    ,alignment: .leading
                )
                .padding(.horizontal)
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray)
                    .opacity(isTapped ? 1 : 0.5)
                    .frame( height: 1)
                    .padding(.top, 10)
                
            })
            .padding(.top,12)
            .background(Color.gray.opacity(0.09))
            .cornerRadius(5)
            
            Spacer().frame(height:20)
            
            HStack{
                Spacer()
                
                Text("\(text.count)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing)
                    .padding(.top,4)
            }
            VStack{
                HStack{
                    Spacer()
                    Text("마니또 공개일")
                    Spacer()
                    Picker("날짜 설정",selection: $dat) {
                        ForEach(dates,id:\.self){
                            Text($0)
                        }
                    }
                    Spacer()
                    Button(action: {
                        mgroupVM.setHowLong(dat[dat.startIndex].wholeNumberValue ?? 0)
                        mgroupVM.setMasterToken(masterToken)
                    }, label: {
                        Text("확인")
                            .frame(width:50,height: 30)
                            .foregroundColor(.white)
                    })
                    .background(Color("hanyangOrange"))
                    .cornerRadius(8)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("최대 수용 인원")
                    Spacer()
                    Picker("2명",selection: $member) {
                        ForEach(members,id:\.self){
                            Text($0)
                        }
                    }
                    Spacer()
                    Button(action: {
                        mgroupVM.setMaxMember(member[member.startIndex].wholeNumberValue ?? 0)
                        mgroupVM.setToken()
                    }, label: {
                        Text("확인")
                            .frame(width:50,height: 30)
                            .foregroundColor(.white)
                    })
                    .background(Color("hanyangOrange"))
                    .cornerRadius(8)
                    Spacer()
                }
                
                Image("hanyang")
                    .resizable()
                    .frame(width: 350, height: 350)
            }
        }
    }
}

//struct makeGroup_Previews: PreviewProvider {
//    static var previews: some View {
//        makeGroup()
//    }
//}
