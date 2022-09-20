//
//  DevelopersView.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct DevelopersView: View {
    var body: some View{
        
        List{
            VStack(alignment: .leading){
                Image("gangwoo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .center)
                HStack{
                    VStack(alignment: .leading){
                        
                        Text("Back-End, 서버")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        
                        Text("힘들어요".uppercased())
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    Spacer()
                    
                    Text("강우")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color("hanyangBlue"))
                        .lineLimit(3)
                    
                }
                .padding()
                
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
            )
            .padding([.top, .horizontal])
            
            // -------------
            
            VStack(alignment: .leading){
                Image("hhj")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack{
                    VStack(alignment: .leading){
                        
                        Text("Back & Front")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        
                        Text("왜 안돼".uppercased())
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    Spacer()
                    
                    Text("회준")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color("hanyangBlue"))
                        .lineLimit(3)
                    
                }
                .padding()
                
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
            )
            .padding([.top, .horizontal])
            
            
            // -------------
            
            VStack(alignment: .leading){
                Image("yeeun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                HStack{
                    VStack(alignment: .leading){
                        
                        Text("Front-End , UI")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        
                        Text("집 가고 싶어요".uppercased())
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    Spacer()
                    
                    Text("예은")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color("hanyangBlue"))
                        .lineLimit(3)
                    
                }
                .padding()
                
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
            )
            .padding([.top, .horizontal])
            
        }
        
    }
}

struct DevelopersView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopersView()
    }
}
